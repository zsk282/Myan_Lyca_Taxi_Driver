import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../services/CabTypeService.dart';
import '../widgets/SideDrawerWidget.dart';
import '../services/GoogleMapApiService.dart';
import '../resources/UserRepository.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../services/DriverApiService.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';
import 'package:vibration/vibration.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<BookingScreen> createState() => BookingScreenState();
}

enum ConfirmAction { CANCEL, ACCEPT }

class BookingScreenState extends State<BookingScreen> {
  bool loading = true;

  var driverServices = new DriverApiService();
  GoogleMapController mapController;
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  Completer<GoogleMapController> _controller = Completer();
  var location = new Location();
  
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};
  Set<Polyline> get polyLines => _polyLines;
    
  static LatLng latLng;
  LatLng selectedCurrentLocation;
  LatLng selectedDestination;

  LocationData currentLocation;

  bool onCabSelectStep = true;
  bool onPaymentSelectStep = false;
  bool onDriverSideConfirmationStep = false;
  bool rideStarted = false;
  bool isWaitingforUser = false;
  bool goingToPickupLocation = false;

  int tripDistance = 0;

  List deniedTrips = [];

  BitmapDescriptor driverIcon;
  BitmapDescriptor destLocIcon;
  BitmapDescriptor curLocIcon;

  var userRepository = new UserRepository();
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final ValueNotifier<bool> isDriverOnline = new ValueNotifier<bool>(true);

  String selectedCabTypeOption;
  String selectedCabTypeRate;
  bool _cabTypeBtnEnable = false;
  bool waitingForDriverConfirmation = false;
  bool isDriverOnlineflag = false;
  // Map<String, bool> availCabCheckSign = {};
  var apiData;
  var cabTypeData;
  var user;
  var bookingId = null;
  var bookedDriverId = null;
  String selectedChartType = 'Week'; 
  var availableCabsType;
  var cabbookingService = new CabTypeService();
  var tripDetails;
  bool completeTripPOPUPShown = false;

  Timer _bookingTimer;
  // var isDriverOnline = false;
  List<charts.Series> seriesList;
  @override
  void initState(){
    seriesList = _createRandomData();
    loading = true;
    
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(48, 48)), 'assets/images/drop-location.png')
        .then((onValue) {
      destLocIcon = onValue;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(48, 48)), 'assets/images/pick-location.png')
        .then((onValue) {
      curLocIcon = onValue;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(48, 48)), 'assets/images/taxi.png')
        .then((onValue) {
          print('>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<, driver icon generated <<<<<');
      driverIcon = onValue;
    });

    getLocation();

    getUserData();
    
    new Timer.periodic(const Duration(seconds:10), (Timer t) => updateLoctionOfDrivers());
    
    new Timer.periodic(const Duration(seconds:3), (Timer t) => updateCurrentTripStatus());

    location.onLocationChanged.listen((  currentLocation) {
      latLng =  LatLng(currentLocation.latitude, currentLocation.longitude);
      print(" >>>>>>>>> current Location:$latLng <<<<<<<<<<<<");
      
      if(loading){
        setState(() {
          loading = false;
        });
      }
    });

    super.initState();
  }

  getUserData() async {
    var userdata = await userRepository.fetchUserFromDB();
    availableCabsType = await CabTypeService().getAvailableCabs(userdata.auth_key);
    setState((){
      user = userdata;
      // _getCabData();
    });
  }

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();
 
    final desktopSalesData = [
      Sales('Mon', random.nextInt(100)),
      Sales('Tue', random.nextInt(100)),
      Sales('Wed', random.nextInt(100)),
      Sales('Thu', random.nextInt(100)),
      Sales('Fri', random.nextInt(100)),
      Sales('Sat', random.nextInt(100)),
      Sales('Sun', random.nextInt(100)),
    ];
 
    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.red.shadeDefault;
        },
      )
    ];
  }

  Widget earningChart(){
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                // leading: FlutterLogo(size: 56.0),
                title: Text('Total Payout',style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.050)),
                subtitle: Text('17000',style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.050)),
                trailing: DropdownButton<String>(
                  value: selectedChartType,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  // underline: Container(
                  //   height: 2,
                  //   color: Colors.deepPurpleAccent,
                  // ),
                  onChanged: (String newValue) {
                    setState(() {
                      selectedChartType = newValue;
                      _createRandomData();
                      setState(() {
                      });
                    });
                  },
                  items: <String>['Week', 'Month', 'Year']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.50,
              child: charts.BarChart(
                seriesList,
                animate: true,
                vertical: true,
                barGroupingType: charts.BarGroupingType.grouped,
                defaultRenderer: charts.BarRendererConfig(
                  groupingType: charts.BarGroupingType.grouped,
                  strokeWidthPx: 1.0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height* 0.1
            ),
            Container(
              margin: EdgeInsets.only(bottom:MediaQuery.of(context).size.height* 0.015),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      onPressed: (){
                        _asyncWithdrawDialog(context);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height* 0.045,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: Center(
                          child: Text(
                            "WITHDRAW EARNINGS",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.040
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height* 0.02
                  ),
                  Center(
                    child: RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10.0),
                      onPressed: (){
                        print("SHOW TRIP HISTORY PAGE");
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height* 0.045,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: Center(
                          child: Text(
                            "TRIP HISTORY",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.040
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
    
  Widget ratingTab(){
    return Column(
      children: <Widget>[
        Card(
          child: Column(  
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.030
              ),
              Center(child: Text("ALL OVER RATING",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.050,fontWeight: FontWeight.w600))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.010
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle
                  ),
                  child: Text("3",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.30,color: Colors.white)),
                )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.010
              ),
              Center(
                child: RatingBar(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    // color: Colors.amber,
                    color: Colors.red,
                  ),
                  itemSize: MediaQuery.of(context).size.width * 0.060,
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.030
              ),
            ],
          )
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height* 0.10,
                  color: Colors.white,
                  child: Column(  
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(child: Text("0.00",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.050))),
                      SizedBox(height: 10),
                      Center(child: Text("CURRENT RATING",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.030))), 
                    ]
                  )
                )
              ),
            ),
            Expanded(
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height* 0.10,
                  color: Colors.white,
                  child: Column(  
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(child: Text("75 %",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.050))),
                      SizedBox(height: 10),
                      Center(child: Text("REQUESTS ACCEPTED",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.030))), 
                    ]
                  )
                )
              ),
            ),
            Expanded(
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.height* 0.10,
                  color: Colors.white,
                  child: Column(  
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(child: Text("20 %",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.050))),
                      SizedBox(height: 10),
                      Center(child: Text("TRIPS CANCELLED",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.030))), 
                    ]
                  )
                )
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.285
        ),
        Container(
          margin: EdgeInsets.only(bottom:MediaQuery.of(context).size.height* 0.025),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  onPressed: (){
                    print("aaaaaaaa");
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height* 0.045,
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Center(
                      child: Text(
                        "RIDERS FEEDBACK",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.040
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: SideDrawerWidget(),
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "HOME"),
              Tab(text: "EARNINGS"),
              Tab(text: "RATINGS"),
            ],
          ),
          actions: <Widget>[
            Row(
              children: <Widget>[
                Text( isDriverOnlineflag ? "ONLINE" : "OFFLINE",
                  style: TextStyle(
                    color: isDriverOnlineflag ? Colors.green : Colors.grey,
                    fontSize: MediaQuery.of(context).size.width * 0.050,
                    fontWeight: FontWeight.w900
                  ),
                ),
                Switch(
                  value: isDriverOnlineflag,
                  onChanged: (value) async {
                      var temp_res = await driverServices.updateDriverStatusByAccessToken(user.auth_key, (value ? 1 : 0) );

                      isDriverOnlineflag = (temp_res['driver_status'] == "Offline" ? false : true);

                      if(isDriverOnlineflag){
                        if(_bookingTimer == null){
                          _bookingTimer = new Timer.periodic(const Duration(seconds:10), (Timer t) => _asyncBookingConfirmDialog(context));
                        }
                      }else{
                        if(_bookingTimer != null){
                          _bookingTimer.cancel();
                          _bookingTimer = null;
                          rideStarted = false;
                        }
                      }
                      print('Driver is now::  $value');
                      print("rideStarted:: "+ rideStarted.toString());
                      setState(() { });
                  },

                  activeTrackColor: Colors.green, 
                  activeColor: Colors.green,
                )
              ],
            ),           
          ],
        ),
        body: TabBarView(
          children: [
            googleMapDriver(),
            earningChart(),
            ratingTab()
          ],
        ),
      ),
    );

    
    // return Scaffold(
    //   key: _scaffoldKey,
    //   drawer: SideDrawerWidget(),
    //   // appBar: AppBar(),
    //   body: Center(
    //     child: Stack(
    //       children: <Widget>[
    //         googleMap(),
    //         // pickupLocationSearch(),
    //         dropLocationSearch(),
    //         Visibility(
    //           visible: onCabSelectStep,
    //           child: cabTypeWidget(),
    //         ),
    //         Visibility(
    //           visible: onPaymentSelectStep,
    //           child: paymentMethodSelectWidget(),
    //         ),
    //         Visibility(
    //           visible: onDriverSideConfirmationStep,
    //           child: waitingForDriverConfirmationWidget(),
    //         ),
    //         setMyLocation()
    //       ],
    //     ),
    //   )
    // );
  }
  
  resetToCabSelectStep(){
    print("MOVE TO PAYMENT STEP");
    print(tripDistance);
  }

  moveToPaymentStep(){
    print("MOVE TO PAYMENT STEP");
    print(tripDistance);
  }

  getLocation() async {
    if(loading){
      currentLocation = await location.getLocation();
      selectedCurrentLocation = LatLng(currentLocation.latitude, currentLocation.longitude);
      cameraMove(currentLocation.latitude, currentLocation.longitude);
      // _addMarker("cur_loc",LatLng(currentLocation.latitude, currentLocation.longitude)); //removed markers for driver app
    }else{
      // cameraMove(currentLocation.latitude, currentLocation.longitude); //removed markers for driver app
      // _addMarker("cur_loc",latLng);
    }
  }

  void onCameraMove(CameraPosition position) {
    latLng = position.target;
  }

  Future<void> cameraMove(double lat, double lng) async {
    final c = await _controller.future;
    final p = CameraPosition(target: LatLng(lat, lng), zoom: 14);
    c.animateCamera(CameraUpdate.newCameraPosition(p));
}

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  void drawPolylineRequest(LatLng selectedDestination) async {
    Map<String, dynamic> routeData = await _googleMapsServices.getRouteCoordinates(selectedCurrentLocation, selectedDestination);
    createRoute(routeData["route"],routeData["distance"]);
    cameraMove(selectedDestination.latitude, selectedDestination.longitude);
    _addMarker("dest_loc",selectedDestination);
  }

  void createRoute(String encondedPoly, dynamic distance) {
    // set cab type widget back again 
    setState(() {
      onCabSelectStep = true;
      onPaymentSelectStep = false;
    });
    // trip distance used to calculate estimated fares
    tripDistance = distance;
    _polyLines.remove('ongoingTrip');
    _polyLines.add(Polyline(
      polylineId: PolylineId('ongoingTrip'),
      width: 3,
      points: _convertToLatLng(_decodePoly(encondedPoly)),
      color: Colors.black)
    );
  }

  void _addMarker(String markerId, LatLng location){
    BitmapDescriptor icon;
    bool isDraggable = false;

    if(markerId == "cur_loc"){
      icon = curLocIcon;
      isDraggable = true;
    }else if(markerId == "dest_loc"){
      isDraggable = true;
      icon = destLocIcon;
    }else{
      icon = driverIcon;
    }

    setState(() {
      // remove previous markers of this driver
      _markers.removeWhere((m) => m.markerId.value == markerId);
      // add new marker 
      _markers.add(Marker(
          markerId: MarkerId(markerId),
          position: location,
          // infoWindow: InfoWindow(title: address, snippet: "go here"),
          icon: icon,
          draggable: isDraggable,
          onDragEnd: ((value) {
            print(">>>>>>>>>>>>>>>>>> updating current location <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
            if(markerId == "cur_loc" ){
              selectedCurrentLocation = value;
            }
          })
        )
      );
    });
  }

  void updateLoctionOfDrivers() async {
    driverServices.updateDriverLocationByAccessToken(user.auth_key, currentLocation.latitude, currentLocation.longitude);
    // call to update current location instead

    // no need of fetching nearby drivers 
    // var drivers = await cabbookingService.getNearbyCabs(user.auth_key, currentLocation.latitude.toString(), currentLocation.longitude.toString());
    // if(drivers.length > 0){
    //   for(var i=0; i<drivers.length;i++){
    //     if(drivers[i] != null){
    //       print("Updateing Driver "+ drivers[i]["driver_id"] + " <<<<<<<<<<<<<<<<<<<<<<");
    //       _addMarker('driver-'+drivers[i]["driver_id"], LatLng(double.parse(drivers[i]["latitude"]), double.parse(drivers[i]["longitude"])) );
    //     }
    //   }
    // }
  }

  Widget googleMapDriver(){
    return Container(
      child: Stack(
        children: <Widget>[
          googleMap(),
          setMyLocation(),
          totalRideBtn()
        ],
      ),
    );
  }

  Widget totalRideBtn(){
    return Container(
      margin: EdgeInsets.only(bottom:MediaQuery.of(context).size.height* 0.025),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: (!rideStarted && !isWaitingforUser && !goingToPickupLocation),
            child: Center(
              child: RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(10.0),
                onPressed: (){
                    print("THERE IS NO TRIP SO PAGE OPEN");
                    // ride not started means show total ride page
                    Navigator.pushNamed(context, '/TotalRideScreen');
                },
                child: Container(
                  height: MediaQuery.of(context).size.height* 0.045,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Center(
                    child: Text(
                      "TODAY'S TOTAL RIDES",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.040
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: isWaitingforUser,
            child: Center(
              child: RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(10.0),
                onPressed: () async {
                  print(">>>> Trip cancle by driver, user not confiremed till now");
                  await driverServices.updateTrip(user.auth_key,tripDetails["booking_id"], "0");
                  cancleTrip();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height* 0.045,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Center(
                    child: Text(
                      "DENY CURRENT RIDE",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.040
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: goingToPickupLocation,
            child: Center(
              child: RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(10.0),
                onPressed: () async {
                  print(">>>> Trip cancle by driver, user not confiremed till now");
                  await driverServices.updateTrip(user.auth_key,tripDetails["booking_id"], "0");
                  cancleTrip();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height* 0.045,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Center(
                    child: Text(
                      "CANCLE CURRENT RIDE",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.040
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Visibility(
            visible: goingToPickupLocation,
            child: Center(
              child: RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(10.0),
                onPressed: () async {
                  await startTrip();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height* 0.045,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Center(
                    child: Text(
                      "REACHED DROP LOCATION START RIDE",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.040
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: rideStarted,
            child: Center(
              child: RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(10.0),
                onPressed: () async {
                  await completeTrip();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height* 0.045,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Center(
                    child: Text(
                      "END CURRENT TRIP",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.040
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget googleMap(){
    return loading ? Container(color: Colors.white,child: Center(child: CircularProgressIndicator())): GoogleMap(
      myLocationEnabled: true,
      polylines: polyLines,
        markers: _markers,
        mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: latLng,
        zoom: 14.0,
      ),
      myLocationButtonEnabled: false,
      onCameraMove:  onCameraMove,
      onMapCreated: (mapController) {
        _controller.complete(mapController);
      },
      gestureRecognizers: Set()
        ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
        ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
        ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
        ..add(Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer()))
    );
  }

  Widget setMyLocation(){
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.70,
      left: MediaQuery.of(context).size.width * 0.82,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.03),
            onPressed: () {
              getLocation();
              cameraMove(currentLocation.latitude, currentLocation.longitude);
              // drawPolylineRequest();
            },
            child: new Icon(
              Icons.my_location,
              color: Colors.black,
              size: MediaQuery.of(context).size.width * 0.06,
            ),
            shape: new CircleBorder(),
            color: Colors.white,
          )
        ],
      )
    );
  }

  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
     do {
      var shift = 0;
      int result = 0;

      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
       if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

     for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  Future<ConfirmAction> _asyncBookingConfirmDialog(BuildContext context) async {

    var nearbyReq = await driverServices.nearByRequestsByAccessToken(user.auth_key);
    
    var nearbyReqByQRcode = null;

    for(final i in nearbyReq){
      if( !deniedTrips.contains(i["booking_id"]) ){
        if(user.id == i["driver_id"]){
          nearbyReqByQRcode = i;
          nearbyReq = null;
          break; 
        }else{
          if(i["driver_id"] == null){
            nearbyReqByQRcode = null;
            nearbyReq = i;
            break;
          }
        }
      }
    }

    print("DENIED Request>>>>> ");
    print(deniedTrips);
    print("incoming Request>>>>> ");
    print(nearbyReq);
    print(nearbyReqByQRcode);


    // special request to directly start ride with driver
    if(nearbyReqByQRcode != null && !rideStarted && !deniedTrips.contains(nearbyReqByQRcode["booking_id"])){
      Vibration.vibrate(duration: 1000);

      return showDialog<ConfirmAction>(
        context: context,
        barrierDismissible: true, // user must tap button for close dialog!
        builder: (BuildContext context) {
          Future.delayed(Duration(seconds: 7), () {
            // close popup if not closed in next 7 seconds automatically
            Navigator.of(context).pop(ConfirmAction.CANCEL);
          });
          return AlertDialog(
            title: Text('New Booking By Scan Code!',style: TextStyle(fontSize: 30)),
            content: Text(
                'New booking requested from sacnning the QR CODE, passenger must be nearby',style: TextStyle(fontSize: 20)),
            actions: <Widget>[
              RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(10.0),
                child: const Text('Deny Request',style: TextStyle(fontSize: 20)),
                onPressed: () {
                  print("denied REQUEST >>>> " + nearbyReqByQRcode["booking_id"]);
                  deniedTrips.add(nearbyReqByQRcode["booking_id"]); 
                  Navigator.of(context).pop(ConfirmAction.CANCEL);
                },
              ),
              RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                padding: EdgeInsets.all(10.0),
                child: const Text('Start Trip',style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  // hide popup
                  Navigator.of(context).pop(ConfirmAction.ACCEPT);
                  
                  // remove this call when you get new api call to book ride directly
                  await acceptQRRideByDriver(nearbyReqByQRcode);
                },
              )
            ],
          );
        },
      );
    }else if(nearbyReq != null && !rideStarted && !deniedTrips.contains(nearbyReq["booking_id"])){
      Vibration.vibrate(duration: 1000);

      return showDialog<ConfirmAction>(
        context: context,
        barrierDismissible: true, // user must tap button for close dialog!
        builder: (BuildContext context) {
          Future.delayed(Duration(seconds: 7), () {
            // close popup if not closed in next 7 seconds automatically
            Navigator.of(context).pop(ConfirmAction.CANCEL);
          });
          return AlertDialog(
            title: Text('New Booking Nearby!',style: TextStyle(fontSize: 30)),
            content: Text(
                'New booking request from Nearby location, WITHOUT QR CODE',style: TextStyle(fontSize: 20)),
            actions: <Widget>[
              RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                padding: EdgeInsets.all(10.0),
                child: const Text('DENY',style: TextStyle(fontSize: 20)),
                onPressed: () {
                  print("denied REQUEST >>>> " + nearbyReq["booking_id"]);
                  deniedTrips.add(nearbyReq["booking_id"]);
                  Navigator.of(context).pop(ConfirmAction.CANCEL);
                },
              ),
              RaisedButton(
                color: Colors.green,
                textColor: Colors.white,
                padding: EdgeInsets.all(10.0),
                child: const Text('ACCEPT',style: TextStyle(fontSize: 20)),
                onPressed: () async {
                  // hide popup
                  Navigator.of(context).pop(ConfirmAction.ACCEPT);
                  // stop timer until trip completes
                  print("LLLLLLLLLLLLLLLLLLLLLLLLLLLL");
                  await acceptRideByDriver(nearbyReq);
                },
              )
            ],
          );
        },
      );
    }
  }

  acceptRideByDriver(nearbyReq) async {
    // stop timer until trip completes
    if(_bookingTimer != null) {
      _bookingTimer.cancel();
      _bookingTimer = null;
    }
    await driverServices.acceptRideFromDriverEnd(user.auth_key,nearbyReq["booking_id"]);
    tripDetails = await cabbookingService.getBookingIdDataByAccessToken(user.auth_key,nearbyReq["booking_id"]);
    await drawPolylineRequest(LatLng(double.parse(tripDetails['source_lat']), double.parse(tripDetails['source_long'])));
  }

  acceptQRRideByDriver(nearbyReqByQRcode) async {
    // stop timer until trip completes
    if(_bookingTimer != null){
      _bookingTimer.cancel();
      _bookingTimer = null;
    }

    await driverServices.acceptRideFromDriverEnd(user.auth_key,nearbyReqByQRcode["booking_id"]);
    print("trip confimred by Driver >>>>>>>>>");

    tripDetails = await cabbookingService.getBookingIdDataByAccessToken(user.auth_key,nearbyReqByQRcode["booking_id"]);
    
    // rideStarted = true;
    print(tripDetails);

    await drawPolylineRequest(LatLng(double.parse(tripDetails['destination_lat']), double.parse(tripDetails['destination_long'])));
  }

  startTrip() async {
    print(">>>> START Trip By Driver");
    await driverServices.updateTrip(user.auth_key,tripDetails["booking_id"], "1");
    
    await drawPolylineRequest(LatLng(double.parse(tripDetails['destination_lat']), double.parse(tripDetails['destination_long'])));
    
    cameraMove(currentLocation.latitude, currentLocation.longitude);

    setState(() {
      isWaitingforUser = false;
      goingToPickupLocation = false;
      rideStarted = true;
    });
  }

  cancleTrip(){
    _polyLines.clear();
    _markers.removeWhere((m) => m.markerId.value == "dest_loc");
    print(_polyLines);
    rideStarted = false;
    isWaitingforUser = false;
    goingToPickupLocation = false;
    cameraMove(currentLocation.latitude, currentLocation.longitude);
    completeTripPOPUPShown = false;

    if(isDriverOnlineflag){
      if(_bookingTimer == null){
        _bookingTimer = new Timer.periodic(const Duration(seconds:10), (Timer t) => _asyncBookingConfirmDialog(context));
      }
    }else{
      if(_bookingTimer != null){
        _bookingTimer.cancel();
        _bookingTimer = null;
        rideStarted = false;
      }
    }
    tripDetails = null;

    setState(() { });
  }

  completeTrip() async {
    print(">>>> COMPLETE Trip By Driver");
    await driverServices.updateTrip(user.auth_key,tripDetails["booking_id"], "2");
    completedTripPOPup();
  }

  completedTripPOPup(){
    completeTripPOPUPShown = true;

    return showDialog<ConfirmAction>(
        context: context,
        barrierDismissible: true, // user must tap button for close dialog!
        builder: (BuildContext context) {
          // Future.delayed(Duration(seconds: 7), () {
          //   // close popup if not closed in next 7 seconds automatically
          //   Navigator.of(context).pop(ConfirmAction.CANCEL);
          // });
          return AlertDialog(
            title: Center( child:Text('TRIP COMPLETED',style: TextStyle(fontSize: 30))),
            content: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.05
              ),
              width: MediaQuery.of(context).size.height * 0.30,
              height: MediaQuery.of(context).size.height * 0.30,
              decoration: new BoxDecoration(
                  // shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: user != null ? new NetworkImage(
                      "http://mltaxi.codeartweb.com/"+ user.qr_code
                    ) : ""
                  )
              ),
              // child: user != null ? new NetworkImage(
                // "http://mltaxi.codeartweb.com/"+ user.qr_code
              // ) : CircularProgressIndicator(),
            ),
            actions: <Widget>[
              Center(
                child: RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(10.0),
                  child: const Text('Exit Scan Code',style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.of(context).pop(ConfirmAction.CANCEL);
                    cancleTrip();
                  },
                )
              ),
            ],
          );
        },
      );

    // setState(() { });
  }

  updateCurrentTripStatus() async {
    if(tripDetails != null){
      tripDetails = await cabbookingService.getBookingIdDataByAccessToken(user.auth_key, tripDetails["booking_id"]);
      print(">>>>>>>>>>>>>>>> 3 sec trip details <<<<<<<<<<<<<<<<");
      print(tripDetails);
      print(">>>>>>>>>>>>>>>> 3 sec trip details <<<<<<<<<<<<<<<<");

      if(tripDetails["status"] == 0){
        // canclled
        cancleTrip();
      }
      if(tripDetails["status"] == 1){
        // in progress
      }
      if(tripDetails["status"] == 2){
        // completed
        if(!completeTripPOPUPShown){
          completedTripPOPup();
        }
      }
      if(tripDetails["status"] == 3){
        // unavailabel
        // cancleTrip();
      }
      if(tripDetails["status"] == 4){
        // free
        // cancleTrip();
      }
      if(tripDetails["status"] == 5){
        // booking pending
        // cancleTrip();
      }
      if(tripDetails["status"] == 6){
        // accepted by driver
        print("Accepted by DRIVER, waiting for user to confirm");
        setState(() {
          isWaitingforUser = true;
        });
      }
      if(tripDetails["status"] == 7){
        // accepted by users
        setState(() {
          isWaitingforUser = false;
          goingToPickupLocation = true;
        });
      }
    }else{
      print(" >>>>>>>>>>> NO TRIP TO SHOW <<<<<<<<<<<< ");
    }
  }

  Future<String> _asyncWithdrawDialog(BuildContext context) async {
    String teamName = '';
    return showDialog<String>(
      context: context,
      barrierDismissible: true, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter amount to withdraw',style: TextStyle(fontSize: 30)),
          content: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  style: new TextStyle(
                    // color: Colors.white,
                    fontSize:  MediaQuery.of(context).size.width * 0.1,
                    fontWeight: FontWeight.w400
                  ),
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: new InputDecoration(
                    labelStyle: TextStyle(
                      fontSize: 30,
                    ),
                    labelText: 'Amount (K)', hintText: '1100'),
                  onChanged: (value) {
                    teamName = value;
                  },
                )
              )
            ],
          ),
          actions: <Widget>[
            RaisedButton(
              color: Colors.grey,
              textColor: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: const Text('Cancel',style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: const Text('Withdraw',style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.of(context).pop(teamName);
              },
            )
          ],
        );
      },
    );
  }
  @override
  void dispose() {
    _bookingTimer.cancel();
    _bookingTimer = null;
    super.dispose();
  }
}

class Sales {
  final String year;
  final int sales;
 
  Sales(this.year, this.sales);
}
import 'package:flutter/material.dart';

class PaymentTypeWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return PaymentTypeWidgetState();
  }
}

class PaymentTypeWidgetState extends State<PaymentTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return paymentMethodSelectWidget();
  }
  
  Widget paymentMethodSelectWidget(){
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.75,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    "assets/images/pay-mode@3x.png",
                    width: MediaQuery.of(context).size.width * 0.15
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Cash',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    "assets/images/pay-mode@3x.png",
                    width: MediaQuery.of(context).size.width * 0.15
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Cash',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                )
              ],
            ),
            RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              padding: EdgeInsets.all(5.0),
              onPressed: (){
                print('>>>>>>Request to GO button clicked <<<<<<');
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.70,
                child: Center(
                  child: Text(
                    'REQUEST TO GO',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.030
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      )
    );
  }

  Widget availCab(){
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Image.asset(
            "assets/images/car@3x.png",
            width: MediaQuery.of(context).size.width * 0.15
          ),
          Text(
            'ML GO',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.030,
              fontWeight: FontWeight.w900
            ),
          ),
          Text(
            'No Cabs',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.020,
              // fontWeight: FontWeight.w900
            ),
          )
        ]
      )
    );
  }
}
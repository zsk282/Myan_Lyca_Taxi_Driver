import 'dart:async';
import '../validators/mobileNumber.dart';

class LoginBLOC extends Object with MobileNumberValiator{
  final _mobileController = StreamController<String>();

  // get mobile number data from stream
  Stream<String> get mobile => _mobileController.stream.transform(validateMobile);

  // add mobile number to stream
  Function(String) get changeMobile => _mobileController.sink.add;

  dispose(){
    _mobileController.close();
  }
}

final loginBLOC = LoginBLOC();
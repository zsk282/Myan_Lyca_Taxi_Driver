import 'dart:async';

class MobileNumberValiator {
  final validateMobile = StreamTransformer<String, String>.fromHandlers(
    handleData: (mobile,sink){
      if(mobile.length == 10 ){
        print('<<<<<<<<<<<<<<<<<<<<<<<< Added mobile number >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
        sink.add(mobile);
      }else{
        print('<<<<<<<<<<<<<<<<<<<<<<<< ERRRROOORRR mobile number >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
        sink.addError('Mobile Number is less than 10');
      }
    }
  );
}
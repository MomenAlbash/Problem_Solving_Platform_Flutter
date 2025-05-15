import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void NavigatorWithName(BuildContext context, {required String id}) {
  Navigator.pushNamed(context, id);
}

bool validationButtom(GlobalKey<FormState> _formkey, AutovalidateMode autovalidateMode) {
  if (_formkey.currentState!.validate()) {
    _formkey.currentState!.save();
    return true;
  }else{
    autovalidateMode=AutovalidateMode.always;
    return false;
  }
}
void ShowToast({required String message,required toastState state}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: _choseColorState(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum toastState{
  success,error,warning
}

Color _choseColorState(toastState state){
  Color color;
  switch(state){
    case toastState.success:
      color=Colors.green;
      break;
    case toastState.error:
      color=Colors.red;
      break;
    case toastState.warning:
      color=Colors.amber;
      break;
  }
  return color;
}
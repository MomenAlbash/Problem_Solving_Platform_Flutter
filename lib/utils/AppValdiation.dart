class AppValidation{
  static String? passwordValidation(String? value){
    if(value!.isEmpty||value==null){
      return 'field is required';
    }else{
      return  null;
    }
  }


}
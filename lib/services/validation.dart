String validatePassword(String value) {
  Pattern pattern = r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  RegExp regex = new RegExp(pattern);
  if (value.length == 0) {
    return "Password is Required";
  } else if (!regex.hasMatch(value))
    return 'Password required: Alphabet, Number & 8 chars';
  else
    return null;
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (value.length == 0) {
    return "Email is Required";
  } else if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}

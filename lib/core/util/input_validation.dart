
final phoneRegex = RegExp(r'^([0-9]*)$');
final numberRegex = RegExp(r'^([0-9]*)$');
final nameRegex = RegExp(r'^[\w\d\u0621-\u064A\u0660-\u0669 ]*$');
final emailRegex = RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$');

bool confirmPassword(String? pass1, String pass2) {
  if(pass1 == pass2){
    return true;
  }
  return false;
}


bool validPhone(String? value){
  bool isNum = true;
  if (value == null || value.isEmpty) {
    isNum = false;
  }
  else if (!phoneRegex.hasMatch(value)) {
    isNum = false;
  }
  return isNum;
}

bool validNumber(String? value){
  bool isNum = true;
  if (value == null || value.isEmpty) {
    isNum = false;
  }
  else if (!phoneRegex.hasMatch(value)) {
    isNum = false;
  }
  return isNum;
}

bool validPassword(String? value) {

  bool isValid = true;
  if (value == null || value.isEmpty) {
    isValid = false;
  }
  else if (value.length < 8) {
    isValid = false;
  }
  return isValid;
}

bool validName(String? value) {

  bool isValid = true;
  if (value == null || value.isEmpty) {
    isValid = false;
  }
  else if (!nameRegex.hasMatch(value)) {
    isValid = false;
  }
  return isValid;
}

bool validEmail(String? value) {

  bool isValid = true;
  if (value == null || value.isEmpty) {
    isValid = true;
  }
  else if (!emailRegex.hasMatch(value)) {
    isValid = false;
  }
  return isValid;
}

bool isNotEmptyField(String? value) {
  return (value != null && value.isNotEmpty);
} 

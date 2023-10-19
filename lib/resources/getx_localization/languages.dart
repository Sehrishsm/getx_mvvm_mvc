
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'email_hint': 'Enter email',
      'Internet_Exception' : 'we are unable to show result\nPlease check your data\n connection',
      'General_exception' : 'we are unable to process your request. \n please try again',
      'welcome_back' : 'Welcome\n Back',
      'Login_Screen' : 'Login Screen',
      'email_hint': 'Email',
      'Login' : 'Login',
      'password_hint': 'Password',

    },
    'ur_PK':{
      'email_hint': 'ای میل درج کریں'
    },
  };

}
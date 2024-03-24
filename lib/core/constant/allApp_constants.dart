
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:get/get.dart';


String token  = 'fPaf7DKYSTWfKltMPUEY8c:APA91bGPQml05gTqPZ_XYnQ4SyPgyBwyghWAcQ4m17KrjJ7njV3VSNrijy2zyUuKulz5Tk92WvUBBzxyxw_MM3chGOcxNoZewgcunbEuZO2thMaSCUxebiWoMb2ukC7KpAqlOqQ0kv8Q';
const String ENGLISH = 'english';
const String ARABIC = 'arabic';

//login-signup states
const String FORGET_PASSWORD = 'forget';
const String CONFIRM_USER = 'confirm';


//fields
const String USER_NAME = 'username';
const String EMAIL = 'email';
const String PHONE_NUMBER = 'phone number';
const String PASSWORD = 'password';

//start
const String ONBOARDING = 'onBoarding';
const String LANGUAGE = 'lang';

//user_model
const String USER_MODEL = 'user_model';

//response stings 
 const String FAILURE_RESPONSE = 'failure';

 final APP_TOKEN = Get.find<MyServices>().sharedPreferences.getString('token');
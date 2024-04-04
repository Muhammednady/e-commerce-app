
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:get/get.dart';


String token  = 'fPaf7DKYSTWfKltMPUEY8c:APA91bGPQml05gTqPZ_XYnQ4SyPgyBwyghWAcQ4m17KrjJ7njV3VSNrijy2zyUuKulz5Tk92WvUBBzxyxw_MM3chGOcxNoZewgcunbEuZO2thMaSCUxebiWoMb2ukC7KpAqlOqQ0kv8Q';
const String ENGLISH = 'english';
const String ARABIC = 'arabic';

const String ENGLISH_SYMBOL = 'en';
const String ARABIC_SYMBOL = 'ar';

const String LOCALE = 'locale';
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
//favorites-cart
const String favorites_list = 'favorites_list';
const String cart_list = 'cart_list';
//user_model
const String USER_MODEL = 'user_model';

//response stings 
 const String FAILURE_RESPONSE = 'failure';

 final APP_TOKEN = Get.find<MyServices>().sharedPreferences.getString('token');

 //images

const networkImage = 'https://www.freepik.com/free-photo/good-boy-posing-with-decorative-frame_907482.htm#fromView=search&page=1&position=3&uuid=8fb5ffe7-3e92-4d62-a5ce-4cdeb968bf6e';
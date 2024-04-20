
import 'package:ecommerceapp/core/services/myservices.dart';
import 'package:get/get.dart';


String token  = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZmE1OTc5NzBkNmQzOWYyYzE0NjUzYzBkMDdkMDNiMTFhNjgxYjUzZGUxNTRhOGRkZjk2YTAwZjgyNDc4M2FjMTkzZDE0MjRmNjM1OThlMWYiLCJpYXQiOjE3MTMyODc3NjAuNjAyOTc2MDgzNzU1NDkzMTY0MDYyNSwibmJmIjoxNzEzMjg3NzYwLjYwMjk3NzAzNzQyOTgwOTU3MDMxMjUsImV4cCI6MTc0NDgyMzc2MC42MDE0MzcwOTE4MjczOTI1NzgxMjUsInN1YiI6IjQ3OSIsInNjb3BlcyI6W119.V4D166F68lNlw-qhBLuH-1egf9unzRsehtwaIRBoLPLX7Du24J_-07Cmj1OPZbV73wtXIcG010cSMWjGZVD9PztHn1OTdUsgn8Ho7OzKjKByreB37KJVkK6-ykVirgae2dtow7FvEh45J2XTbS7lcJKnpRREClcZvL42KgNbP4muG-d7aTv8s21eIKbtngjpB4NC3VM5dPSmPAU7YvALuXlbIwr4kJSehVDCfyWcddPUDfXr0LqOsgsThA2P017tAdSNSUFvEjTtLoGQa9rA0ZgO3dTaBZTAU8yElFHMGTSQ4WuAmTpdbTowg-tNRj9IHeo6JK0_N3U3-s69eogMKQQqniD95otX2B5gK0-x0XtoJ1gLT7UsT7sZGL1nqHUktRSEdH3U-D44OGkHM2ZZkND-DmpH9XIoZcHSxWIjzSItNxNSxMHhnkCEXhozJRu1XmsBiOel830LoCoOmrwKxQz6raILBr3XZzPNfkUwisHinsqSLov1jIRjxtmCAjhJAcIsPsn-8XBmkOBFt0vmypVLW3dsMqm49b_lqa4jbnrMFlDoBERUT63UN9aLGvbcBxKpWrMb7afzDmFfmvjwsJnn2n5gmBaVZ-rdhLvlByRh65yjmSI0Kd0F4oJMnNxmYwoMkxpNrrRqfEQOw8H6vyMGVbTyETdBeHuDcfDsfok';
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
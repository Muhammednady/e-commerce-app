import 'package:ecommerceapp/core/constant/app_images.dart';
import 'package:ecommerceapp/data/model/categories_model.dart';

import '../../model/onboarding_model.dart';

class AppOnBoardingItems {
  static List<OnBoardingModel> onBoardingItems = [
    OnBoardingModel(
        title: 'choose product',
        imageUrl: AppImagesPath.onBoardingOne,
        desc:
            'we Have a 100k+ products.choose\n your product from our E-\n commerce shop'),
    OnBoardingModel(
        title: 'Easy & Safe Product',
        imageUrl: AppImagesPath.onBoardingTwo,
        desc:
            'Easy Checkout & Safe Payment\n method.Trusted by our customers\n from all over the world.'),
    OnBoardingModel(
        title: 'Track Your Order',
        imageUrl: AppImagesPath.onBoardingThree,
        desc:
            'Best Tracker has been Used for\n Track your order.You\'ll know where \n your product is at the moment.'),
    OnBoardingModel(
        title: 'Fast Delivery',
        imageUrl: AppImagesPath.onBoardingFour,
        desc:
            'Reliable And Fast Delivery.We\n Deliver your product the fastest\n way possible.'),
  ];
}

class CategoriesImages {

   static  List<CategoriesModel> blackImages = [
    CategoriesModel(image: AppImagesPath.phone, title: 'phone'),
     CategoriesModel(image: AppImagesPath.camera, title: 'camera'),
     CategoriesModel(image: AppImagesPath.laptop, title: 'laptop'),
     CategoriesModel(image: AppImagesPath.shoe, title: 'sneakers'),
     CategoriesModel(image: AppImagesPath.dress, title: 'dress'),

  ];

  static  List<CategoriesModel> coloredImages = [
    CategoriesModel(image: AppImagesPath.phone1, title: 'phone'),
    CategoriesModel(image: AppImagesPath.camera1, title: 'camera'),
    CategoriesModel(image: AppImagesPath.laptop1, title: 'laptop'),
    CategoriesModel(image: AppImagesPath.shoe1, title: 'sneakers'),
    CategoriesModel(image: AppImagesPath.dress1, title: 'dress'),
  ];
}

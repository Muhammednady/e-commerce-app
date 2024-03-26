import 'package:flutter/cupertino.dart';

import '../../../core/constant/colors.dart';
import '../../../data/datasources/constant/constant.dart';
import '../../../data/model/categories_model.dart';

class CustomCategories extends StatelessWidget{
  final List<CategoriesModel> blackImages;

  const CustomCategories({super.key, required this.blackImages});
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      height: 110.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: blackImages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Image.asset(
                        alignment: AlignmentDirectional.center,
                        height: 60.0,
                        width: 60.0,
                        blackImages[index].image),
                  ),
                  Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.3),
                        borderRadius:
                        BorderRadiusDirectional.circular(20.0)),
                  )
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                blackImages[index].title,
                style: const TextStyle(fontSize: 15.0),
              )
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10.0,
        ),
      ),
    );
  }

}
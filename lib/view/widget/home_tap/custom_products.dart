import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../data/model/products_model.dart';

class CustomProducts extends StatelessWidget{
  final List<Products> products;

  const CustomProducts({super.key, required this.products});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.yellow,
      height: 130.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 10, top: 10),
                child: Image.network(
                  alignment: AlignmentDirectional.center,
                  height: 100.0,
                  width: 100.0,
                  products[index].image!,
                  //fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius:
                    BorderRadiusDirectional.circular(15.0)),
              ),
              Padding(
                padding:
                const EdgeInsets.only(top: 5.0, left: 5.0),
                child: Text(
                  textAlign: TextAlign.center,
                   products[index].name!
                      .substring(0, 20),
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.white),
                ),
              ),
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
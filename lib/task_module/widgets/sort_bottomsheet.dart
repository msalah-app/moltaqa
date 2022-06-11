import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moltaqa/constant.dart';
import 'package:moltaqa/styles/size_config.dart';
import 'package:moltaqa/styles/themes/app_theme.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 45,
      color: greyColor,
      //could change this to Color(0xFF737373),
      //so you don't have to change MaterialApp canvasColor
      child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 15),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: PublicText(
                    text: "Sort",
                    textTheme: text16.copyWith(
                        color: redTextColor),
                  )),
              PublicText(
                text: "New in ",
                textTheme: text16.copyWith(color: greyColor)
              ),
              divider(),
              PublicText(
                text: "Price Low to High",
                textTheme: text16
              ),
              divider(),
              PublicText(
                text: "Price High to Low ",
                textTheme: text16
              ),
              divider(),
              PublicText(
                text: "Best Rating",
                textTheme: text16
              ),
              divider(),
              PublicText(
                text: "Name Asc",
                textTheme: text16
              ),
              divider(),
              PublicContainer(
                borderRadius: const BorderRadius.all(
                    Radius.circular(35)),
                color: lightRedColor,
                child: PublicText(padding: EdgeInsets.zero,
                  text: "Save",
                  textTheme: text16.copyWith(
                      color: whiteColor),
                ),
                height: SizeConfig.heightMultiplier * 5,
                width: SizeConfig.widthMultiplier * 35,
                margin: const EdgeInsets.symmetric(vertical: 30),
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(onPressed: (){
                  Get.back();
                }, child:  PublicText(
                    text: "Close",
                    textTheme: text16),),
              )
            ],
          )),
    );
  }
}

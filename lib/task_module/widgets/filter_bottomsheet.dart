import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moltaqa/constant.dart';
import 'package:moltaqa/styles/size_config.dart';
import 'package:moltaqa/styles/themes/app_theme.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({Key? key}) : super(key: key);
  List<String> filters = [
    "category",
    "Brand",
    "Tags",
    "Material",
    "Size",
    "Colors",
    "Collection",
    "Price",
  ];
  List<String> filtersBy = [
    "Name",
    "Name",
    "Name",
    "Name",
    "Name",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 100,
      color: greyColor,
      child: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PublicText(
                      text: "Filter",
                      textTheme: text16.copyWith(color: redTextColor),
                    ),
                    PublicText(
                      text: "Reset",
                      textTheme: text16.copyWith(color: greyColor),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 40,
                  child: ListView.builder(
                    itemCount: filters.length,
                    itemBuilder: (context, index) => Flex(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: Axis.vertical,
                      children: [
                        PublicText(
                          textAlign: TextAlign.start,
                          padding: EdgeInsets.zero,
                          text: filters[index],
                          textTheme: text12.copyWith(color: greyColor),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 5.5,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (c, i) => ChoiceChip(
                              label: PublicText(
                                padding: EdgeInsets.zero,
                                text: filtersBy[i],
                                textTheme: text8,
                              ),
                              selected: true,
                            ),
                            itemCount: filtersBy.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                CheckboxListTile(
                  value: false,
                  onChanged: (c) {},
                  title: PublicText(
                      text: "Free Shipping",
                      textTheme: text12.copyWith(
                          color: blackTextColor,
                          fontWeight: FontWeight.normal)),
                ),
                PublicContainer(
                  borderRadius: const BorderRadius.all(Radius.circular(35)),
                  color: lightRedColor,
                  child: PublicText(
                    padding: EdgeInsets.zero,
                    text: "Filter",
                    textTheme: text16.copyWith(color: whiteColor),
                  ),
                  height: SizeConfig.heightMultiplier * 5,
                  width: SizeConfig.widthMultiplier * 35,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                ),
              ],
            )),
      ),
    );
  }
}

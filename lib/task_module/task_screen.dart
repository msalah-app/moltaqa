import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moltaqa/constant.dart';
import 'package:moltaqa/styles/size_config.dart';
import 'package:moltaqa/styles/themes/app_theme.dart';
import 'package:moltaqa/task_module/products_model.dart';
import 'package:moltaqa/task_module/task_controller.dart';
import 'package:moltaqa/task_module/widgets/filter_bottomsheet.dart';
import 'package:moltaqa/task_module/widgets/product_card.dart';
import 'package:moltaqa/task_module/widgets/sort_bottomsheet.dart';

class TaskScreen extends GetView<ProductsController> {
  TaskScreen({
    Key? key,
  }) : super(key: key);
  List brandsList = [
    redTextColor,
    whiteColor,
    redTextColor,
    whiteColor,
    redTextColor,
    whiteColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: RichText(
            text: TextSpan(
                text: "Fashion ",
                style: text16.copyWith(color: redTextColor),
                children: [
                  TextSpan(
                      text: " 122 items",
                      style: text10.copyWith(
                        fontWeight: FontWeight.w100,
                      ))
                ]),
          ),
          bottom: PreferredSize(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.bottomSheet(BottomSheet(
                          onClosing: () {},
                          builder: (context) {
                            return const SortBottomSheet();
                          }));
                    },
                    icon: Icon(
                      Icons.sort,
                      color: greyColor,
                      size: SizeConfig.widthMultiplier * 6,
                    )),
                IconButton(
                    onPressed: () {
                      Get.bottomSheet(BottomSheet(
                          onClosing: () {},
                          builder: (context) {
                            return  FilterBottomSheet();
                          }));
                    },
                    icon: Icon(
                      Icons.filter_alt,
                      color: greyColor,
                      size: SizeConfig.widthMultiplier * 6,
                    )),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.list_rounded,
                      color: greyColor,
                      size: SizeConfig.widthMultiplier * 6,
                    )),
              ],
            ),
            preferredSize: Size(0.0, SizeConfig.heightMultiplier * 4),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_rounded,
                  color: greyColor,
                  size: SizeConfig.widthMultiplier * 6,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bell,
                  color: redTextColor,
                  size: SizeConfig.widthMultiplier * 6,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: greyColor,
                  size: SizeConfig.widthMultiplier * 6,
                )),
          ],
          leading: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Icon(Icons.arrow_back_ios, color: greyColor)),
          leadingWidth: SizeConfig.widthMultiplier,
        ),
        body: SafeArea(
            child: RefreshIndicator(
          onRefresh: () => Future.sync(() {
            controller.refreshIndicate();
          }),
          child: Obx(
            () => controller.isLoading.value == true
                ? Center(
                    child: loadingWidgetMaker(),
                  )
                : Flex(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: SizeConfig.heightMultiplier * 8,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: brandsList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CircleAvatar(
                                backgroundColor: brandsList[index],
                                radius: SizeConfig.widthMultiplier * 6,
                              );
                            }),
                      ),

                      /// product list
                      Flexible(
                        child: PagedGridView<int, ProductData>(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            pagingController:
                                controller.productsPagingController,
                            shrinkWrap: true,
                            builderDelegate:
                                PagedChildBuilderDelegate<ProductData>(
                              noItemsFoundIndicatorBuilder: (_) =>
                                  noDataFound(),
                              firstPageProgressIndicatorBuilder: (_) =>
                                  loadingWidgetMaker(),
                              newPageProgressIndicatorBuilder: (_) =>
                                  loadingWidgetMaker(),
                              itemBuilder: (context, data, index) =>
                                  ProductCard(
                                imageUrl: data.image,
                                productName: data.name,
                                productBrandName: data.brand.name,
                                priceBefore: " ${data.price}",
                                priceAfter: " ${data.price}",
                                isFav: data.isFavorite,
                                salePercent: data.salePercentage,
                              ),
                            )),
                      ),
                    ],
                  ),
          ),
        )));
  }
}

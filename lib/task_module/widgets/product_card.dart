import 'package:flutter/material.dart';
import 'package:moltaqa/constant.dart';
import 'package:moltaqa/styles/size_config.dart';
import 'package:moltaqa/styles/themes/app_theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
        this.imageUrl,
        this.productName,
        this.productBrandName="",
        this.priceAfter,
        this.isOnSale,
        this.isFav,
        this.salePercent,
        this.priceSymbol,
        this.priceBefore})
      : super(key: key);
  final String? imageUrl;
  final String? productName;
  final String? productBrandName;
  final String? priceAfter;
  final String? priceBefore;
  final String? salePercent;
  final String? priceSymbol;
  final bool? isFav;
  final bool? isOnSale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8,bottom: 3,right: 2),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: <Widget>[
              Container(
                  decoration:  const BoxDecoration(color: Colors.white),
                  alignment: Alignment.center,
                  height: SizeConfig.heightMultiplier*11,
                  child:Image.network(imageUrl!,fit: BoxFit.fill,errorBuilder: (context,c,stack){
                    return Image.asset("assets/de.jpg");
                  },loadingBuilder:(context,w,image)=>loadingWidgetMaker() ,)
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      isFav! ? Icons.favorite : Icons.favorite_border_outlined,
                      color: redTextColor,
                    )),
              ) ,
              Align(
                alignment: Alignment.topLeft,
                child:Container(
                  margin: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: lightBlueColor,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(5), )),
                  child: Column(
                    children: [
                      Icon(
                        Icons.bolt,
                        color: lightRedColor,
                        size: SizeConfig.widthMultiplier*5,
                      ),
                      Text(
                        salePercent!,
                        style: text10,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          PublicText(text: productName!,textTheme: text16,padding: EdgeInsets.zero),
          PublicText(text: productBrandName??"ZARA",textTheme: text10.copyWith(color: greyColor,decoration: TextDecoration.lineThrough),textAlign: TextAlign.start,padding: EdgeInsets.zero),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: "${priceSymbol??"EGP"} $priceAfter",
                    style: text14,
                    children: [
                      TextSpan(
                          text: "\n${priceSymbol??"EGP"} $priceBefore",
                          style: text12.copyWith(color: greyColor,
                              fontWeight: FontWeight.w100,
                              decoration: TextDecoration.lineThrough))
                    ]),
              ),
              CircleAvatar(
                backgroundColor: redTextColor,
                radius: SizeConfig.widthMultiplier * 4,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: whiteColor,size: 18
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
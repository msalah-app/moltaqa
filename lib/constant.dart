import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:moltaqa/styles/themes/app_theme.dart';


TextStyle textStyle = TextStyle(
  color: textColor,
  fontSize: 18,
);
// Gradient backGroundGradient = LinearGradient(
//   begin: const FractionalOffset(0.0, 0.0),
//   // tileMode: TileMode.clamp,
//   end: const FractionalOffset(0.0, 0.3),
//   colors: [
//     lightMainColor,
//     backGroundColor,
//   ],
// );

class Reusable {
  // static initScreenDims(BuildContext context, Orientation? oreint) {
  //   Orientation? oreint = MediaQuery.of(context).orientation;
  //   Size checkOreint() {
  //     Size size;
  //     oreint == Orientation.portrait
  //         ? size = Size(MediaQuery.of(context).size.width,
  //             MediaQuery.of(context).size.height)
  //         : size = Size(MediaQuery.of(context).size.height,
  //             MediaQuery.of(context).size.width);
  //     return size;
  //   }
  //
  //   Size size = checkOreint();
  //   ScreenUtil.init(
  //     BoxConstraints(
  //         maxHeight: MediaQuery.of(context).size.height,
  //         maxWidth: MediaQuery.of(context).size.width),
  //     designSize: size,
  //     orientation: oreint,
  //   );
  // }

  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static Widget sperator() {
    return Container(
      width: double.infinity,
      height: 0.5,
      color: Colors.grey.withOpacity(0.8),
    );
  }
}

class AppButton extends StatefulWidget {
  const AppButton(
      {Key? key,
      required this.onPressed,
      required this.myText,
      required this.backGroundColor,
      required this.textColor,
      this.width,
      this.textTheme,
      this.fontWeight = FontWeight.bold,
      // required this.fontSize,
      required this.iconPath,
      this.showIcon,
      this.padding})
      : super(key: key);

  final Function()? onPressed;
  final String myText;
  final Color backGroundColor;
  final Color textColor;
  final double? width;
  final String iconPath;
  final bool? showIcon;

  // final double fontSize;
  final TextStyle? textTheme;
  final FontWeight fontWeight;

  final EdgeInsets? padding;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: RaisedButton(
        onPressed: widget.onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: widget.backGroundColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: PublicText(
                text: widget.myText,
                textAlign: TextAlign.center,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                textTheme: widget.textTheme?.copyWith(
                    color: widget.textColor, fontWeight: widget.fontWeight)),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.showIcon,
    required this.height,
    required this.icon,
  }) : super(key: key);

  final String hintText;
  final double height;
  final bool showIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconData icon;

  // final String? Function(String?) onValidate ;

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool isPassword;

  @override
  void initState() {
    widget.showIcon == true ? isPassword = true : isPassword = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width * .75,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: whiteColor,
        // border: Border.all(width: 1.5,color: bottomNavigationColor),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextField(
        obscureText: isPassword,

        style: Theme.of(context).textTheme.caption,
        // TextStyle(
        //     color: blackColor,
        //     fontSize: 12,
        //     fontWeight: FontWeight.bold,
        //   ),
        // validator: widget.onValidate,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        textInputAction: TextInputAction.next,
        textAlignVertical: TextAlignVertical.center,
        // cursorHeight: 20,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          hintStyle: text8.copyWith(color: greyColor),
          suffixIcon: Visibility(
            visible: widget.showIcon == true ? true : false,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
              icon: Icon(
                isPassword == true
                    ? Icons.remove_red_eye
                    : Icons.visibility_off,
                color: greyColor,
                size: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//
// Widget changeLanguageIcon(
//     BuildContext context, bool backVisibility, bool translationVisibility) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     textDirection: TextDirection.ltr,
//     children: [
//       Visibility(
//         visible: backVisibility ? true : false,
//         child: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: CircleAvatar(
//             child: Icon(
//               Icons.arrow_back,
//               size: 20.0,
//               textDirection: TextDirection.ltr,
//               color: backGroundColor,
//             ),
//             radius: 15,
//             backgroundColor: whiteColor,
//           ),
//         ),
//       ),
//       Visibility(
//         visible: translationVisibility ? true : false,
//         child: GetBuilder<AppLanguageController>(
//             init: AppLanguageController(),
//             builder: (controller) {
//               return InkWell(
//                 onTap: () {
//                   Get.defaultDialog(
//                     title: "choose_language".tr,
//                     backgroundColor: backGroundColor,
//                     titleStyle: TextStyle(color: orangeColor),
//                     barrierDismissible: true,
//                     radius: 50,
//                     content: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         TextButton(
//                           child: PublicText(
//                             textTheme: text18,
//                             // size: 18,
//                             text: "تغيير الى اللغة العربية",
//                             color: whiteTextColor,
//                           ),
//                           onPressed: () {
//                             if (Get.locale.toString() == 'ar') {
//                               navigator!.pop();
//                               return;
//                             }
//                             controller.changeLanguage('ar');
//                             Get.updateLocale(const Locale('ar'));
//                             // Get.back();
//                             navigator!.pop();
//                           },
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           child: Divider(
//                             thickness: 1,
//                             color: goldColor,
//                             height: 1,
//                           ),
//                         ),
//                         TextButton(
//                           child: PublicText(
//                             // size: 18,
//                             textTheme: text18,
//                             text: "Set Language to English",
//                             color: whiteTextColor,
//                           ),
//                           onPressed: () {
//                             if (Get.locale.toString() == 'en') {
//                               navigator!.pop();
//                               return;
//                             }
//                             controller.changeLanguage('en');
//                             Get.updateLocale(const Locale('en'));
//                             navigator!.pop();
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 child: Image.asset(
//                   Images.languageIcon,
//                   color: whiteColor,
//                   height: 30,
//                 ),
//               );
//             }),
//       ),
//     ],
//   );
// }

// class CircleButton extends StatefulWidget {
//   CircleButton(
//       {Key? key,
//         // required this.onPressed,
//         // required this.myText,
//         // required this.backGroundColor,
//         // required this.textColor,
//         // this.width,
//         // required this.fontSize,
//         // required this.iconPath,
//         // this.showIcon,
//         // this.padding
//       })
//       : super(key: key);
//   // final Function()? onPressed;
//   // final String myText;
//   // final Color backGroundColor;
//   // final Color textColor;
//   // final double? width;
//   // final String iconPath;
//   // final bool? showIcon;
//   // double fontSize;
//   // final EdgeInsets? padding;
//
//   @override
//   State<CircleButton> createState() => _CircleButtonState();
// }
//
// class _CircleButtonState extends State<CircleButton> {
//   @override
//   Widget build(BuildContext context) {
//     Reusable.initScreenDims(context, MediaQuery.of(context).orientation);
//     return RawMaterialButton(
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       elevation: 2.0,
//       fillColor: whiteColor,
//       child:  Icon(
//         Icons.arrow_back,
//         size: 25.0.r,
//         color: backGroundColor,
//       ),
//       shape: const CircleBorder(),
//     );
//   }
// }
Widget noInternet(Function()? onPressed) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wifi_off_rounded,
          color: redTextColor,
          size: 120,
        ),
        PublicText(
          // size: 20,
          textTheme: text16,
          text: 'internet_connection'.tr,
          color: redTextColor,
          padding: const EdgeInsets.only(top: 10, bottom: 50),
        ),
        AppButton(
            onPressed: onPressed,
            myText: 'retry'.tr,
            width: 150,
            backGroundColor: greyColor,
            textColor: whiteColor,
            textTheme: text14,
            iconPath: '')
      ],
    ),
  );
}

Widget noDataFound() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     Icon(
        Icons.cruelty_free,
        color: redTextColor,
        size: 160,
      ),
      const SizedBox(
        height: 10,
      ),
      PublicText(
        textTheme: text16,
        text: 'no_data_found'.tr,
        color: whiteTextColor,
      ),
    ],
  );
}

// Widget cachedImages(String image, double width, double height, double radius,
//     BoxFit boxFit, padding, margin) {
//   return CachedNetworkImage(
//     imageUrl: image,
//     imageBuilder: (context, imageProvider) => Container(
//       width: width,
//       height: height,
//       padding: padding,
//       margin: margin,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(radius),
//         image: DecorationImage(fit: boxFit, image: imageProvider),
//       ),
//     ),
//     placeholder: (context, url) => loadingWidgetMaker(),
//     errorWidget: (context, url, error) =>
//         Icon(Icons.error, color: whiteColor, size: 70),
//   );
// }

Widget loadingWidgetMaker() {
  return Container(
    alignment: Alignment.center,
    height: 50,
    child: CircularProgressIndicator(
      backgroundColor: redTextColor,
      strokeWidth: 5,
      color: Colors.white,
    ),
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

// void showCustomDialog(
//     BuildContext context, Function() onPressedConfirm, String title) {
//   showGeneralDialog(
//     barrierLabel: "LogOut Dialog",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: const Duration(milliseconds: 400),
//     context: context,
//     pageBuilder: (_, __, ___) {
//       return Align(
//         alignment: Alignment.center,
//         child: Container(
//           height: 200,
//           child: Container(
//             padding: const EdgeInsets.only(top: 25, bottom: 25),
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               color: lightMainColor,
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(title,
//                     style: TextStyle(
//                         color: textColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18)),
//                 // SizedBox(
//                 //   height: 80,
//                 // ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.only(left: 20, right: 20),
//                         alignment: Alignment.center,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               color: Colors.grey.shade300,
//                               offset: const Offset(
//                                   0, 1), // changes position of shadow
//                             ),
//                           ],
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.white,
//                         ),
//                         child: SizedBox(
//                           width: double.infinity,
//                           height: double.infinity,
//                           child: AppButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             myText: tr('cancel'),
//                             textColor: Colors.black,
//                             fontSize: 19.sp,
//                             backGroundColor: Colors.grey,
//                             iconPath: '',
//                             width: MediaQuery.of(context).size.width,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.only(left: 20, right: 20),
//                         alignment: Alignment.center,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               color: Colors.grey.shade300,
//                               offset: const Offset(
//                                   0, 1), // changes position of shadow
//                             ),
//                           ],
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.white,
//                         ),
//                         child: SizedBox(
//                           width: double.infinity,
//                           height: double.infinity,
//                           child: TextButton(
//                               onPressed: onPressedConfirm,
//                               child: Text(
//                                 tr('confirm'),
//                                 style: const TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               )),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           margin: const EdgeInsets.only(left: 20, right: 20),
//         ),
//       );
//     },
//     transitionBuilder: (_, anim, __, child) {
//       return SlideTransition(
//         position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
//             .animate(anim),
//         child: child,
//       );
//     },
//   );
// }

//
class PublicContainer extends StatelessWidget {
  const PublicContainer(
      {Key? key,
      this.onPressed,
      required this.child,
      required this.color,
      required this.padding,
      this.width,
      this.borderRadius = const BorderRadius.all(Radius.circular(10)),
      this.height,
      this.margin})
      : super(key: key);

  final Function()? onPressed;
  final Widget child;
  final Color color;
  final EdgeInsets padding;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        child: Center(child: child),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: borderRadius,
            color: color),
      ),
    );
  }
}

class WrapContainer extends StatelessWidget {
  const WrapContainer({
    Key? key,
    required this.title,
    required this.padding,
    required this.margin,
  }) : super(key: key);
  final String title;
  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: lightRedColor),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: text10,
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'تحت رعاية',
            style: TextStyle(
                fontSize: 14,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold),
          ),
          Image.asset('images/logo.png')
        ],
      ),
    );
  }
}

void dismissSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
}

// void showSnackBar(String title, BuildContext context, int success) {
//   showTopSnackBar(
//     context,
//     success == 0
//         ? CustomSnackBar.error(
//             message: title,
//             iconRotationAngle: 0,
//             iconPositionLeft: 30,
//             icon: Icon(
//               Icons.report_gmailerrorred_sharp,
//               color: whiteColor,
//               size: 0,
//             ),
//             textStyle: TextStyle(
//                 fontSize: 18, fontWeight: FontWeight.bold, color: whiteColor),
//           )
//         : success == 1
//             ? CustomSnackBar.success(
//                 message: title,
//                 iconRotationAngle: 0,
//                 iconPositionLeft: 30,
//                 icon: Icon(
//                   Icons.check_circle_outline,
//                   color: whiteColor,
//                   size: 35,
//                 ),
//                 textStyle: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: whiteColor),
//               )
//             : CustomSnackBar.info(
//                 message: title,
//                 iconRotationAngle: 0,
//                 iconPositionLeft: 30,
//                 icon: Icon(
//                   Icons.report_gmailerrorred_sharp,
//                   color: whiteColor,
//                   size: 35,
//                 ),
//                 textStyle: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: whiteColor),
//               ),
//   );
// }

class PublicText extends StatelessWidget {
  const PublicText(
      {Key? key,
      // this.size,
      this.color,
      this.fontWeight = FontWeight.bold,
      this.textOverflow = TextOverflow.ellipsis,
      required this.text,
      this.textTheme,
      this.maxLines,this.textDecorat,
      this.padding = const EdgeInsets.symmetric(vertical: 5),
      this.textAlign = TextAlign.center,
      this.textDirection})
      : super(key: key);

  final Color? color;

  // final double ?size;
  final int? maxLines;
  final FontWeight? fontWeight;

  final String text;
  final TextDirection? textDirection;
  final EdgeInsets padding;
  final TextStyle? textTheme;
  final TextDecoration? textDecorat;

  final TextAlign textAlign;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(text,
          textAlign: textAlign,
          textScaleFactor: 1.0,
          maxLines: maxLines ?? 1,
          overflow: textOverflow,
          style: textTheme?.copyWith(color: color, fontWeight: fontWeight,decoration:textDecorat )),
    );
  }
}

bool isPortrait(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.portrait) {
    return true;
  } else {
    return false;
  }
}

// class MoreScreenItem extends StatelessWidget {
//   const MoreScreenItem(
//       {Key? key,
//       required this.text,
//       required this.widget,
//       this.onPressed,
//       this.textTheme,
//       required this.iconContainerHeight,
//       required this.iconContainerWidth,
//       required this.textContainerHeight,
//       required this.textContainerWidth,
//       this.fontWeight = FontWeight.bold,
//       required this.textColor,
//       required this.iconContainerColor})
//       : super(key: key);
//
//   final String text;
//   final Widget widget;
//   final Function()? onPressed;
//   final Color iconContainerColor;
//   final double iconContainerHeight;
//   final double iconContainerWidth;
//   final double textContainerHeight;
//   final double textContainerWidth;
//   final Color textColor;
//   final FontWeight fontWeight;
//   final TextStyle? textTheme;
//
//   @override
//   Widget build(BuildContext context) {
//     return Bouncing(
//         onTap: onPressed,
//         widget: Container(
//           decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(15),
//               ),
//               border: Border.all(color: greyTextColor, width: 1.5)),
//           height: 55,
//           padding: const EdgeInsets.all(8),
//           margin: const EdgeInsets.symmetric(horizontal: 25),
//           width: double.infinity,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             textDirection: ui.TextDirection.ltr,
//             children: [
//               CircleAvatar(
//                 child: Center(child: widget),
//                 backgroundColor: lightRedColor,
//               ),
//               PublicText(
//                 textTheme: text12,
//                 text: text,
//                 color: whiteTextColor,
//                 padding: EdgeInsets.symmetric(horizontal: 5),
//               ),
//             ],
//           ),
//         ));
//   }
// }

Widget divider() {
  return Divider(
    thickness: 1,
    color: blackColor,
    height: 1,
  );
}

class EffectOnPressed extends StatelessWidget {
  const EffectOnPressed(
      {Key? key,
      this.color,
      required this.borderRadius,
      this.onPressed,
      this.width,
      this.height,
      required this.widget,
      required this.margin})
      : super(key: key);

  // final double size;
  final BorderRadius borderRadius;
  final double? width;
  final double? height;
  final Color? color;
  final Widget widget;
  final Function()? onPressed;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius,
        highlightColor: lightRedColor,
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
          child: widget,
        ),
      ),
    );
  }
}

// class Bouncing extends StatelessWidget {
//   const Bouncing(
//       {Key? key,
//         this.onTap,
//         required this.widget})
//       : super(key: key);
//
//   final Function()? onTap;
//   final Widget widget;
//
//   @override
//   Widget build(BuildContext context) {
//     return Bounce(
//         duration: const Duration(milliseconds: 150),
//     onPressed:onTap!,
//     child: widget,
//     );
//   }
// }

// class CourseDesign extends StatelessWidget {
//   const CourseDesign(
//       {Key? key,
//       required this.image,
//       required this.offeredPrice,
//       this.videoCount,
//       this.quizCount,
//       this.onTap,
//       this.context,
//       this.width,
//       required this.title,
//       required this.doctorName,
//       required this.price,
//       required this.rate})
//       : super(key: key);
//
//   final BuildContext? context;
//   final double? width;
//   final Function()? onTap;
//   final String image;
//   final String title;
//   final String doctorName;
//   final String price;
//   final String offeredPrice;
//   final int? videoCount;
//   final int? quizCount;
//   final double rate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Bouncing(widget:
//     Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         borderRadius: const BorderRadius.all(Radius.circular(20.0)),
//         border: Border.all(width: 1.5, color: bottomNavigationColor),
//       ),
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       height: 120,
//       width: width!,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           cachedImages(image, 80, 80, 12, BoxFit.fill, EdgeInsets.zero,
//               const EdgeInsets.symmetric(horizontal: 8)),
//           const SizedBox(
//             width: 5,
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 PublicText(
//                   textTheme: text14.copyWith(
//                       color: whiteTextColor, fontWeight: FontWeight.w700),
//                   text: title,
//                   padding: const EdgeInsets.symmetric(vertical: 0.0),
//                 ),
//                 PublicText(
//                   textTheme: text12.copyWith(
//                       color: whiteTextColor, fontWeight: FontWeight.w700),
//                   text: 'dr'.tr + doctorName,
//                   padding: const EdgeInsets.symmetric(vertical: 0.0),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: RatingBarIndicator(
//                     rating: rate,
//                     itemBuilder: (context, index) => const Icon(
//                       Icons.star,
//                       color: kColorRatingStar,
//                     ),
//                     itemCount: 5,
//                     itemSize: 16.0,
//                     itemPadding: const EdgeInsets.symmetric(horizontal: 3),
//                     unratedColor: greyColor,
//                     direction: Axis.horizontal,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Container(
//           //   height: double.infinity,
//           //   padding: const EdgeInsets.symmetric(horizontal: 3),
//           //   decoration: GetStorage().read('lang') == 'en'?
//           //   BoxDecoration(
//           //     borderRadius: const BorderRadius.only(
//           //       bottomRight: Radius.circular(12),
//           //       topRight: Radius.circular(12),
//           //     ),
//           //     color: mainColor
//           //   ) :
//           //   BoxDecoration(
//           //       borderRadius: const BorderRadius.only(
//           //         bottomLeft: Radius.circular(12),
//           //         topLeft: Radius.circular(12),
//           //       ),
//           //       color: mainColor
//           //   ),
//           //   child: Icon(
//           //     Icons.arrow_forward_ios,
//           //     size: 20,
//           //     color: whiteColor,
//           //   ),
//           // ),
//         ],
//       ),
//     ),onTap: onTap,
//     );
//
//   }
// }

Widget screenView(Widget widget) {
  return SafeArea(
    child: Scaffold(
        backgroundColor: backGroundColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: widget),
            );
          },
        )),
  );
}

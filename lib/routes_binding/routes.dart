
import 'package:get/get.dart';
import 'package:moltaqa/task_module/task_screen.dart';
import 'binding.dart';

class AppRoutes {

  static const products = '/products';


  static final routes = [
    GetPage(
      name: products,
      page: () =>  TaskScreen(),
      transition:  Transition.fadeIn, // choose your page transition accordingly
      transitionDuration: const Duration(milliseconds: 300),
      binding: ProductsBinding(),
    ),

  ];
}

class Go {
  static Future<dynamic> to(dynamic page, {dynamic arguments}) async {
    Get.to(
      page,
      arguments: arguments,
      transition:  Transition.fadeIn, // choose your page transition accordingly
      duration: const Duration(milliseconds: 300),
    );
  }
}

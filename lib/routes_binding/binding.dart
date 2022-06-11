
import 'package:get/get.dart';

import '../task_module/task_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController(), fenix: true);
  }
}
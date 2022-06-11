import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:moltaqa/constant.dart';
import 'package:moltaqa/routes_binding/binding.dart';
import 'package:moltaqa/routes_binding/routes.dart';
import 'package:moltaqa/styles/size_config.dart';
import 'package:moltaqa/styles/themes/dark_theme.dart';
import 'package:moltaqa/styles/themes/light_theme.dart';
import 'package:moltaqa/task_module/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.light,
              getPages: AppRoutes.routes,
               initialRoute: AppRoutes.products,
              scrollBehavior: MyBehavior(),
              // home:  TaskScreen(),initialBinding: ProductsBinding(),
                theme: lightTheme,
                darkTheme: darkTheme,
                // builder: EasyLoading.init()
            );
          },
        );
      },
    );
  }
}

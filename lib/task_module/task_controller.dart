import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moltaqa/task_module/api_service.dart';
import 'package:moltaqa/task_module/products_model.dart';

class ProductsController extends GetxController {
  var isLoading = false.obs;

  static const _pageSize = 10;
  int no = 1;

  final PagingController<int, ProductData> productsPagingController =
  PagingController(firstPageKey: 1);

  refreshIndicate() {
    Future.sync(() {
      no = 1;
      productsPagingController.refresh();
      update();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    productsPagingController.addPageRequestListener((pageKey) {
      if (pageKey < _pageSize) {
        _fetchPage(no);
      } else {
        no++;
        _fetchPage(no);
      }
    });
    super.onInit();
  }

  Future<dynamic> _fetchPage(int pageKey) async {
    try {
      print("start");
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        ApiService().getProducts(
          pageKey,
          // _pageSize,
          // categoryId,
          // homeId,
          // doctorId,
        ).then((value) {
          final isLastPage = (value).length < _pageSize;
          if (isLastPage) {
            productsPagingController.appendLastPage(value);
          } else {
            final nextPageKey = pageKey + value.length;
            productsPagingController.appendPage(value, nextPageKey);
          }
        });
      }
    } on SocketException catch (_) {
      isLoading(false);
      Get.snackbar("internet", 'internet connection',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  @override
  void dispose() {
    productsPagingController.dispose();
    super.dispose();
  }
}
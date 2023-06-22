import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_strings.dart';
import '../models/banner_item.dart';

class HomePageController extends GetxController{

  //IconWith counter Fields and Variable
  final RxInt _numberOfItems = 4.obs;
  int get numberOfItems => _numberOfItems.value;

  //Page Banner Controller
  var pageBannerItems = <PageBannerItem>[].obs;
  late PageController controller;

  @override
  void onInit() {
    super.onInit();
    controller = PageController(viewportFraction: 0.95);
    fetchData();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void fetchData() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    var dataResult = [
      PageBannerItem(bannerHeaderText1, bannerButtonText1, bannerImage1),
      PageBannerItem(bannerHeaderText2, bannerButtonText2, bannerImage2)
    ];
    pageBannerItems.value = dataResult;
  }
}
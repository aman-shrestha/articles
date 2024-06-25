import 'dart:ffi';

import 'package:articles/app/data/api_client.dart';
import 'package:articles/app/modules/home/post_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

// List<PostModel> postModel = [];
// _getPost() {
//   // isLoading.value = true.obs;
//   ApiServices().getPostWithModel().then(
//         (value) {},
//       );
// }

import 'package:get/get.dart';

import '../model/homeModel.dart';


class HomeController extends GetxController
{
  RxList<Map> Cuslist = <Map>[].obs;

  DataModal? dataModal;

  RxList<Map> l1=<Map>[].obs;
  RxString clickdata="".obs;

}
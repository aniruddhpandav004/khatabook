import 'package:get/get.dart';
import 'package:khatabook/screen/model/Model.dart';

class DataController extends GetxController
{
  RxList<Map> booklist = <Map>[].obs;
  DataModel? data;

  RxList<Map> productList = <Map>[].obs;

  var date = DateTime.now();

  void getData(dynamic date)
  {
    date = date;
  }
}
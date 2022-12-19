import 'package:get/get.dart';
import 'package:khatabook/Screen/model/productModel.dart';
import 'package:khatabook/utils/database.dart';
class ProdController extends GetxController
{
  RxList<Map> Prodlist = <Map>[].obs;
  RxList<Map> ProdlistAll = <Map>[].obs;
  RxString utxtRadio="Done".obs;

  ProductModal? prodModal;
  RxInt totalsum = 0.obs;
  RxInt pendingsum = 0.obs;


  RxInt hometotalsum = 0.obs;
  RxInt homependingsum = 0.obs;


  void addtotalsum()
  {
    int i=0;
    totalsum.value=0;
    pendingsum.value=0;

    for(i=0;i<Prodlist.length;i++)
    {
      if(Prodlist[i]['payment_status']==0)
      {
        pendingsum.value  = int.parse( Prodlist[i]['price']) +pendingsum.value;
      }
      else
      {
        totalsum.value  = int.parse( Prodlist[i]['price']) +totalsum.value;
      }
    }
  }
  void homeaddtotalsum()
  async{
    int i=0;
    hometotalsum.value=0;
    homependingsum.value=0;

    DbHelper mydb = DbHelper();
    ProdlistAll.value = await mydb.ProreadDataread();

    for(i=0;i<ProdlistAll.length;i++)
    {
      if(ProdlistAll[i]['payment_status']==0)
      {
        homependingsum.value  = int.parse( ProdlistAll[i]['price']) +homependingsum.value;
      }
      else
      {
        hometotalsum.value  = int.parse( ProdlistAll[i]['price']) +hometotalsum.value;
      }
    }
  }
}
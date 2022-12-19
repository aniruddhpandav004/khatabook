import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khatabook/Screen/controller/homeController.dart';
import 'package:khatabook/Screen/controller/productController.dart';
import 'package:khatabook/Screen/view/payLater.dart';
import 'package:khatabook/Screen/view/payNow.dart';
import 'package:khatabook/utils/database.dart';
import 'package:url_launcher/url_launcher.dart';
class CustomerInfo extends StatefulWidget {
  const CustomerInfo({Key? key}) : super(key: key);

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  DbHelper _db = DbHelper();
  TextEditingController txtname=TextEditingController();
  TextEditingController txtqty=TextEditingController();
  TextEditingController txtprice=TextEditingController();
  TextEditingController txtdate=TextEditingController();

  HomeController homeController = Get.put(HomeController());
  ProdController _pcontroller = Get.put(ProdController());

  @override
  void initState() {
    super.initState();
    getdata();

  }

  void getdata() async {
    homeController.Cuslist.value = await _db.readData();
    _pcontroller.Prodlist.value = await _db.ProreadData(homeController.dataModal!.id!);
    _pcontroller.addtotalsum();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          primary: false,
          toolbarHeight: 65,
          backgroundColor: Color(0xff4137F0),
          elevation: 00,
          title: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                '${homeController.dataModal!.name}',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.055),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () async {
                    await launchUrl(
                        Uri.parse("tel: +91${homeController.dataModal!.mobile}"));
                  },
                  icon: Icon(Icons.phone)),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color:  Color(0xff4137F0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Done',
                                    style: TextStyle(
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055),
                                  ),
                                  Obx(
                                        ()=> Text(
                                      '₹ ${_pcontroller.totalsum.value}',
                                      style: TextStyle(
                                          color: Color(0xff44b718),
                                          fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.055),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 5,
                              width: double.infinity,
                              color: Color(0xff4137F0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Pending',
                                    style: TextStyle(
                                        fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055),
                                  ),
                                  Obx(
                                        ()=> Text(
                                      '₹ ${_pcontroller.pendingsum.value}',
                                      style: TextStyle(
                                          color: Color(0xffd01717),
                                          fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.055),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.only(top: 6, left: 6, right: 6),
                      decoration: BoxDecoration(
                          color: Color(0xff4137F0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      await launchUrl(Uri.parse(
                                          "sms: +91${homeController.dataModal!.mobile}"));
                                    },
                                    icon: Icon(
                                      Icons.message_outlined,
                                      color: Color(0xff4137F0),
                                      size: 32,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.currency_rupee,
                                      color: Color(0xff4137F0),
                                      size: 32,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async => await launch(
                                        "https://wa.me/+91${homeController.dataModal!.mobile}?text=Hello Mr .${homeController.dataModal!.name} from ${homeController.dataModal!.address} Your Date To Pay Your Bill is Here Please Kindly Pay As Soon As Possible"),

                                    icon: Icon(
                                      Icons.whatsapp,
                                      color: Color(0xff4137F0),
                                      size: 32,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.sticky_note_2_outlined,
                                      color: Color(0xff4137F0),
                                      size: 32,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.99,
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('Date/Qa'),
                                ),
                                Text('Remark'),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Remind'),
                                Container(
                                  height: 15,
                                  width: 0.5,
                                  color: Colors.black,
                                ),
                                Text('Done')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Obx(
                          () => Expanded(
                        child: ListView.builder(
                          itemCount: _pcontroller.Prodlist.length,
                          itemBuilder: (context, index) {
                            return InkWell(onTap: (){
                              txtname=TextEditingController(text: "${_pcontroller.Prodlist.value[index]['productname']}");
                              txtqty=TextEditingController(text: "${_pcontroller.Prodlist.value[index]['quantity']}");
                              txtprice=TextEditingController(text: "${_pcontroller.Prodlist.value[index]['price']}");
                              txtdate=TextEditingController(text: "${_pcontroller.Prodlist.value[index]['purchasedate']}");

                              Get.defaultDialog(
                                content: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: txtname,
                                        cursorColor: Color(0xff000000),
                                        style: TextStyle(color: Color(0xff000000)),
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(color: Color(0xff919191)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff000000)),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          hintText: 'Product Name',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff000000)),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: txtqty,
                                        cursorColor: Color(0xff000000),
                                        style: TextStyle(color: Color(0xff000000)),
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(color: Color(0xff919191)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff000000)),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          hintText: 'Enter Quantity',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff000000)),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: txtprice,
                                        cursorColor: Color(0xff000000),
                                        style: TextStyle(color: Color(0xff000000)),
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(color: Color(0xff919191)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff000000)),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          hintText: 'Enter Price',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff000000)),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        controller: txtdate,
                                        cursorColor: Color(0xff000000),
                                        style: TextStyle(color: Color(0xff000000)),
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(color: Color(0xff919191)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff000000)),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          hintText: 'Enter Purchase Date',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xff000000)),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      // Obx(
                                      //       ()=> Row(
                                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //     children: [
                                      //       Expanded(
                                      //         child: RadioListTile(value: "Done", groupValue: _pcontroller.utxtRadio.value, onChanged: (value){
                                      //           _pcontroller.utxtRadio.value=value as String;
                                      //         },title: Text("Done",style: TextStyle(fontSize: 14),),),
                                      //       ),
                                      //       Expanded(
                                      //         child: RadioListTile(value: "Remaind", groupValue: _pcontroller.utxtRadio.value, onChanged: (value){
                                      //           _pcontroller.utxtRadio.value=value as String;
                                      //         },title: Text("Remaind",style: TextStyle(fontSize: 14),),),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(onPressed: (){
                                            DbHelper db=DbHelper();
                                            db.Prodeletedata(_pcontroller.Prodlist.value[index]['id'].toString(),);
                                            getdata();
                                            Get.back();
                                          }, child: Text("Delete",style: TextStyle(fontSize: 20,color: Colors.black),),),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TextButton(onPressed: (){
                                            DbHelper db=DbHelper();
                                            db.Proupdatedata(_pcontroller.Prodlist.value[index]['id'].toString(),txtname.text,txtqty.text,txtprice.text,txtdate.text,int.parse(homeController.dataModal!.id!),_pcontroller.utxtRadio.value=="Done"?1:0);
                                            getdata();
                                            Get.back();
                                          }, child: Text("Update",style: TextStyle(fontSize: 20,color: Colors.black),)),


                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 60,
                                  width: MediaQuery.of(context).size.width * 0.99,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 7),
                                        height: 60,
                                        width: MediaQuery.of(context).size.width *
                                            0.55,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "${_pcontroller.Prodlist[index]['purchasedate']}",
                                                  style: TextStyle(
                                                      fontSize:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.04),
                                                ),
                                                Text(
                                                  "${_pcontroller.Prodlist[index]['quantity']}",
                                                  style: TextStyle(
                                                      fontSize:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                          0.04),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "${_pcontroller.Prodlist[index]['productname']}",
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.045),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 13,
                                      ),
                                      Container(
                                        height: 60,
                                        width: MediaQuery.of(context).size.width *
                                            0.19,
                                        color: Colors.red.shade200,
                                        child: Center(
                                          child:
                                          _pcontroller.Prodlist[index]['payment_status'] == 0 ? Text("${_pcontroller.Prodlist[index]['price']}", style: TextStyle(color: Colors.red),) : Text(""),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.greenAccent,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight: Radius.circular(10))),
                                        height: 60,
                                        width: MediaQuery.of(context).size.width *
                                            0.186,
                                        child: Center(
                                          child:
                                          _pcontroller.Prodlist[index]['payment_status'] == 1 ? Text("${_pcontroller.Prodlist[index]['price']}", style: TextStyle(color: Colors.green),) : Text(""),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff44b718),
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.40,
                                MediaQuery.of(context).size.height * 0.06)),
                        onPressed: () {
                          Get.off(PayNowScreen());
                          getdata();
                        },
                        child: Row(
                          children: [
                            Text(
                              'Pay Now',
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * 0.045,
                              ),
                            ),
                            Icon(Icons.currency_rupee)
                          ],
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffd01717),
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.40,
                                MediaQuery.of(context).size.height * 0.06)),
                        onPressed: () {
                          Get.off(PayLaterScreen());
                          getdata();},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pay Later',
                              style: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width * 0.045,
                              ),
                            ),
                            Icon(Icons.currency_rupee)
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}





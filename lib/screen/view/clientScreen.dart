import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/screen/view/gaveScreen.dart';
import 'package:khatabook/screen/view/gotScreen.dart';
import 'package:khatabook/utils/database.dart';

import '../controller/datacontroller.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  DataController dataController = Get.put(DataController());

  DbHelper db = DbHelper();

  void getData() async {
    dataController.booklist.value = await db.readData();
  }
  void productgetdata() async {
  }

  @override
  void initState() {
    super.initState();
    getData();
    productgetdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.black54,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "${dataController.data!.name}",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                size: 25,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 130,
              color: Colors.blue,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue, width: 12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Income",
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            "₹0",
                            style: TextStyle(fontSize: 30, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Expense",
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            "₹0",
                            style: TextStyle(fontSize: 30, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.picture_as_pdf,
                        color: Colors.blue,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.currency_rupee,
                        color: Colors.blue,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.whatsapp,
                        color: Colors.blue,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notification_add_outlined,
                        color: Colors.blue,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date/Time"),
                  Text("Remark"),
                  Text("YouGave/YouGot"),
                ],
              ),
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: dataController.productList.value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Column(
                        children: [
                          Text("${dataController.productList[index]['date']}"),
                          Text("${dataController.productList[index]['time']}"),
                        ],
                      ),
                      title: Text(""),
                      subtitle: Text("pandav"),
                      trailing: Row(
                        children: [
                          Container(
                            height: 95,
                            width: 95,
                            color: Color(0xffe59393),
                            child: Text("${dataController.productList}"),
                          ),
                          Container(
                            height: 95,
                            width: 95,
                            color: Color(0xffc5e1a4),
                            child: Text("123"),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(GaveScreen());
                      },
                      child: Text("YOU GAVE MONEY ₹"),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(
                          GotScreen(),
                        );
                      },
                      child: Text("YOU GOT MONEY ₹"),
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

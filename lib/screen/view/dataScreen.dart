import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/screen/controller/datacontroller.dart';
import 'package:khatabook/screen/model/Model.dart';
import 'package:khatabook/screen/view/clientScreen.dart';
import 'package:khatabook/utils/database.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  TextEditingController txtnumber = TextEditingController();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtaddress = TextEditingController();
  TextEditingController newtxtnumber = TextEditingController();
  TextEditingController newtxtname = TextEditingController();
  TextEditingController newtxtaddress = TextEditingController();

  DataController dataController = Get.put(DataController());

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    DbHelper db = DbHelper();
    dataController.booklist.value = await db.readData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "KhataBook",
            style: TextStyle(fontSize: 30),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.calendar_month,
                size: 25,
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.blue,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.sunny,size: 30,color: Colors.white,),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 10),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "You will Give",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "You will Get",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        "|",
                        style: TextStyle(fontSize: 30, color: Colors.grey),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "₹0",
                          style: TextStyle(fontSize: 35, color: Colors.red),
                        ),
                        Text(
                          "₹0",
                          style: TextStyle(fontSize: 35, color: Colors.green),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.8,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "VIEW HISTORY >",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: dataController.booklist.value.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        dataController.data = DataModel(
                          id: dataController.booklist[index]['id'].toString(),
                          name: dataController.booklist[index]['name'],
                          mobile: dataController.booklist[index]['mobile'],
                          address: dataController.booklist[index]['address'],
                        );
                        Get.to(
                          ClientScreen(),
                        );
                      },
                      child: ListTile(
                        leading: Text(
                            "${dataController.booklist.value[index]['id']}"),
                        title: Text(
                          "${dataController.booklist.value[index]['name']}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "${dataController.booklist.value[index]['address']}"),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  newtxtname = TextEditingController(
                                      text:
                                          "${dataController.booklist.value[index]['name']}");
                                  newtxtaddress = TextEditingController(
                                      text:
                                          "${dataController.booklist.value[index]['address']}");
                                  newtxtnumber = TextEditingController(
                                      text:
                                          "${dataController.booklist.value[index]['mobile']}");
                                  Get.defaultDialog(
                                    content: Column(
                                      children: [
                                        TextField(
                                          controller: newtxtname,
                                          decoration:
                                              InputDecoration(hintText: "Name"),
                                        ),
                                        TextField(
                                          controller: newtxtaddress,
                                          decoration: InputDecoration(
                                              hintText: "Address"),
                                        ),
                                        TextField(
                                          controller: newtxtnumber,
                                          decoration: InputDecoration(
                                              hintText: "Mobile number"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            DbHelper db = DbHelper();
                                            db.updateData(
                                                "${dataController.booklist.value[index]['id']}",
                                                newtxtname.text,
                                                newtxtnumber.text,
                                                newtxtaddress.text);
                                            getData();
                                            Get.back();
                                          },
                                          child: Text("Update"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  DbHelper db = DbHelper();
                                  db.deleteData(
                                      "${dataController.booklist.value[index]['id']}");
                                  getData();
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
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
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.defaultDialog(
              content: Column(
                children: [
                  TextField(
                    controller: txtname,
                    decoration: InputDecoration(hintText: "Name"),
                  ),
                  TextField(
                    controller: txtaddress,
                    decoration: InputDecoration(hintText: "Address"),
                  ),
                  TextField(
                    controller: txtnumber,
                    decoration: InputDecoration(hintText: "Mobile Number"),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      DbHelper db = DbHelper();
                      db.insertData(
                        txtname.text,
                        txtaddress.text,
                        txtnumber.text,
                      );
                      getData();
                      Get.back();
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            );
          },
          backgroundColor: Colors.blue,
          icon: Icon(Icons.add),
          label: Text(
            "ADD CUSTOMER",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

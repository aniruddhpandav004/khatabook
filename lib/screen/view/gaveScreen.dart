import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatabook/screen/controller/datacontroller.dart';
import 'package:intl/intl.dart';
import '../../utils/database.dart';

class GaveScreen extends StatefulWidget {
  const GaveScreen({Key? key}) : super(key: key);

  @override
  State<GaveScreen> createState() => _GaveScreenState();
}

class _GaveScreenState extends State<GaveScreen> {
  TextEditingController txtxproduct = TextEditingController();
  TextEditingController txtamount = TextEditingController();
  TextEditingController txtdate = TextEditingController();
  TextEditingController txttime = TextEditingController();

  DataController dataController = Get.put(DataController());

  DbHelper db = DbHelper();

  void getData() async {
    dataController.productList.value = await db.productreadData(id : dataController.data!.id!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Payment",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: txtxproduct,
                decoration: InputDecoration(
                  label: Text("Customer Product"),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black45)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txtamount,
                decoration: InputDecoration(
                  label: Text("Amount"),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black45)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                  ),
                  prefixIcon: Icon(Icons.currency_rupee),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "     * Required",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: txtdate,
                decoration: InputDecoration(
                  label: Text("Date"),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black45)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                  ),
                  prefixIcon: InkWell(
                    onTap: datepicker,
                    child: Icon(Icons.calendar_month),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txttime,
                decoration: InputDecoration(
                  label: Text("Time"),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black45)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                  ),
                  prefixIcon: InkWell(
                    onTap: timepicker,
                    child: Icon(Icons.calendar_month),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  db.productinsertData(txtxproduct.text, txtamount.text, txtdate.text, txttime.text, int.parse(dataController.data!.id!), 1);
                  getData();
                  Get.back();
                  },
                child: Text("SAVE"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void datepicker() async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2005),
        lastDate: DateTime(3010));
    dataController.getData(date);
    if (date != null) {
      txtdate!.text = DateFormat('dd-MM-yyyy').format(date);
    }
  }

  void timepicker() async {
    TimeOfDay? t1 =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (t1 != null) {
      DateTime parsedtime =
          DateFormat.jm().parse(t1.format(context).toString());

      String formetdtime = DateFormat('hh:mm').format(parsedtime);

      txttime!.text = formetdtime;
    }
  }
}

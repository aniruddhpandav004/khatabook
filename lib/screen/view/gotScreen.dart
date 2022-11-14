import 'package:flutter/material.dart';

class GotScreen extends StatefulWidget {
  const GotScreen({Key? key}) : super(key: key);

  @override
  State<GotScreen> createState() => _GotScreenState();
}

class _GotScreenState extends State<GotScreen> {
  TextEditingController? txtxproduct = TextEditingController();
  TextEditingController? txtamount = TextEditingController();
  TextEditingController? txtdate = TextEditingController();
  TextEditingController? txttime = TextEditingController();
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
              SizedBox(height: 20,),
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
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "     * Required",
                  style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
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
                  prefixIcon: Icon(Icons.calendar_month),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: txttime,
                decoration: InputDecoration(
                  label: Text("Time"),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black45)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                  ),
                  prefixIcon: Icon(Icons.calendar_month),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text("SAVE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

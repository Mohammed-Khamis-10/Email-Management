import 'dart:convert';

import 'package:email_management/widgets/mail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/mail_model.dart';

class MailPage extends StatefulWidget {
  const MailPage({Key? key}) : super(key: key);

  @override
  State<MailPage> createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {

  // define empty list
  var mailList = [];

  @override

  // make initiate state for the function i made
  void initState() {
    // to delay geting the data
    Future.delayed(Duration(seconds: 1), () {
      getData();
    });

    super.initState();
  }

// make this function to escape from the initiate state to build the ui
  void getData() async {
    var result = await rootBundle.loadString("assets/data.json");
    var data = jsonDecode(result);

    setState(() {
      mailList = data["items"].map((e) => Mail.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 45,
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search in emails",
                  icon: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(Icons.reorder),
                  ),
                  suffixIcon: Container(
                    height: 5,
                    width: 5,
                    margin: EdgeInsets.all(5),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Text(
                        "MK",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
      body:

          // making the circular loading in the page untill the data come
          mailList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(color: Colors.red),
                )
              : (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                      child: Text("PRIMARY"),
                    ),

                    // expanded to take all the area after the previous container
                    Expanded(

                        // using the list view builder to show the data from the widget i made
                        child: ListView.builder(
                      // determine the max length of the builder of listview
                      itemCount: mailList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return MailWidget(mail: mailList[index]);
                      },
                    ))
                  ],
                )),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {},
        label: Text(
          "Compose",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        icon: Icon(
          Icons.create_outlined,
          color: Colors.red,
        ),
      ),
    );
  }


}

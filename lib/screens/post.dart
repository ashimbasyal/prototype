import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: PostJob(),
  ));
}

class PostJob extends StatefulWidget {
  @override
  _PostJobState createState() => _PostJobState();
}

class _PostJobState extends State<PostJob> {
  TextEditingController sampledata1 = new TextEditingController();
  TextEditingController sampledata2 = new TextEditingController();
  TextEditingController sampledata3 = new TextEditingController();
  TextEditingController sampledata4 = new TextEditingController();
  TextEditingController sampledata5 = new TextEditingController();
  TextEditingController sampledata6 = new TextEditingController();
  TextEditingController sampledata7 = new TextEditingController();
  TextEditingController sampledata8 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Delivery'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Expanded(
            child: Column(
              children: [
                TextField(
                  controller: sampledata1,
                  decoration: InputDecoration(hintText: "Title"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: sampledata2,
                  decoration: InputDecoration(hintText: "Description"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: sampledata3,
                  decoration: InputDecoration(hintText: "Phone No"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: sampledata4,
                  decoration: InputDecoration(hintText: "Pick up Location"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: sampledata5,
                  decoration: InputDecoration(hintText: "Drop off Location"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: sampledata6,
                  decoration: InputDecoration(hintText: "Weight"),
                ),
                SizedBox(
                  height: 10,
                ),

                //Material type

                TextField(
                  controller: sampledata7,
                  decoration: InputDecoration(hintText: "Size"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: sampledata8,
                  decoration: InputDecoration(hintText: "Price"),
                ),

                //urgent togel button
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: () {
                    Map<String, dynamic> data = {
                      "Title": sampledata1.text,
                      "Description": sampledata2.text,
                      "Phone No": sampledata3.text,
                      "Pick up Location": sampledata4.text,
                      "Drop off Location": sampledata5.text,
                      "Weight": sampledata6.text,
                      "Size": sampledata7.text,
                      "Price": sampledata8.text,
                    };

                    FirebaseFirestore.instance.collection("Database").add(data);
                  },
                  child: Text('Submit'),
                  color: Colors.blueAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

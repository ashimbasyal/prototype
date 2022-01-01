import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsummit/model/user_model.dart';
import 'package:newsummit/screens/login_screen.dart';
import 'package:newsummit/screens/post.dart';
import 'package:newsummit/screens/protake.dart';
import 'package:newsummit/screens/take.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName:
                  Text("${loggedInUser.firstName} ${loggedInUser.secondName}"),
              accountEmail: Text("${loggedInUser.email}"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    "images/logo.jpg",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: Text('LogOut'),
              onTap: () {
                logout(context);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("PARCEL"),
        centerTitle: true,
      ),
      body: Container(
//(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(125)),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(110, 0, 0, 0)),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => new PostJob(),
                        ));
                  },
                  child: Text('Request Delivery'),
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
                // Spacer(
                //   flex: 1,
                // ),
                Row(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => new Protype(),
                            ));
                      },
                      child: Text('Take Job'),
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ],
                ),
              ],
            ),
            // Spacer(
            //   flex: 1,
            // ),

            SizedBox(height: 50.0),
            // Expanded(
            //   child: GridView.count(
            //     crossAxisCount: 2,
            //     primary: false,
            //     crossAxisSpacing: 2.0,
            //     mainAxisSpacing: 4.0,
            //     shrinkWrap: true,
            //     children: <Widget>[
            //       _buildCard('waiter', 'Available', 1),
            //       _buildCard('waiter', 'intern', 2),
            //       _buildCard('waiter', 'intern', 3),
            //       _buildCard('waiter', 'intern', 4),
            //       _buildCard('waiter', 'job', 5),
            //       _buildCard('waiter', 'intern', 6),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}




// //(
//         child: Column(
//           children: [
//             Padding(padding: EdgeInsets.all(125)),
//             Row(
//               children: [
//                 Padding(padding: EdgeInsets.fromLTRB(110, 0, 0, 0)),
//                 RaisedButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => new Job(),
//                         ));
//                   },
//                   child: Text('Take Job'),
//                   color: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20))),
//                 ),
//                 Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
//                 // Spacer(
//                 //   flex: 1,
//                 // ),
//                 Row(
//                   children: [
//                     RaisedButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => new PostJob(),
//                             ));
//                       },
//                       child: Text('Post Job'),
//                       color: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(20))),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             // Spacer(
//             //   flex: 1,
//             // ),

//             SizedBox(height: 50.0),
//             // Expanded(
//             //   child: GridView.count(
//             //     crossAxisCount: 2,
//             //     primary: false,
//             //     crossAxisSpacing: 2.0,
//             //     mainAxisSpacing: 4.0,
//             //     shrinkWrap: true,
//             //     children: <Widget>[
//             //       _buildCard('waiter', 'Available', 1),
//             //       _buildCard('waiter', 'intern', 2),
//             //       _buildCard('waiter', 'intern', 3),
//             //       _buildCard('waiter', 'intern', 4),
//             //       _buildCard('waiter', 'job', 5),
//             //       _buildCard('waiter', 'intern', 6),
//             //     ],
//             //   ),
//             // )
//           ],
//         ),
//       ),

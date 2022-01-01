
import 'package:flutter/material.dart';
import 'package:newsummit/model/list.dart';

class Detailspage extends StatelessWidget {
  final ListPage detailspage;
  Detailspage(this.detailspage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detailspage.title),
        backgroundColor: Color(0xffacf4ff),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffacf4ff),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(detailspage.urlImage),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Phone No:' + '  1234567890',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Location: ' + '  Near Baneshwor',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Experience: ' + '  +2 Years',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Salary: ' + '  15000-20000',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Container(
                        height: 58,
                        width: 200,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0xffacf4ff),
                          onPressed: () {},
                          child: Text('Apply Now'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}




//body: Padding(
      //   padding: EdgeInsets.all(8.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.network(detailspage.imgUrl),
      //       Text(detailspage.price.toString())
      //     ],
      //   ),
      // ),
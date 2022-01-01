import 'package:flutter/material.dart';
import 'package:newsummit/data/json.dart';
import 'package:newsummit/model/list.dart';
import 'package:newsummit/screens/details.dart';
import 'package:newsummit/screens/take.dart';
import 'package:newsummit/widget/search_widget.dart';

class FilterLocalListPage extends StatefulWidget {
  @override
  FilterLocalListPageState createState() => FilterLocalListPageState();
}

class FilterLocalListPageState extends State<FilterLocalListPage> {
  late List<ListPage> page;
  String query = '';

  @override
  void initState() {
    super.initState();

    page = allBooks;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(Job.title),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: page.length,
                itemBuilder: (context, index) {
                  final book = page[index];

                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Job Name',
        onChanged: searchBook,
      );

  Widget buildBook(ListPage page) => ListTile(
        leading: Image.network(
          page.urlImage,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Detailspage(page)));
        },
        title: Text(page.title),
        subtitle: Text(page.description),
      );

  void searchBook(String query) {
    final page = allBooks.where((pages) {
      final titleLower = pages.title.toLowerCase();

      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.page = page;
    });
  }
}

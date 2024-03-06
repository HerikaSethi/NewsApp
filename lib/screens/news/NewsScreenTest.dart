import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewsScreenTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: RichText(
            text:const TextSpan(
              children: [
                TextSpan(
                  text: 'Top Stories',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' NOW',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: FutureBuilder(
          future: _loadNewsData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
             
              return NewsList(data: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      );
   
  }

  Future<Map<String, dynamic>> _loadNewsData() async {
    String data = await rootBundle.loadString('assets/news_data.json');
    return json.decode(data);
  }
}

class NewsList extends StatelessWidget {
  final Map<String, dynamic> data;

  NewsList({required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data["articles"].length,
      itemBuilder: (context, index) {
        var article = data["articles"][index];
        return Card(
          child: ListTile(
            title: Text(
              article["title"] ?? "",
              textAlign: TextAlign.justify,
              maxLines: 2,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: (Colors.black),
                  overflow: TextOverflow.ellipsis),
            ),
            subtitle: Text(
              article["description"] ?? "",
              textAlign: TextAlign.justify,
              maxLines: 3,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey,
                  overflow: TextOverflow.ellipsis
                 ),
            ),
            trailing: Image.network(
              article["urlToImage"] ?? "",
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            tileColor: Colors.white,
          ),
        );
      },
    );
  }
}

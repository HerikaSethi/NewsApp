import 'package:flutter/material.dart';
import 'package:news_app/app_bar/CustomAppBar.dart';

class NewsDetailScreen extends StatelessWidget {
  final dynamic article;

  const NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: const CustomAppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pink,
                            width: 4.0,
                          ),
                        ),
                        child: Image.network(
                          article["urlToImage"] ?? "",
                          // width: double.infinity,
                          // height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "${article["content"] ?? ''}",
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            )
            ));
  }
}

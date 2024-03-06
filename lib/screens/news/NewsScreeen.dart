import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_bar/CustomAppBar.dart';
import 'package:news_app/bloc/my_news_bloc/news_bloc.dart';
import 'package:news_app/bloc/my_news_bloc/news_event.dart';
import 'package:news_app/bloc/my_news_bloc/news_state.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/screens/news/NewsDetailScreen.dart';

class NewsScreeen extends StatelessWidget {
  const NewsScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(LocalNewsRepository())
        ..add(LoadNews()), // Triggering the LoadNews event on widget creation
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsLoaded) {
              final data = state.data;
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<NewsBloc>(context).add(LoadNews());
                },
                child: ListView.builder(
                  // shrinkWrap:
                  //     true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: data["articles"].length,
                  itemBuilder: (context, index) {
                    var article = data["articles"][index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NewsDetailScreen(article: article),
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                            article["title"] ?? "",
                            textAlign: TextAlign.justify,
                            maxLines: 2,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          subtitle: Text(
                            article["description"] ?? "",
                            textAlign: TextAlign.justify,
                            maxLines: 3,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          trailing: ClipOval(
                            child: Image.network(
                              article["urlToImage"] ?? "",
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          tileColor: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Text("Error Loading");
            }
          },
        ),
      ),
    );
  }
}

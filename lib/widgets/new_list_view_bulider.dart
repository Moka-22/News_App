import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/articles_model.dart';
import 'package:newsapp/widgets/new_listview.dart';
import '../dio/news_dio.dart';

class NewsListViewBulider extends StatefulWidget {
  const NewsListViewBulider({
    super.key, required this.category,
  });
  final String category;
  @override
  State<NewsListViewBulider> createState() => _NewsListViewBuliderState();
}

class _NewsListViewBuliderState extends State<NewsListViewBulider> {
var future;
   @override
  void initState() {
    super.initState();
   future =  NewsServices(Dio()).getNews(
     category: widget.category,
   );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Center(
                  child: Text('there was an error , please try again later')),
            );
          }else {
            return const SliverToBoxAdapter(
                       child: Center(
                         child: const CircularProgressIndicator(),
                       ),
            );
          }
        });
  }
}

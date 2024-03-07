import 'package:flutter/material.dart';
import '../models/articles_model.dart';
import 'news_view.dart';

class NewsListView extends StatelessWidget {
  List<ArticleModel> articles = [];

  NewsListView({
    super.key,required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: articles.length,
                (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: NewsView(
                        articleModel: articles[index],
                      ),
                    )),
          );
  }
}

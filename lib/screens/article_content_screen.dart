import 'package:flutter/material.dart';
import 'package:newsapp/models/articles_model.dart';


class ArticleContentScreen extends StatelessWidget {
  final ArticleModel article;
   ArticleContentScreen({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.network(
                article.image ?? '',

              ),
            ],
          ),
        ),
      ),
    );
  }
}

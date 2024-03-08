import 'package:flutter/material.dart';
import 'package:newsapp/models/articles_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleContentScreen extends StatelessWidget {
  final ArticleModel article;
  ArticleContentScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  article.image != null
                      ? Image.network(
                    article.image ?? '',
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    'assets/whitebackground.jpg',
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    article.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    article.content ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.5),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        launchUrl(
                          Uri.parse(article.url ?? ''),
                          mode: LaunchMode.inAppWebView,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        fixedSize: const Size(200, 60),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: Colors.indigoAccent,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        'Read More',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

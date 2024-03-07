import 'package:flutter/material.dart';
import 'package:newsapp/widgets/new_list_view_bulider.dart';

import '../models/category_model.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key, required this.category});
  final String category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<CategorySections> sections = [
    CategorySections(title: 'Business'),
    CategorySections(title: 'Entertainment'),
    CategorySections(title: 'Health'),
    CategorySections(title: 'Science'),
    CategorySections(title: 'Sports'),
    CategorySections(title: 'Technology'),
    CategorySections(title: 'General'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.category,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            NewsListViewBulider(
              category: widget.category,
            ),
          ],
        ),
      ),
    );
  }
}

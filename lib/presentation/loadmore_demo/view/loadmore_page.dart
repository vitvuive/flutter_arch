import 'package:ddd_arch/app/base/loadmore_view.dart';
import 'package:ddd_arch/domain/models/article/article.dart';
import 'package:ddd_arch/presentation/loadmore_demo/bloc/loamore_bloc.dart';
import 'package:flutter/material.dart';

class LoadMorePageDemo extends LoadmoreView<Article, LoadMoreBloc> {
  LoadMorePageDemo({super.key});

  @override
  Widget buildItem(BuildContext context, Article item) {
    return SizedBox(
      height: 250,
      child: Card(
        child: Text(
          item.title,
        ),
      ),
    );
  }
}

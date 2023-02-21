import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/domain/models/article/article.dart';
import 'package:ddd_arch/presentation/articles/bloc/articles_bloc.dart';
import 'package:ddd_arch/presentation/articles/bloc/articles_event.dart';
import 'package:ddd_arch/presentation/articles/bloc/articles_state.dart';
import 'package:flutter/material.dart';

class ArticlePage
    extends BaseBlocStatelessWidget<ArticleEvent, ArticleState, ArticleBloc> {
  ArticlePage({super.key});

  @override
  Widget builder(BuildContext context, ArticleState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List articles(Demo authenticate)'),
      ),
      body: ListView.separated(
        itemCount: state.articles.length,
        itemBuilder: (context, index) {
          final art = state.articles[index];
          return _ArticleItem(
            article: art,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 12);
        },
      ),
    );
  }

  @override
  List<ArticleEvent> get initEvents => [LoadArticlesEvent()];
}

class _ArticleItem extends StatelessWidget {
  const _ArticleItem({required this.article});

  final Article article;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title),
      subtitle: Text(article.body),
    );
  }
}

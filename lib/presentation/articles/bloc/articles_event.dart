import 'package:ddd_arch/app/base/bloc/base_bloc_event.dart';

abstract class ArticleEvent extends BaseBlocEvent {}

class LoadArticlesEvent extends ArticleEvent {}

class RefreshArticleEvent extends ArticleEvent {}

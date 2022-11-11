import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/article_model.dart';

abstract class HomeState {}

@immutable
class IdleHomeState extends Equatable implements HomeState {
  const IdleHomeState();

  @override
  List<Object?> get props => [];
}

@immutable
class LoadingHomeState extends Equatable implements HomeState {
  final HomeState state;

  const LoadingHomeState(this.state);

  @override
  List<Object?> get props => [state];
}

@immutable
class LoadedNewsHomeState extends Equatable implements HomeState {

  final List<ArticleModel> articles;
  final int pageNumber;

  const LoadedNewsHomeState(this.articles, this.pageNumber);

  @override
  List<Object?> get props => [articles, pageNumber];

}

@immutable
class LoadingMoreNewsHomeState extends Equatable implements HomeState {

  final List<ArticleModel> articles;

  const LoadingMoreNewsHomeState(this.articles);

  @override
  List<Object?> get props => [articles];

}



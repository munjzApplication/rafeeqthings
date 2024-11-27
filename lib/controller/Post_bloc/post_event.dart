part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostFetch extends PostEvent {}

class FilterList extends PostEvent {
  final List<Postmodel> tempModel;
  final String searchValue;
  const FilterList({this.tempModel = const [], this.searchValue = ''});

  @override
  List<Object> get props => [tempModel, searchValue];
}

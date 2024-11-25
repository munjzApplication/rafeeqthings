part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesListEvent extends FavoritesEvent {}

class FavouriteItemEvent extends FavoritesEvent {
  final FavoritesItemModel favoritesItemModel;

  const FavouriteItemEvent({required this.favoritesItemModel});
}

class SelectItemEvent extends FavoritesEvent {
  final FavoritesItemModel favoritesItemModel;

  const SelectItemEvent({required this.favoritesItemModel});
}

class UnSelectItemEvent extends FavoritesEvent {
  final FavoritesItemModel favoritesItemModel;

  const UnSelectItemEvent({required this.favoritesItemModel});
}

class DeleteSelectItemEvent extends FavoritesEvent {
  const DeleteSelectItemEvent();
}

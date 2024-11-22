part of 'favorites_bloc.dart';

enum ListStatus { loading, success, failure }

// ignore: must_be_immutable
class FavoritesState extends Equatable {
  List<FavoritesItemModel> favoritesList;
  List<FavoritesItemModel> selectedfavoritesList;

  ListStatus listStatus;

  FavoritesState(
      {this.favoritesList = const [],
      this.selectedfavoritesList = const [],
      this.listStatus = ListStatus.loading});

  FavoritesState copyWith(
      {List<FavoritesItemModel>? favoritesList,
      List<FavoritesItemModel>? selectedfavoritesList,
      ListStatus? listStatus}) {
    return FavoritesState(
        favoritesList: favoritesList ?? this.favoritesList,
        selectedfavoritesList:
            selectedfavoritesList ?? this.selectedfavoritesList,
       
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object?> get props => [
        favoritesList,
        listStatus,
        selectedfavoritesList
      ];
}

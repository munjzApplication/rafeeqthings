import 'package:bloc/bloc.dart';
import 'package:bloc_operations/model/favorites_item_model.dart';
import 'package:bloc_operations/repository/favorite_repository.dart';
import 'package:equatable/equatable.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoriteRepository favoriteRepository;
  List<FavoritesItemModel> favoriteLists = [];
  List<FavoritesItemModel> tempFavoriteLists = [];

  FavoritesBloc({required this.favoriteRepository}) : super(FavoritesState()) {
    on<FavoritesListEvent>(favoritesListEvents);
    on<FavouriteItemEvent>(_addFavourites);
    on<SelectItemEvent>(_addtempFavourites);

    on<UnSelectItemEvent>(_removetempFavourites);
    on<DeleteSelectItemEvent>(_deletetempFavouritesList);
  }

  favoritesListEvents(
      FavoritesListEvent event, Emitter<FavoritesState> emit) async {
    favoriteLists = await favoriteRepository.fetchLIstItems();

    emit(state.copyWith(
        favoritesList: List.from(favoriteLists),
        listStatus: ListStatus.success));
  }

  _addFavourites(FavouriteItemEvent event, Emitter<FavoritesState> emit) async {
    final index = favoriteLists.indexWhere(
      (element) => element.id == event.favoritesItemModel.id,
    );

    if (tempFavoriteLists.contains(favoriteLists[index])) {
      tempFavoriteLists.remove(favoriteLists[index]);
      tempFavoriteLists.add(event.favoritesItemModel);
    }
    favoriteLists[index] = event.favoritesItemModel;
    emit(state.copyWith(
        favoritesList: List.from(favoriteLists),
        selectedfavoritesList: List.from(tempFavoriteLists)));
  }

  _addtempFavourites(
      SelectItemEvent event, Emitter<FavoritesState> emit) async {
    tempFavoriteLists.add(event.favoritesItemModel);
    emit(state.copyWith(selectedfavoritesList: List.from(tempFavoriteLists)));
  }

  _removetempFavourites(
      UnSelectItemEvent event, Emitter<FavoritesState> emit) async {
    tempFavoriteLists.remove(event.favoritesItemModel);
    emit(state.copyWith(selectedfavoritesList: List.from(tempFavoriteLists)));
  }

  _deletetempFavouritesList(
      DeleteSelectItemEvent event, Emitter<FavoritesState> emit) async {
    for (var element in tempFavoriteLists) {
      favoriteLists.remove(element);
    }
    tempFavoriteLists.clear();
    emit(state.copyWith(
        favoritesList: List.from(favoriteLists),
        selectedfavoritesList: List.from(tempFavoriteLists)));
  }
}

import 'package:bloc_operations/controller/favorites_bloc/favorites_bloc.dart';
import 'package:bloc_operations/model/favorites_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenFavouritesHome extends StatefulWidget {
  const ScreenFavouritesHome({super.key});

  @override
  State<ScreenFavouritesHome> createState() => _ScreenFavouritesHomeState();
}

class _ScreenFavouritesHomeState extends State<ScreenFavouritesHome> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesBloc>().add(FavoritesListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              return state.selectedfavoritesList.isEmpty
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {
                        context
                            .read<FavoritesBloc>()
                            .add(const DeleteSelectItemEvent());
                      },
                      icon: const Icon(Icons.delete));
            },
          )
        ],
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.failure:
              return const Center(
                child: Text("Something went wrong"),
              );

            case ListStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ListStatus.success:
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final item = state.favoritesList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                            value: state.selectedfavoritesList.contains(item)
                                ? true
                                : false,
                            onChanged: (value) {
                              if (value!) {
                                context.read<FavoritesBloc>().add(
                                    SelectItemEvent(favoritesItemModel: item));
                              } else {
                                context.read<FavoritesBloc>().add(
                                    UnSelectItemEvent(
                                        favoritesItemModel: item));
                              }
                            }),
                        title: Text(state.favoritesList[index].value,
                            style: state.selectedfavoritesList.contains(item)
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.red)
                                : const TextStyle()),
                        trailing: IconButton(
                            onPressed: () {
                              final FavoritesItemModel newFavoritesItemModel =
                                  FavoritesItemModel(
                                id: item.id,
                                value: item.value,
                                isFavorite: item.isFavorite ? false : true,
                              );
                              context.read<FavoritesBloc>().add(
                                  FavouriteItemEvent(
                                      favoritesItemModel:
                                          newFavoritesItemModel));
                            },
                            icon: Icon(item.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined)),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(),
                  itemCount: state.favoritesList.length);
          }
        },
      ),
    );
  }
}
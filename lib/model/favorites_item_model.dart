import 'package:equatable/equatable.dart';

class FavoritesItemModel extends Equatable {
  final String id;
  final String value;
  final bool isFavorite;
  final bool itsDelete;

  const FavoritesItemModel(
      {required this.id,
      required this.value,
      this.isFavorite = false,
      this.itsDelete = false});

  FavoritesItemModel copyWith(
      String? id, String? value, bool? isFavorite, bool? itsDelete) {
    return FavoritesItemModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isFavorite: isFavorite ?? this.isFavorite,
        itsDelete: itsDelete ?? this.itsDelete);
  }

  @override
  List<Object?> get props => [id, value, isFavorite, itsDelete];
}

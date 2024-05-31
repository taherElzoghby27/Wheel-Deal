part of 'favourites_bloc.dart';

sealed class FavouritesEvent extends Equatable {
  const FavouritesEvent();
}

class AddFavEvent extends FavouritesEvent {
  final CarEntity carEntity;

  const AddFavEvent({required this.carEntity});

  @override
  List<Object?> get props => [];
}

class DeleteFavEvent extends FavouritesEvent {
  final CarEntity carEntity;

  const DeleteFavEvent({required this.carEntity});

  @override
  List<Object?> get props => [];
}

class GetFavEvent extends FavouritesEvent {
  @override
  List<Object?> get props => [];
}

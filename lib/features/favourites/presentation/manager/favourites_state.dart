part of 'favourites_bloc.dart';

class FavouritesState extends Equatable {
  final RequestState addFavouritesState;
  final String addFavouritesFailureMessage;
  final RequestState deleteFavouritesState;
  final String deleteFavouritesFailureMessage;
  final RequestState getFavouritesState;
  final String getFavouritesFailureMessage;
  final List<CarEntity> favourites;

  const FavouritesState({
    this.addFavouritesState = RequestState.initial,
    this.addFavouritesFailureMessage = 'no data',
    this.deleteFavouritesState = RequestState.initial,
    this.deleteFavouritesFailureMessage = 'no data',
    this.getFavouritesState = RequestState.loading,
    this.getFavouritesFailureMessage = 'no data',
    this.favourites = const [],
  });

  FavouritesState copyWith({
    RequestState? addFavouritesState,
    String? addFavouritesFailureMessage,
    RequestState? deleteFavouritesState,
    String? deleteFavouritesFailureMessage,
    RequestState? getFavouritesState,
    String? getFavouritesFailureMessage,
    List<CarEntity>? favourites,
  }) =>
      FavouritesState(
        addFavouritesState: addFavouritesState ?? this.addFavouritesState,
        addFavouritesFailureMessage:
            addFavouritesFailureMessage ?? this.addFavouritesFailureMessage,
        deleteFavouritesState:
            deleteFavouritesState ?? this.deleteFavouritesState,
        deleteFavouritesFailureMessage: deleteFavouritesFailureMessage ??
            this.deleteFavouritesFailureMessage,
        getFavouritesState: getFavouritesState ?? this.getFavouritesState,
        getFavouritesFailureMessage:
            getFavouritesFailureMessage ?? this.getFavouritesFailureMessage,
        favourites: favourites ?? this.favourites,
      );

  @override
  List<Object?> get props => [
        addFavouritesState,
        addFavouritesFailureMessage,
        deleteFavouritesState,
        deleteFavouritesFailureMessage,
        getFavouritesState,
        getFavouritesFailureMessage,
        favourites,
      ];
}


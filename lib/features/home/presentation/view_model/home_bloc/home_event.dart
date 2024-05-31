part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class AddTopBrandsEvent extends HomeEvent {
  final int page;

  const AddTopBrandsEvent({this.page = 1});

  @override
  List<Object?> get props => [page];
}

class AddBestOfferEvent extends HomeEvent {
  final int page;

  const AddBestOfferEvent({this.page = 1});

  @override
  List<Object?> get props => [page];
}

class AddRecommendedForYouEvent extends HomeEvent {
  final int page;

  const AddRecommendedForYouEvent({this.page = 1});

  @override
  List<Object?> get props => [page];
}

class AddFavouritesEvent extends HomeEvent {
  const AddFavouritesEvent();

  @override
  List<Object?> get props => [];
}

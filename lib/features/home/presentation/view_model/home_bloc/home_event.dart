part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class AddTopBrandsEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class AddBestOfferEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class AddRecommendedForYouEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class AddFavouritesEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

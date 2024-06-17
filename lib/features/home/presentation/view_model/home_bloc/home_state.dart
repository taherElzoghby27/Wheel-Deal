part of 'home_bloc.dart';

enum RequestState {
  initial,
  loading,
  loadingPagination,
  loaded,
  failure,
  failurePagination,
}

class HomeState extends Equatable {
  //topBrands
  final List<BrandEntity> topBrands;
  final String failureMessageTopBrands;
  final RequestState topBrandsState;

  //best offers
  final List<CarEntity> bestOffers;
  final String failureMessageBestOffers;
  final RequestState bestOffersState;

  //recommended for you
  final List<CarEntity> recommendedForYou;
  final String failureMessageRecommendedForYou;
  final RequestState recommendedForYouState;

  //favourites
  final List<CarEntity> favourites;
  final String failureMessageFavourites;
  final RequestState favouritesState;

  const HomeState({
    this.topBrands = const [],
    this.failureMessageTopBrands = 'No Data',
    this.topBrandsState = RequestState.loading,
    this.bestOffers = const [],
    this.failureMessageBestOffers = 'No Data',
    this.bestOffersState = RequestState.loading,
    this.recommendedForYou = const [],
    this.failureMessageRecommendedForYou = 'No Data',
    this.recommendedForYouState = RequestState.loading,
    this.favourites = const [],
    this.failureMessageFavourites = 'No Data',
    this.favouritesState = RequestState.loading,
  });

  HomeState copyWith({
    List<BrandEntity>? topBrands,
    String? failureMessageTopBrands,
    RequestState? topBrandsState,
    List<CarEntity>? bestOffers,
    String? failureMessageBestOffers,
    RequestState? bestOffersState,
    List<CarEntity>? recommendedForYou,
    String? failureMessageRecommendedForYou,
    RequestState? recommendedForYouState,
    List<CarEntity>? favourites,
    String? failureMessageFavourites,
    RequestState? favouritesState,
  }) {
    return HomeState(
      topBrands: topBrands ?? this.topBrands,
      failureMessageTopBrands:
          failureMessageTopBrands ?? this.failureMessageTopBrands,
      topBrandsState: topBrandsState ?? this.topBrandsState,
      bestOffers: bestOffers ?? this.bestOffers,
      failureMessageBestOffers:
          failureMessageBestOffers ?? this.failureMessageBestOffers,
      bestOffersState: bestOffersState ?? this.bestOffersState,
      recommendedForYou: recommendedForYou ?? this.recommendedForYou,
      failureMessageRecommendedForYou: failureMessageRecommendedForYou ??
          this.failureMessageRecommendedForYou,
      recommendedForYouState:
          recommendedForYouState ?? this.recommendedForYouState,
      favourites: favourites ?? this.favourites,
      failureMessageFavourites:
          failureMessageFavourites ?? this.failureMessageFavourites,
      favouritesState: favouritesState ?? this.favouritesState,
    );
  }

  @override
  List<Object> get props => [
        topBrands,
        failureMessageTopBrands,
        topBrandsState,
        bestOffers,
        failureMessageBestOffers,
        bestOffersState,
        recommendedForYou,
        failureMessageRecommendedForYou,
        recommendedForYouState,
        favourites,
        failureMessageFavourites,
        favouritesState,
      ];
}

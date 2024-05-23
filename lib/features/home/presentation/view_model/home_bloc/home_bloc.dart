import 'package:bloc/bloc.dart';
import 'package:cars/features/home/domain/entities/brand_entity.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/domain/usecases/get_best_offers.dart';
import 'package:cars/features/home/domain/usecases/get_favourites.dart';
import 'package:cars/features/home/domain/usecases/get_recommended_for_you.dart';
import 'package:cars/features/home/domain/usecases/get_top_brands.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTopBrandsUseCase _getTopBrandsUseCase;
  final GetBestOffersUseCase _getBestOffersUseCase;
  final GetFavouritesUseCase _getFavouritesUseCase;
  final GetRecommendedForYouUseCase _getRecommendedForYouUseCase;

  HomeBloc(
    this._getTopBrandsUseCase,
    this._getBestOffersUseCase,
    this._getFavouritesUseCase,
    this._getRecommendedForYouUseCase,
  ) : super(const HomeState()) {
    on<HomeEvent>(
      (event, emit) async {
        if (event is AddTopBrandsEvent) {
          await topBrandsEvent(emit, event);
        } else if (event is AddBestOfferEvent) {
          await bestOffersEvent(emit, event);
        } else if (event is AddFavouritesEvent) {
          await favouritesEvent(emit, event);
        } else if (event is AddRecommendedForYouEvent) {
          await recommendedForYouEvent(emit, event);
        }
      },
    );
  }

  Future<void> recommendedForYouEvent(
    Emitter<HomeState> emit,
    AddRecommendedForYouEvent event,
  ) async {
    if (event.page != 1) {
      emit(
        state.copyWith(
          recommendedForYouState: RequestState.loadingPagination,
        ),
      );
    }
    await _getRecommendedForYouUseCase.call(event.page).then(
          (value) => value.fold(
            (failure) {
              if (event.page == 1) {
                emit(
                  state.copyWith(
                    recommendedForYouState: RequestState.failure,
                    failureMessageRecommendedForYou: failure.message,
                  ),
                );
              } else {
                emit(
                  state.copyWith(
                    recommendedForYouState: RequestState.failurePagination,
                    failureMessageRecommendedForYou: failure.message,
                  ),
                );
              }
            },
            (success) {
              emit(
                state.copyWith(
                  recommendedForYouState: RequestState.loaded,
                  recommendedForYou: success,
                ),
              );
            },
          ),
        );
  }

  Future<void> favouritesEvent(
    Emitter<HomeState> emit,
    AddFavouritesEvent event,
  ) async {
    if (event.page != 1) {
      emit(
        state.copyWith(
          favouritesState: RequestState.loadingPagination,
        ),
      );
    }
    await _getFavouritesUseCase.call(event.page).then(
          (value) => value.fold(
            (failure) {
              if (event.page == 1) {
                emit(
                  state.copyWith(
                    favouritesState: RequestState.failure,
                    failureMessageBestOffers: failure.message,
                  ),
                );
              } else {
                emit(
                  state.copyWith(
                    favouritesState: RequestState.failurePagination,
                    failureMessageBestOffers: failure.message,
                  ),
                );
              }
            },
            (success) {
              emit(
                state.copyWith(
                  favouritesState: RequestState.loaded,
                  favourites: success,
                ),
              );
            },
          ),
        );
  }

  Future<void> bestOffersEvent(
    Emitter<HomeState> emit,
    AddBestOfferEvent event,
  ) async {
    if (event.page != 1) {
      emit(
        state.copyWith(
          bestOffersState: RequestState.loadingPagination,
        ),
      );
    }
    await _getBestOffersUseCase.call(event.page).then(
          (value) => value.fold(
            (failure) {
              if (event.page == 1) {
                emit(
                  state.copyWith(
                    bestOffersState: RequestState.failure,
                    failureMessageBestOffers: failure.message,
                  ),
                );
              } else {
                emit(
                  state.copyWith(
                    bestOffersState: RequestState.failurePagination,
                    failureMessageBestOffers: failure.message,
                  ),
                );
              }
            },
            (List<CarEntity> success) {
              emit(
                state.copyWith(
                  bestOffersState: RequestState.loaded,
                  bestOffers: success,
                ),
              );
            },
          ),
        );
  }

  Future<void> topBrandsEvent(
    Emitter<HomeState> emit,
    AddTopBrandsEvent event,
  ) async {
    if (event.page != 1) {
      emit(
        state.copyWith(
          topBrandsState: RequestState.loadingPagination,
        ),
      );
    }
    await _getTopBrandsUseCase.call(event.page).then(
          (value) => value.fold(
            (failure) {
              if (event.page == 1) {
                emit(
                  state.copyWith(
                    topBrandsState: RequestState.failure,
                    failureMessageTopBrands: failure.message,
                  ),
                );
              } else {
                emit(
                  state.copyWith(
                    topBrandsState: RequestState.failurePagination,
                    failureMessageTopBrands: failure.message,
                  ),
                );
              }
            },
            (success) {
              emit(
                state.copyWith(
                  topBrandsState: RequestState.loaded,
                  topBrands: success,
                ),
              );
            },
          ),
        );
  }
}

import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:cars/features/search/data/models/facilities_model.dart';
import 'package:cars/features/search/data/models/recent_search_model.dart';
import 'package:cars/features/search/domain/entities/search_entity.dart';
import 'package:cars/features/search/domain/use_cases/body_type_filter_use_case.dart';
import 'package:cars/features/search/domain/use_cases/delete_recent_search_use_case.dart';
import 'package:cars/features/search/domain/use_cases/get_brands_use_case.dart';
import 'package:cars/features/search/domain/use_cases/recent_search_use_case.dart';
import 'package:cars/features/search/domain/use_cases/search_filter_use_case.dart';
import 'package:cars/features/search/domain/use_cases/search_use_case.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetRecentSearchUseCase _getRecentSearchUseCase;
  final SearchUseCase _searchUseCase;
  final DeleteRecentSearchUseCase _deleteRecentSearchUseCase;
  final SearchFilterUseCase _searchFilterUseCase;
  final BodyTypeFilterUseCase _bodyTypeFilterUseCase;
  final GetBrandsUseCase _getBrandsUseCase;

  SearchCubit(
    this._getRecentSearchUseCase,
    this._searchUseCase,
    this._deleteRecentSearchUseCase,
    this._searchFilterUseCase,
    this._bodyTypeFilterUseCase,
    this._getBrandsUseCase,
  ) : super(const SearchState());

  //fields
  TextEditingController searchController = TextEditingController();

  //price range
  RangeValues currentRangeValues = const RangeValues(500000, 700000);

  searchMethod() async {
    emit(state.copyWith(initial: false));
    await search(searchWord: searchController.text);
  }

  search({required String searchWord}) async {
    emit(state.copyWith(searchState: RequestState.loading));
    await _searchUseCase.call(searchWord.trim()).then(
          (value) => value.fold(
            (failure) {
              emit(
                state.copyWith(
                  searchState: RequestState.failure,
                  failureMessageSearch: failure.message,
                ),
              );
            },
            (cars) {
              emit(
                state.copyWith(
                  searchState: RequestState.loaded,
                  searchList: cars,
                ),
              );
            },
          ),
        );
  }

//get recent search cars
  recentSearch() async {
    await _getRecentSearchUseCase.call().then(
          (value) => value.fold(
            (failure) {
              emit(
                state.copyWith(
                  recentSearchState: RequestState.failure,
                  failureMessageRecentSearch: failure.message,
                ),
              );
            },
            (recentSearchCars) {
              emit(
                state.copyWith(
                  recentSearchState: RequestState.loaded,
                  recentSearchList: recentSearchCars,
                ),
              );
            },
          ),
        );
  }

//delete recent search by search word
  deleteRecentSearch({required String searchWord}) async {
    emit(
      state.copyWith(deleteRecentSearchState: RequestState.loading),
    );
    await _deleteRecentSearchUseCase.call(searchWord).then(
      (value) {
        value.fold(
          (failure) {
            emit(
              state.copyWith(
                deleteRecentSearchState: RequestState.failure,
                failureMessageDeleteRecentSearch: failure.message,
              ),
            );
          },
          (success) async {
            emit(
              state.copyWith(deleteRecentSearchState: RequestState.loaded),
            );
            await recentSearch();
          },
        );
      },
    );
  }

  changeValue({
    required String value,
    required String status,
  }) {
    if (status == StringsEn.condition) {
      emit(state.copyWith(condition: value));
    } else if (status == StringsEn.brand) {
      emit(state.copyWith(brand: value));
    } else if (status == StringsEn.bodyType) {
      emit(state.copyWith(bodyType: value));
    }
    emit(
      state.copyWith(valueChanged: RequestState.changed),
    );
  }

  changePriceRange(RangeValues values) {
    currentRangeValues = values;
    emit(
      state.copyWith(priceRangeChanged: RequestState.loaded),
    );
  }

  changeFacility(bool value, FacilityModel facilityModel) {
    facilityModel.value = value;
    emit(
      state.copyWith(valueFacilityChange: RequestState.loaded),
    );
  }

//get body types by brand name
  getBodyTypes() async {
    if (state.brand.isNotEmpty) {
      emit(
        state.copyWith(bodyTypesState: RequestState.loading),
      );
      await _bodyTypeFilterUseCase.call(state.brand).then(
            (value) => value.fold(
              (failure) {
                emit(
                  state.copyWith(
                    bodyTypesState: RequestState.failure,
                    failureBodyTypes: failure.message,
                  ),
                );
              },
              (success) {
                emit(
                  state.copyWith(
                    bodyTypesState: RequestState.loaded,
                    bodyTypes: success,
                  ),
                );
              },
            ),
          );
    } else {
      emit(
        state.copyWith(
          bodyTypesState: RequestState.failure,
          failureBodyTypes: 'Please ,Select brand',
        ),
      );
    }
  }

  getBrands() async {
    emit(
      state.copyWith(brandsState: RequestState.loading),
    );
    await _getBrandsUseCase.call().then(
          (value) => value.fold(
            (failure) {
              emit(
                state.copyWith(
                  brandsState: RequestState.failure,
                  failureBodyTypes: failure.message,
                ),
              );
            },
            (success) {
              emit(
                state.copyWith(
                  brandsState: RequestState.loaded,
                  brands: success,
                ),
              );
            },
          ),
        );
  }

  resetMethod() {
    currentRangeValues = const RangeValues(500000, 700000);
    for (FacilityModel item in facilities) {
      item.value = false;
    }
    emit(
      state.copyWith(brand: '', bodyType: '', condition: ''),
    );
  }

  searchFilter() async {
    emit(state.copyWith(searchState: RequestState.loading));
    await _searchFilterUseCase
        .call(
          SearchFilterEntity(
            condition: state.condition,
            bodyType: state.bodyType,
            brand: state.brand,
            minPrice: currentRangeValues.start.toString(),
            maxPrice: currentRangeValues.end.toString(),
            airBag: facilities[0].value ? '1' : '0',
            touchScreen: facilities[1].value ? '1' : '0',
            connectivity: facilities[2].value ? '1' : '0',
            airCondition: facilities[3].value ? '1' : '0',
            brakeAssist: facilities[4].value ? '1' : '0',
            remoteEngineStartStop: facilities[5].value ? '1' : '0',
            navigationSystem: facilities[6].value ? '1' : '0',
          ),
        )
        .then(
          (value) => value.fold(
            (failure) {
              emit(
                state.copyWith(
                  searchState: RequestState.failure,
                  failureMessageSearch: failure.message,
                ),
              );
            },
            (List<CarEntity> success) {
              emit(
                state.copyWith(
                  searchFilterState: RequestState.loaded,
                  searchList: success,
                ),
              );
            },
          ),
        );
  }
}

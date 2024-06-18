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
import 'package:equatable/equatable.dart';
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
  bool initial = true;
  TextEditingController searchController = TextEditingController();

  searchMethod() async {
    initial = false;
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

  //fields
  String condition = conditions.first;
  String? brand;
  String bodyType = bodyTypes.first;

  //price range
  RangeValues currentRangeValues = const RangeValues(500000, 700000);

  changeValue({
    required String value,
    required String status,
  }) {
    if (status == StringsEn.condition) {
      condition = value;
    } else if (status == StringsEn.brand) {
      brand = value;
    } else if (status == StringsEn.bodyType) {
      bodyType = value;
    }
    debugPrint(condition);
    emit(ValueChange());
  }

  changePriceRange(RangeValues values) {
    currentRangeValues = values;
    emit(PriceRangeChanged());
  }

  changeFacility(bool value, FacilityModel facilityModel) {
    facilityModel.value = value;
    emit(ValueFacilityChange());
  }

//get body types by brand name
  getBodyTypes() async {
    emit(
      state.copyWith(bodyTypesState: RequestState.loading),
    );
    await _bodyTypeFilterUseCase.call('').then(
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

  resetMethod() {}

  searchFilter() async {
    emit(SearchFilterLoading());
    await _searchFilterUseCase
        .call(
          SearchFilterEntity(
            condition: condition,
            bodyType: bodyType,
            brand: brand,
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
                SearchFilterFailure(message: failure.message),
              );
            },
            (List<CarEntity> success) {
              emit(
                SearchFilterLoaded(cars: success),
              );
            },
          ),
        );
  }
}

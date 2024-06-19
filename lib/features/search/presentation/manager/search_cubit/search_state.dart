part of 'search_cubit.dart';

class SearchState {
  final RequestState searchState;
  final List<CarEntity> searchList;
  final String failureMessageSearch;
  final RequestState recentSearchState;
  final List<RecentSearchModel> recentSearchList;
  final String failureMessageRecentSearch;
  final RequestState deleteRecentSearchState;
  final String failureMessageDeleteRecentSearch;
  final RequestState bodyTypesState;
  final List<SearchFilterEntity> bodyTypes;
  final String failureBodyTypes;
  final RequestState brandsState;
  final List<SearchFilterEntity> brands;
  final String failureBrands;
  final RequestState valueChanged;
  final RequestState priceRangeChanged;
  final RequestState valueFacilityChange;

  const SearchState({
    this.searchState = RequestState.initial,
    this.searchList = const [],
    this.failureMessageSearch = 'No Data',
    this.recentSearchState = RequestState.loading,
    this.recentSearchList = const [],
    this.failureMessageRecentSearch = 'No Data',
    this.deleteRecentSearchState = RequestState.initial,
    this.failureMessageDeleteRecentSearch = 'No Data',
    this.bodyTypesState = RequestState.initial,
    this.bodyTypes = const [],
    this.failureBodyTypes = 'no data',
    this.brandsState = RequestState.initial,
    this.brands = const [],
    this.failureBrands = 'no data',
    this.valueChanged = RequestState.initial,
    this.priceRangeChanged = RequestState.initial,
    this.valueFacilityChange = RequestState.initial,
  });

  SearchState copyWith({
    RequestState? searchState,
    List<CarEntity>? searchList,
    String? failureMessageSearch,
    RequestState? recentSearchState,
    List<RecentSearchModel>? recentSearchList,
    String? failureMessageRecentSearch,
    RequestState? deleteRecentSearchState,
    String? failureMessageDeleteRecentSearch,
    RequestState? bodyTypesState,
    List<SearchFilterEntity>? bodyTypes,
    String? failureBodyTypes,
    RequestState? brandsState,
    List<SearchFilterEntity>? brands,
    String? failureBrands,
    RequestState? valueChanged,
    RequestState? priceRangeChanged,
    RequestState? valueFacilityChange,
  }) =>
      SearchState(
        searchState: searchState ?? this.searchState,
        searchList: searchList ?? this.searchList,
        failureMessageSearch: failureMessageSearch ?? this.failureMessageSearch,
        recentSearchState: recentSearchState ?? this.recentSearchState,
        recentSearchList: recentSearchList ?? this.recentSearchList,
        failureMessageRecentSearch:
            failureMessageRecentSearch ?? this.failureMessageRecentSearch,
        deleteRecentSearchState:
            deleteRecentSearchState ?? this.deleteRecentSearchState,
        failureMessageDeleteRecentSearch: failureMessageDeleteRecentSearch ??
            this.failureMessageDeleteRecentSearch,
        bodyTypesState: bodyTypesState ?? this.bodyTypesState,
        bodyTypes: bodyTypes ?? this.bodyTypes,
        failureBodyTypes: failureBodyTypes ?? this.failureBodyTypes,
        brandsState: brandsState ?? this.brandsState,
        brands: brands ?? this.brands,
        failureBrands: failureBrands ?? this.failureBrands,
        valueChanged: valueChanged ?? this.valueChanged,
        priceRangeChanged: priceRangeChanged??this.priceRangeChanged,
        valueFacilityChange: valueFacilityChange??this.valueFacilityChange,
      );
}


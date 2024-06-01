part of 'search_cubit.dart';

class SearchState extends Equatable {
  final RequestState searchState;
  final List<CarEntity> searchList;
  final String failureMessageSearch;
  final RequestState recentSearchState;
  final List<RecentSearchModel> recentSearchList;
  final String failureMessageRecentSearch;

  const SearchState({
    this.searchState = RequestState.initial,
    this.searchList = const [],
    this.failureMessageSearch = 'No Data',
    this.recentSearchState = RequestState.loading,
    this.recentSearchList = const [],
    this.failureMessageRecentSearch = 'No Data',
  });

  SearchState copyWith({
    RequestState? searchState,
    List<CarEntity>? searchList,
    String? failureMessageSearch,
    RequestState? recentSearchState,
    List<RecentSearchModel>? recentSearchList,
    String? failureMessageRecentSearch,
  }) =>
      SearchState(
        searchState: searchState ?? this.searchState,
        searchList: searchList ?? this.searchList,
        failureMessageSearch: failureMessageSearch ?? this.failureMessageSearch,
        recentSearchState: recentSearchState ?? this.recentSearchState,
        recentSearchList: recentSearchList ?? this.recentSearchList,
        failureMessageRecentSearch:
            failureMessageRecentSearch ?? this.failureMessageRecentSearch,
      );

  @override
  List<Object?> get props => [
        searchState,
        searchList,
        failureMessageSearch,
        recentSearchState,
        recentSearchList,
        failureMessageRecentSearch,
      ];
}

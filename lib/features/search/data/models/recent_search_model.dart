class RecentSearchModel {
  String? searchQuery;
  String? searchTimestamp;

  RecentSearchModel({this.searchQuery, this.searchTimestamp});

  RecentSearchModel.fromMap(Map<String, dynamic> json) {
    searchQuery = json['search_query'];
    searchTimestamp = json['search_timestamp'];
  }
}

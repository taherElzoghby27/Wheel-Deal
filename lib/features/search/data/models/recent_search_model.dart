class RecentSearchModel {
  String? searchQuery;
  String? userId;

  RecentSearchModel({this.searchQuery, this.userId});

  RecentSearchModel.fromMap(Map<String, dynamic> json) {
    searchQuery = json['search_query'];
    userId = json['user_id'];
  }
}

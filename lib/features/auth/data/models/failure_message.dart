class FailureMessage {
  String? message;

  FailureMessage({required this.message});

  FailureMessage.fromJson(Map<String, dynamic> json) {
    message = (json['massege'] is String
        ? json['massege']
        : json['massege']['email'][0]) as String;
  }
}

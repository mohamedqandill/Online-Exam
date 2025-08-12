class ErrorsModel {
  final String? status;
  final String message;

  ErrorsModel({this.status, required this.message});

  factory ErrorsModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorsModel(status: jsonData["code"], message: jsonData["message"]);
  }
}

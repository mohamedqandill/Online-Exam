import 'errors_model.dart';

class ServerExceptions implements Exception {
  final ErrorsModel errorsModel;
  ServerExceptions({required this.errorsModel});
}

import 'package:api_intergration/services/api_service/apiable/api_inputable.dart';

class CreateUserInput extends ApiInputable {
  final String name;
  final String job;
  @override
  RequestMethod requestMethod = RequestMethod.post;
  @override
  String resourcePath = "users";
  CreateUserInput({required this.name, required this.job});
  @override
  Map<String, String>? buidSendHeaders() {
    return null;
  }

  @override
  Map<String, dynamic>? buidSendParamenters() {
    return {"name": name, "job": job};
  }
}

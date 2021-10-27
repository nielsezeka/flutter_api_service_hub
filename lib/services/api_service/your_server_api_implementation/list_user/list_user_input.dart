import 'package:api_intergration/services/api_service/apiable/api_inputable.dart';

/// test this request [https://reqres.in/api/users?page=1]
///
/// This class should be a mapping of the request.
///
class ListUserInput implements ApiInputable {
  final int page;
  ListUserInput({required this.page});
  @override
  RequestMethod requestMethod = RequestMethod.get;
  @override
  String resourcePath =
      "users"; // <--- the path under server value https://reqres.in/api/

  /// Build the request data to send to the server
  ///
  /// specify the value of GET request [?page=1]
  /// it should be all the paramenters after "?"
  /// if it cointains more than 1 value.
  /// Example:https://reqres.in/api/users?something=1&something2=2
  ///     ===> return {"something":1,something:2}
  @override
  Map<String, dynamic>? buidSendParamenters() {
    return {"page": page};
  }

  /// Build the request header to send to the server
  ///
  /// example if your request contains the Authorize header, it should be
  /// return {"Authorize": "header_for_authorize"}
  @override
  Map<String, String>? buidSendHeaders() {
    return null;
  }
}

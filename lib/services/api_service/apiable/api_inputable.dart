enum RequestMethod {
  get,
  post,
  put,
  delete,
}

abstract class ApiInputable {
  late final RequestMethod requestMethod;
  late final String resourcePath;
  Map<String, dynamic>? buidSendParamenters();
  Map<String, String>? buidSendHeaders();
}

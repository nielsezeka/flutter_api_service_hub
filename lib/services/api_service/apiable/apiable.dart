import 'package:dio/dio.dart';
import 'api_inputable.dart';
import 'api_outputable.dart';

class Apiable<I extends ApiInputable, O extends ApiOutputable> {
  final I input;
  O output;
  final bool requestStatus;
  var dio = Dio();
  Apiable(
    this.input,
    this.output, {
    this.requestStatus = false,
  });
  excuteRequest(String hostURL) async {
    var response = await _makeRequest('$hostURL/${input.resourcePath}', input);
    output = output.buildFromJson(
      response.data,
    );
  }

  Future<Response> _makeRequest(String uri, I input) async {
    switch (input.requestMethod) {
      case RequestMethod.get:
        return await dio.get(
          uri,
          queryParameters: input.buidSendParamenters(),
          options: Options(
            responseType: ResponseType.plain,
          ),
        );
      case RequestMethod.post:
        return await dio.post(
          uri,
          data: input.buidSendParamenters(),
          options: Options(
            headers: input.buidSendHeaders() ?? {},
            responseType: ResponseType.plain,
          ),
        );
      case RequestMethod.put:
        return await dio.put(
          uri,
          data: input.buidSendParamenters(),
          options: Options(
            headers: input.buidSendHeaders() ?? {},
            responseType: ResponseType.plain,
          ),
        );
      case RequestMethod.delete:
        return await dio.delete(
          uri,
          data: input.buidSendParamenters(),
          options: Options(
            headers: input.buidSendHeaders() ?? {},
            responseType: ResponseType.plain,
          ),
        );
    }
  }
}

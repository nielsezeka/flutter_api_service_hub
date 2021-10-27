import 'package:api_intergration/services/api_service/apiable/apiable.dart';
export './apiable/apiable.dart';
export './apiable/api_inputable.dart';
export './apiable/api_outputable.dart';

class ApiService {
  final String hostUrl;

  ApiService(this.hostUrl);
  Future<T> excuteRequest<T extends Apiable>(T apiRequest) async {
    await apiRequest.excuteRequest(hostUrl);
    return apiRequest;
  }
}

final apiService = ApiService("https://reqres.in/api");

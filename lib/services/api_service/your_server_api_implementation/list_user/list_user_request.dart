import 'package:api_intergration/services/api_service/apiable/apiable.dart';
import 'package:api_intergration/services/api_service/your_server_api_implementation/list_user/list_user_input.dart';
import 'package:api_intergration/services/api_service/your_server_api_implementation/list_user/list_user_output.dart';

class ListUserRequest extends Apiable<ListUserInput, ListUserResponse> {
  ListUserRequest({
    required ListUserInput input,
    required ListUserResponse output,
  }) : super(input, output);
}

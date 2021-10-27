import 'package:api_intergration/services/api_service/apiable/apiable.dart';

import 'create_user_input.dart';
import 'create_user_output.dart';

class CreateUserRequest extends Apiable<CreateUserInput, CreateUserResponse> {
  CreateUserRequest({
    required CreateUserInput input,
    required CreateUserResponse output,
  }) : super(
          input,
          output,
        );
}

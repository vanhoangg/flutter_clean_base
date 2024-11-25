import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../app/constant.dart';
import '../../model/responses/authentication/user_model.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AuthServiceClient {
  factory AuthServiceClient(Dio dio, {String baseUrl}) = _AuthServiceClient;

  @POST(Constant.loginPath)
  Future<UserModel> login(
    @Body() Map<String, dynamic> body,
  );

  @GET('${Constant.userPath}/{userId}')
  Future<UserModel> getUserProfile(
    @Path('userId') String userId,
  );
}

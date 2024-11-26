import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../app/constant.dart';
import '../../model/responses/authentication/user_model.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AuthServiceClient {
  factory AuthServiceClient(Dio dio, {String baseUrl}) = _AuthServiceClient;

  @POST(Constant.loginPath)
  Future<UserModel> postLogin(
    @Body() Map<String, dynamic> body,
  );
  @GET(Constant.userPath)
  Future<List<UserModel>> getListUser();

  @GET('${Constant.userPath}/search')
  Future<List<UserModel>> getSearchListUser(
    @Query('q') String q,
  );
  @GET('${Constant.userPath}/filter')
  Future<List<UserModel>> getFilterListUser(
    @Query('key') String key,
    @Query('value') String value,
  );

  @GET('${Constant.userPath}/{userId}')
  Future<UserModel> getUserProfile(
    @Path('userId') String userId,
  );

  @PUT('${Constant.userPath}/{userId}')
  Future<UserModel> putUpdateUserProfile(
    @Path('userId') String userId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('${Constant.userPath}/{userId}')
  Future<bool> deleteUserProfile(
    @Path('userId') String userId,
  );

  @GET('${Constant.userPath}/{userId}/carts')
  Future<UserModel> getUserCarts(
    @Path('userId') String userId,
  );
  @GET('${Constant.userPath}/{userId}/todos')
  Future<UserModel> getUserTodos(
    @Path('userId') String userId,
  );
  @PUT('${Constant.authPath}/${Constant.todos}/{todoId}')
  Future<bool> putCompleteTodoTask(
    @Path('todoId') String todoId,
    @Body() bool completed,
  );
  @DELETE('${Constant.authPath}/${Constant.todos}/{todoId}')
  Future<bool> deleteTodoTask(
    @Path('todoId') String todoId,
  );
}

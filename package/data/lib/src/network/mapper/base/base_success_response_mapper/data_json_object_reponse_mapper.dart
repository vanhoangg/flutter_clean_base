import 'package:shared/shared.dart';
import '../../../model/responses/base/data_response.dart';
import '../base_success_response_mapper.dart';

class DataJsonObjectResponseMapper<T extends Object>
    extends BaseSuccessResponseMapper<T, DataResponse<T>> {
  @override
  // ignore: avoid-dynamic
  DataResponse<T>? mapToDataModel({
    required dynamic response,
    Decoder<T>? decoder,
  }) {
    return decoder != null && response is Map<String, dynamic>
        ? DataResponse.fromJson(response, (json) => decoder(json))
        : null;
  }
}

import 'package:shared/shared.dart';

import '../../../model/responses/base/data_list_reponse.dart';
import '../base_success_response_mapper.dart';

class DataJsonArrayResponseMapper<T extends Object>
    extends BaseSuccessResponseMapper<T, DataListResponse<T>> {
  @override
  // ignore: avoid-dynamic
  DataListResponse<T>? mapToDataModel({
    required dynamic response,
    Decoder<T>? decoder,
  }) {
    return decoder != null && response is Map<String, dynamic>
        ? DataListResponse.fromJson(response, (json) => decoder(json))
        : null;
  }
}

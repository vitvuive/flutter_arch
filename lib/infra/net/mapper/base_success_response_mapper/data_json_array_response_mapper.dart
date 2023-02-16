import 'package:ddd_arch/infra/net/model/base_data/map_json.dart';
import 'package:ddd_arch/shared/model/typedef.dart';

import '../../model/base_data/data_response.dart';
import '../base/base_success_reponse_mapper.dart';

class DataJsonArrayResponseMapper<T>
    extends BaseSuccessResponseMapper<T, DataListResponse<T>> {
  @override
  // ignore: avoid-dynamic
  DataListResponse<T> map(dynamic response, Decoder<T>? decoder) {
    return decoder != null && response is Map<String, dynamic>
        ? DataListResponse.fromJson(
            response, (json) => decoder(json as MapJson))
        : DataListResponse<T>(data: response as List<T>);
  }
}

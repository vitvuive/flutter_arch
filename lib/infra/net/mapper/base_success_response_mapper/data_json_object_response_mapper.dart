import 'package:ddd_arch/infra/net/mapper/base/base_success_reponse_mapper.dart';
import 'package:ddd_arch/infra/net/model/base_data/data_response.dart';
import 'package:ddd_arch/infra/net/model/base_data/map_json.dart';
import 'package:ddd_arch/shared/model/typedef.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DataJsonObjectResponseMapper<T>
    extends BaseSuccessResponseMapper<T, DataResponse<T>> {
  @override
  // ignore: avoid-dynamic
  DataResponse<T> map(dynamic response, Decoder<T>? decoder) {
    return decoder != null && response is Map<String, dynamic>
        ? DataResponse.fromJson(response, (json) => decoder(json as MapJson))
        : DataResponse<T>(data: response as T);
  }
}

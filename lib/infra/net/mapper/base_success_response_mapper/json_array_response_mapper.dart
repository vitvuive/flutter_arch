import 'package:ddd_arch/infra/net/mapper/base/base_success_reponse_mapper.dart';
import 'package:ddd_arch/infra/net/model/base_data/map_json.dart';
import 'package:ddd_arch/shared/model/typedef.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class JsonArrayResponseMapper<T> extends BaseSuccessResponseMapper<T, List<T>> {
  @override
  // ignore: avoid-dynamic
  List<T> map(dynamic response, Decoder<T>? decoder) {
    return decoder != null && response is List
        ? response
            .map((jsonObject) => decoder(jsonObject as MapJson))
            .toList(growable: false)
        : [response] as List<T>;
  }
}

import 'package:ddd_arch/infra/net/mapper/base/base_success_reponse_mapper.dart';
import 'package:ddd_arch/shared/model/typedef.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class JsonObjectResponseMapper<T> extends BaseSuccessResponseMapper<T, T> {
  @override
  // ignore: avoid-dynamic
  T map(dynamic response, Decoder<T>? decoder) {
    return decoder != null && response is Map<String, dynamic>
        ? decoder(response)
        : response as T;
  }
}

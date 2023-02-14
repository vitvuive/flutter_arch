import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/blocs/setting_bloc/setting_state.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'setting_event.dart';

@injectable
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState()) {
    on<RequestSubcribeSettingEvent>(_requestSubcribe);
  }

  Future<void> _requestSubcribe(
    RequestSubcribeSettingEvent event,
    Emitter<SettingState> emit,
  ) async {
    //return state
  }
}

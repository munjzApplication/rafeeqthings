import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_and_slider_event.dart';
part 'switch_and_slider_state.dart';

class SwitchAndSliderBloc
    extends Bloc<SwitchAndSliderEvent, SwitchAndSliderState> {
  SwitchAndSliderBloc() : super(const SwitchAndSliderState()) {
    on<EnableOrDisableSwitchNotificationEvent>(
        _enableOrDisableSwitchNotificationEvent);
    on<SliderEvent>(_sliderEvent);
  }

  void _enableOrDisableSwitchNotificationEvent(
      EnableOrDisableSwitchNotificationEvent event,
      Emitter<SwitchAndSliderState> emit) {
    emit(state.copywith(isSwitchs: !state.isSwitchs));
  }

  void _sliderEvent(SliderEvent event, Emitter<SwitchAndSliderState> emit) {
    emit(state.copywith(sliderValues: event.sliderValue));
  }
}

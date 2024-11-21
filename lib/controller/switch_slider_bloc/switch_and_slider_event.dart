part of 'switch_and_slider_bloc.dart';

abstract class SwitchAndSliderEvent extends Equatable {
  const SwitchAndSliderEvent();

  @override
  List<Object> get props => [];
}


class EnableOrDisableSwitchNotificationEvent extends SwitchAndSliderEvent {
  
}

class SliderEvent extends SwitchAndSliderEvent {
  final double sliderValue;
 const SliderEvent({this.sliderValue =1.0});


   @override
  List<Object> get props => [sliderValue];
}
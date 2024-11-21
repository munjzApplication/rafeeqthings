part of 'switch_and_slider_bloc.dart';

 class SwitchAndSliderState extends Equatable {
 final bool isSwitchs;
 final double sliderValues;
 const  SwitchAndSliderState({this.isSwitchs =false, this.sliderValues=1.0});

   SwitchAndSliderState copywith({bool? isSwitchs, double? sliderValues}){
   return SwitchAndSliderState(isSwitchs: isSwitchs??this.isSwitchs,sliderValues: sliderValues??this.sliderValues);
   }
  
  @override
  List<Object> get props => [isSwitchs, sliderValues];
}


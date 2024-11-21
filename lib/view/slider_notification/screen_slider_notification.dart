import 'package:bloc_operations/controller/switch_slider_bloc/switch_and_slider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySliderAndSwitch extends StatelessWidget {
  const MySliderAndSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Notification"),
              BlocBuilder<SwitchAndSliderBloc, SwitchAndSliderState>(
                buildWhen: (current, previous) =>
                    current.isSwitchs != previous.isSwitchs,
                builder: (context, state) {
                  print("switch");
                  return Switch(
                      value: state.isSwitchs,
                      onChanged: (value) {
                        context
                            .read<SwitchAndSliderBloc>()
                            .add(EnableOrDisableSwitchNotificationEvent());
                      });
                },
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          BlocBuilder<SwitchAndSliderBloc, SwitchAndSliderState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(state.sliderValues),
                    ),
                    height: state.sliderValues * 150,
                    width: state.sliderValues * 300,
                  ),
                  CircleAvatar(
                    minRadius: state.sliderValues * 100,
                  )
                ],
              );
              // return Container(
              //   decoration: BoxDecoration(
              //     color: Colors.red.withOpacity(state.sliderValues),
              //   ),
              //   height: 150,
              //   width: 300,
              // );
            },
          ),
          BlocBuilder<SwitchAndSliderBloc, SwitchAndSliderState>(
            buildWhen: (previous, current) =>
                previous.sliderValues != current.sliderValues,
            builder: (context, state) {
              //  print("slider");
              return Slider(
                  value: state.sliderValues,
                  onChanged: (value) {
                    // print(value);
                    context
                        .read<SwitchAndSliderBloc>()
                        .add(SliderEvent(sliderValue: value));
                  });
            },
          )
        ],
      )),
    );
  }
}

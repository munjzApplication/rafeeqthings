import 'package:bloc_operations/controller/Counter_bloc/counter_bloc.dart';
import 'package:bloc_operations/controller/Counter_bloc/counter_event.dart';
import 'package:bloc_operations/controller/Counter_bloc/counter_state.dart';
import 'package:bloc_operations/view/screen_capture/screen_capture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  late CounterBloc _mycounterBloc;
  @override
  void initState() {///okeeee
    // TODO: implement initState
    super.initState();
    _mycounterBloc = CounterBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mycounterBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _mycounterBloc,
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenCapture(
                            counterBloc: _mycounterBloc,
                          ),
                        ));
                  },
                  child: const Text("Next")),
              const SizedBox(
                width: 20,
              ),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counter.toString(),
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.w600),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CounterBloc, CounterState>(
                    buildWhen: (previous, current) => false,
                    builder: (context, state) {
                      print("build add");

                      return ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(IncrementCounter());
                          },
                          child: const Text("Add"));
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  BlocBuilder<CounterBloc, CounterState>(
                    // buildWhen: (previous, current) => false,
                    builder: (context, state) {
                      print("build remove");
                      return Visibility(
                        visible: state.counter > 0 ? true : false,
                        child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<CounterBloc>()
                                  .add(DecrementCounter());
                            },
                            child: const Text("less")),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}

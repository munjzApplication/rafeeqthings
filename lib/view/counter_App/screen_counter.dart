import 'package:bloc_operations/controller/Counter_bloc/counter_bloc.dart';
import 'package:bloc_operations/controller/Counter_bloc/counter_event.dart';
import 'package:bloc_operations/controller/Counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCounter extends StatelessWidget {
  const MyCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(state.counter.toString());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCounter());
                    },
                    child: const Text("Add")),
                const SizedBox(
                  width: 20,
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Visibility(
                      visible: state.counter > 0 ? true : false,
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(DecrementCounter());
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
    );
  }
}

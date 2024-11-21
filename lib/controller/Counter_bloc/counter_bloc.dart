import 'package:bloc/bloc.dart';
import 'package:bloc_operations/controller/Counter_bloc/counter_event.dart';
import 'package:bloc_operations/controller/Counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_incrementCounterFunction);
    on<DecrementCounter>(_decrementCounterFunction);
  }

  _incrementCounterFunction(
      IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  _decrementCounterFunction(
      DecrementCounter event, Emitter<CounterState> emit) {
    if (state.counter > 0) {
      emit(state.copyWith(counter: state.counter - 1));
    }
    
  }
}

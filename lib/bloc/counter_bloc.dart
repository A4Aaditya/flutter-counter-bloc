import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_bloc/bloc/counter_event.dart';
import 'package:tut_bloc/bloc/counter_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountState(count: 0)) {
    on<CountIncrement>(_increment);
    on<CountDecrement>(_decrement);
  }

  FutureOr<void> _increment(CountIncrement event, Emitter<CountState> emit) {
    final currentValue = state.count;
    final updatedValue = currentValue + 1;
    emit(CountState(count: updatedValue));
  }

  FutureOr<void> _decrement(CountDecrement event, Emitter<CountState> emit) {
    final currentVal = state.count;
    final updatedVal = currentVal - 1;
    emit(CountState(count: updatedVal));
  }
}

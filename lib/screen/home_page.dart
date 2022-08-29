import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_bloc/bloc/counter_bloc.dart';
import 'package:tut_bloc/bloc/counter_event.dart';
import 'package:tut_bloc/bloc/counter_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tut Bloc'),
      ),
      body: BlocBuilder<CountBloc, CountState>(
        builder: (context, state) {
          return Center(
            child: Text('${state.count}',
                style: Theme.of(context).textTheme.displayMedium),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          const SizedBox(width: 30.0),
          FloatingActionButton(
            child: const Text('+'),
            onPressed: () {
              context.read<CountBloc>().add(CountIncrement());
            },
          ),
          const SizedBox(width: 30.0),
          FloatingActionButton(
            child: const Text('-'),
            onPressed: () {
              context.read<CountBloc>().add(CountDecrement());
            },
          ),
        ],
      ),
    );
  }
}

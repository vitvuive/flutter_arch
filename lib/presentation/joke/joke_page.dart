import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/di/locator.dart';
import 'package:ddd_arch/presentation/joke/blocs/joke_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokePage extends BaseBlocStatelessWidget<JokeEvent, JokeState, JokeBloc> {
  JokePage({super.key});

  @override
  Widget builder(BuildContext context, JokeState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // result text
          Center(
            child: BlocConsumer<JokeBloc, JokeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.joke != null ? state.joke!.setup! : '',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          'List jokes size: ${state.jokeList?.jokes?.length ?? 'No data'}')
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

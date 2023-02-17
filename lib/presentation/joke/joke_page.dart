import 'package:ddd_arch/di/locator.dart';
import 'package:ddd_arch/presentation/joke/blocs/joke_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokePage extends StatelessWidget {
  const JokePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JokeBloc>(
      create: (context) => getIt()..add(GetJokeEvent()),
      child: Scaffold(
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
                  return Text(
                    state.joke != null ? state.joke!.setup! : '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/presentation/joke/blocs/joke_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokePage extends BaseBlocStatelessWidget<JokeEvent, JokeState, JokeBloc> {
  JokePage({super.key});

  @override
  Widget builder(BuildContext context, JokeState state) {
    return CScaffold(
      appBar: AppBar(
        title: const Text('Joke'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: DebounceWidget(
              child: const Icon(Icons.replay),
              onTap: () {
                context.read<JokeBloc>().add(GetJokeEvent());
                context.read<JokeBloc>().add(GetJokeListEvent());
              },
            ),
          )
        ],
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.joke != null ? state.joke!.setup! : '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AppDimensions.vSpacing16,
                        Text(
                          state.joke != null ? state.joke!.punchline! : '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AppDimensions.vSpacing16,
                        Text(
                            'List jokes size: ${state.jokeList?.jokes?.length ?? 'No data'}')
                      ],
                    ),
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

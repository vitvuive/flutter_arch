import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc_state.dart';
import 'package:ddd_arch/app/navigation/routes.dart';
import 'package:ddd_arch/core/resource/colors.dart';
import 'package:ddd_arch/core/widgets/debounce_widget.dart';
import 'package:ddd_arch/di/locator.dart';
import 'package:ddd_arch/domain/repository/auth_repo.dart';
import 'package:ddd_arch/presentation/home/blocs/home_bloc.dart';
import 'package:ddd_arch/presentation/home/blocs/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends BaseBlocStatelessWidget<HomeEvent, HomeState, HomeBloc> {
  HomeView({super.key});

  @override
  List<HomeEvent> get initEvents => [RequestSubcribeState()];

  @override
  Widget builder(
    BuildContext context,
    HomeState state,
  ) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: state.authStatus == AuthStatus.authenticated
                    ? DebounceWidget(
                        child: const Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.joke,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              )
            ],
          ),
          body: _AuthenticateView(),
        );
      },
    );
  }
}

class _UnAuthenHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.login,
              );
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

class _AuthenticateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = context.select((HomeBloc bloc) => bloc.state.user);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.login,
              );
            },
            child: Text('Current user login: ${currentUser?.name ?? ''}'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.errorPage,
              );
            },
            child: const Text('Error Page'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.counterPage,
              );
            },
            child: const Text('Counter Page'),
          ),
          TextButton(
            onPressed: () {
              context.read<HomeBloc>().add(LogoutEvent());
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

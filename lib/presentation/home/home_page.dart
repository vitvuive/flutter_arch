import 'package:ddd_arch/app/navigation/routes.dart';
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
    return BlocProvider<HomeBloc>(
      create: (context) => getIt()..add(RequestSubcribeState()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.authStatus == AuthStatus.authenticated) {
            return _AuthenticateView();
          }
          return _UnAuthenHomeView();
        },
      ),
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
              context.read<HomeBloc>().add(LogoutEvent());
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}

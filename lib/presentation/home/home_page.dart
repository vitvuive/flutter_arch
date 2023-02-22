import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/app/base/bloc/common/common_bloc.dart';
import 'package:ddd_arch/app/base/bloc/common/common_event.dart';
import 'package:ddd_arch/app/navigation/routes.dart';
import 'package:ddd_arch/core/core.dart';
// import 'package:ddd_arch/app/navigation/routes.dart';
// import 'package:ddd_arch/core/resource/colors.dart';
// import 'package:ddd_arch/core/widgets/debounce_widget.dart';
import 'package:ddd_arch/domain/repository/auth_repo.dart';
import 'package:ddd_arch/l10n/l10n.dart';
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
  Widget builder(BuildContext context, HomeState state) {
    final l10n = context.l10n;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CScaffold(
          appBar: AppBar(
            title: Text(l10n.homeAppBarTitle),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: state.authStatus == AuthStatus.authenticated
                    ? DebounceWidget(
                        child: const Icon(
                          Icons.add,
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
    final l10n = context.l10n;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              '${l10n.currentUserLoginText} ${currentUser?.email ?? ''}',
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.errorPage,
              );
            },
            child: Text(l10n.errorPageText),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.counterPage,
              );
            },
            child: Text(l10n.counterPageText),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.articles,
              );
            },
            child: Text(l10n.articleText),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.loadmoreDemo,
              );
            },
            child: Text('loadmore demo'),
          ),
          TextButton(
            onPressed: () {
              context.read<CommonBloc>().add(const ForceLogout());
            },
            child: Text(l10n.logoutText),
          ),
        ],
      ),
    );
  }
}

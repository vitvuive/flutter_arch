import 'package:bloc/src/bloc.dart';
import 'package:ddd_arch/presentation/splash/bloc/splash_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/src/bloc_listener.dart';

import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc_state.dart';
import 'package:ddd_arch/presentation/splash/bloc/splash_bloc.dart';
import 'package:ddd_arch/presentation/splash/bloc/splash_state.dart';

class SplashPage
    extends BaseBlocStatelessWidget<SplashEvent, SplashState, SplashBloc> {
  SplashPage({super.key});

  @override
  Widget builder(BuildContext context, BaseBlocState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Splash Page',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }

  @override
  List<BlocListener<StateStreamable, dynamic>> get listeners => [];

  BlocListener _navigationListener() {
    return BlocListener<SplashBloc, SplashState>(listener: (context, state) {});
  }
}

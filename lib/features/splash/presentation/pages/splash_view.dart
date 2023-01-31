import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/features/splash/presentation/cubit/startup_cubit.dart';
import 'package:flutter_clean_architecture_template/features/splash/presentation/widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartUpCubit()..fetchData(),
      child: const SplashBody(),
    );
  }
}

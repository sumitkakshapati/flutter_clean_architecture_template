import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/core/bloc/common_state.dart';
import 'package:flutter_clean_architecture_template/core/routes/routes.dart';
import 'package:flutter_clean_architecture_template/features/auth/presentation/pages/login_view.dart';
import 'package:flutter_clean_architecture_template/features/splash/domain/entities/start_up_data.dart';
import 'package:flutter_clean_architecture_template/features/splash/presentation/cubit/startup_cubit.dart';
import 'package:page_transition/page_transition.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocListener<StartUpCubit, CommonState>(
        listener: (context, state) {
          if (state is CommonSuccessState<StartUpData>) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.login,
              (_) => false,
            );
          }
        },
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FlutterLogo(
                size: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

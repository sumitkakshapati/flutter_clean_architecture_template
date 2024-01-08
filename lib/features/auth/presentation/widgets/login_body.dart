import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_template/core/bloc/common_state.dart';
import 'package:flutter_clean_architecture_template/core/constants/locale_keys.dart';
import 'package:flutter_clean_architecture_template/core/routes/routes.dart';
import 'package:flutter_clean_architecture_template/core/theme/custom_theme.dart';
import 'package:flutter_clean_architecture_template/core/utils/form_validator.dart';
import 'package:flutter_clean_architecture_template/core/utils/snackbar_utils.dart';
import 'package:flutter_clean_architecture_template/core/widgets/button/custom_rounded_button.dart';
import 'package:flutter_clean_architecture_template/core/widgets/text_fields/custom_text_field.dart';
import 'package:flutter_clean_architecture_template/core/wrapper/bloc_listener_wrapper.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/param/login_param.dart';
import 'package:flutter_clean_architecture_template/features/auth/domain/entities/user.dart';
import 'package:flutter_clean_architecture_template/features/auth/presentation/cubit/login_cubit.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: CustomTheme.pagePadding,
        ),
        child: BlocListenerWrapper<LoginCubit>(
          listener: (context, state) {
            if (state is CommonSuccessState<User>) {
              SnackBarUtils.showSuccessMessage(
                context: context,
                message: LocaleKeys.loggedInSuccessfully.tr(),
              );
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.dashboard,
                (route) => false,
              );
            }
          },
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomTextField(
                  label: LocaleKeys.email.tr(),
                  hintText: LocaleKeys.email.tr(),
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    return FormValidator.validateEmail(value);
                  },
                ),
                CustomTextField(
                  label: LocaleKeys.password.tr(),
                  hintText: LocaleKeys.password.tr(),
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    return FormValidator.validatePassword(value);
                  },
                ),
                CustomRoundedButtom(
                  title: LocaleKeys.login.tr().toUpperCase(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginCubit>().login(
                            LoginParam(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

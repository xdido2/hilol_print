import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/widget/button/custom_button.dart';
import '../../../../core/widget/custom_text_field.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/auth_cubit_state.dart';
import '../state/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends LoginState {
  @override
  Widget build(BuildContext context) => BlocConsumer<AuthCubit, AuthCubitState>(
    listenWhen: (previous, current) => previous.status != current.status,
    listener: (context, state) {
      if (state.status.isError && state.action == .login) {
        context.showErrorSnackBar(state.errorMessage ?? 'Login error');
      }

      if (state.status.isSuccess && state.action == .login) {
        GoRouterHelper(context).go(AppRouter.home);
      }
    },
    builder: (context, state) => Scaffold(
      backgroundColor: context.color.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const .all(16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 60),
              Text('Welcome', style: context.textTheme.sfProDisplayW900s32),
              const SizedBox(height: 8),
              Text(
                'Sign in with username "udevs" and password "1234".',
                style: context.textTheme.interW400s14.copyWith(color: context.color.grey500),
              ),
              const SizedBox(height: 30),
              Text('Username', style: context.textTheme.interW400s14.copyWith(color: context.color.grey500)),
              const SizedBox(height: 10),
              CustomTextField(
                controller: usernameController,
                focusNode: usernameFocusNode,
                fillColor: context.color.grey60,
                style: context.textTheme.interW500s14,
                hintText: 'udevs',
                hintTextStyle: context.textTheme.interW600s14.copyWith(color: context.color.grey500),
                focusedBorderColor: context.color.primary,
                borderRadius: 56,
                contentPadding: const .symmetric(vertical: 14, horizontal: 16),
                hideErrorMessage: false,
              ),
              const SizedBox(height: 20),
              Text('Password', style: context.textTheme.interW400s14.copyWith(color: context.color.grey500)),
              const SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                isObscureText: true,
                fillColor: context.color.grey60,
                style: context.textTheme.interW500s14,
                hintText: '1234',
                hintTextStyle: context.textTheme.interW600s14.copyWith(color: context.color.grey500),
                focusedBorderColor: context.color.primary,
                borderRadius: 56,
                contentPadding: const .symmetric(vertical: 14, horizontal: 16),
                hideErrorMessage: false,
              ),
              const Spacer(),
              CustomButton(
                title: 'Sign in',
                isDisabled: !isFormValid || state.status.isLoading,
                isLoading: state.status.isLoading,
                onTap: onLoginTap,
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    ),
  );
}

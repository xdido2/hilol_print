import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/extensions/extensions.dart';
import '../bloc/auth_cubit.dart';
import '../screen/login_screen.dart';

abstract class LoginState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    usernameController.addListener(_onChanged);
    passwordController.addListener(_onChanged);
  }

  @override
  void dispose() {
    usernameController
      ..removeListener(_onChanged)
      ..dispose();
    passwordController
      ..removeListener(_onChanged)
      ..dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void _onChanged() => setState(() {});

  bool get isFormValid => usernameController.text.trim().isNotEmpty && passwordController.text.isNotEmpty;

  Future<void> onLoginTap() async {
    if (!isFormValid) return;
    context.hideKeyboard();
    await context.read<AuthCubit>().login(username: usernameController.text.trim(), password: passwordController.text);
  }
}

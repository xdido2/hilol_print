import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/widget/button/custom_button.dart';
import '../../../auth/presentation/bloc/auth_cubit.dart';
import '../../../auth/presentation/bloc/auth_cubit_state.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_cubit_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.color.scaffoldBackground,
    appBar: AppBar(backgroundColor: context.color.scaffoldBackground, title: const Text('Profile'), centerTitle: false),
    body: BlocListener<AuthCubit, AuthCubitState>(
      listenWhen: (previous, current) => previous.status != current.status && current.action == .logout,
      listener: (context, state) {
        if (state.status.isSuccess) GoRouterHelper(context).go(AppRouter.initial);
      },
      child: BlocBuilder<ProfileCubit, ProfileCubitState>(
        builder: (context, state) {
          if (state.status.isLoading && state.profile == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final profile = state.profile;
          if (profile == null) {
            return Center(child: Text(state.errorMessage ?? 'Error'));
          }
          return Padding(
            padding: const .all(16),
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                Container(
                  padding: const .all(20),
                  decoration: BoxDecoration(color: context.color.grey60, borderRadius: .circular(16)),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text('Username', style: context.textTheme.interW400s14.copyWith(color: context.color.grey500)),
                      const SizedBox(height: 4),
                      Text(profile.username, style: context.textTheme.interW600s16),
                      const SizedBox(height: 12),
                      Text('Full name', style: context.textTheme.interW400s14.copyWith(color: context.color.grey500)),
                      const SizedBox(height: 4),
                      Text(profile.fullName, style: context.textTheme.interW600s16),
                    ],
                  ),
                ),
                const Spacer(),
                CustomButton(title: 'Logout', onTap: context.read<AuthCubit>().logout),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    ),
  );
}

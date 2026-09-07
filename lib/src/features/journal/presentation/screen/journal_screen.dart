import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/extensions/extensions.dart';
import '../cubit/journal_cubit.dart';
import '../cubit/journal_cubit_state.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.color.scaffoldBackground,
    appBar: AppBar(backgroundColor: context.color.scaffoldBackground, title: const Text('Journal'), centerTitle: false),
    body: BlocBuilder<JournalCubit, JournalCubitState>(
      builder: (context, state) {
        if (state.status.isLoading && state.entries.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status.isError && state.entries.isEmpty) {
          return Center(child: Text(state.errorMessage ?? 'Error'));
        }
        return ListView.separated(
          padding: const .all(16),
          itemCount: state.entries.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (_, index) {
            final entry = state.entries[index];
            return Container(
              padding: const .all(16),
              decoration: BoxDecoration(color: context.color.grey60, borderRadius: .circular(16)),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(entry.title, style: context.textTheme.interW600s16),
                  const SizedBox(height: 4),
                  Text(entry.note, style: context.textTheme.interW400s14.copyWith(color: context.color.grey500)),
                ],
              ),
            );
          },
        );
      },
    ),
  );
}

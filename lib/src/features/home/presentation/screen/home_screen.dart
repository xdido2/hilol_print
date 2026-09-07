import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/widget/button/custom_button.dart';
import '../../../card/presentation/cubit/card_list_cubit.dart';
import '../../../card/presentation/cubit/card_list_cubit_state.dart';
import '../../../card/presentation/widget/card_list_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// The add-card flow runs on the root navigator with its own cubit, so the
  /// list is reloaded from storage once the form reports a saved card.
  Future<void> _onAddCardTap(BuildContext context) async {
    final cubit = context.read<CardListCubit>();
    final bool? isAdded = await GoRouterHelper(context).push<bool>(AppRouter.addCard);
    if (isAdded ?? false) await cubit.load();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.color.scaffoldBackground,
    appBar: AppBar(
      backgroundColor: context.color.scaffoldBackground,
      title: Text(context.l10n.homeTitle),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () => _onAddCardTap(context),
          icon: Icon(Icons.add_card_outlined, color: context.color.primary),
          tooltip: context.l10n.cardAddTitle,
        ),
        const SizedBox(width: 8),
      ],
    ),
    body: BlocBuilder<CardListCubit, CardListCubitState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state.status.isLoading && !state.hasCards) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status.isError && !state.hasCards) {
          return _CardsError(message: state.errorMessage ?? context.l10n.cardsLoadError);
        }

        return RefreshIndicator(
          onRefresh: context.read<CardListCubit>().load,
          child: state.hasCards ? _CardsList(state: state) : const _CardsEmpty(),
        );
      },
    ),
  );
}

final class _CardsList extends StatelessWidget {
  const _CardsList({required this.state});

  final CardListCubitState state;

  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: const .fromLTRB(16, 8, 16, 16),
    physics: const AlwaysScrollableScrollPhysics(),
    // The section header takes the first slot, the cards follow.
    itemCount: state.cards.length + 1,
    separatorBuilder: (_, _) => const SizedBox(height: 12),
    itemBuilder: (context, index) => index == 0
        ? Padding(
            padding: const .only(bottom: 4),
            child: Text(context.l10n.cardsSectionTitle, style: context.textTheme.sfProDisplayW700s18),
          )
        : CardListItemWidget(card: state.cards[index - 1]),
  );
}

final class _CardsEmpty extends StatelessWidget {
  const _CardsEmpty();

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return LayoutBuilder(
      // A fixed-height box keeps the empty state centred and still lets the
      // pull-to-refresh gesture reach the scrollable.
      builder: (context, constraints) => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Padding(
            padding: const .symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Icon(Icons.credit_card_off_outlined, size: 56, color: colors.grey400),
                const SizedBox(height: 16),
                Text(
                  context.l10n.cardsEmptyTitle,
                  textAlign: .center,
                  style: context.textTheme.sfProDisplayW700s18,
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.cardsEmptySubtitle,
                  textAlign: .center,
                  style: context.textTheme.interW400s14Grey500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final class _CardsError extends StatelessWidget {
  const _CardsError({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const .symmetric(horizontal: 32),
    child: Column(
      mainAxisAlignment: .center,
      children: [
        Text(message, textAlign: .center, style: context.textTheme.interW400s14Grey500),
        const SizedBox(height: 20),
        CustomButton(title: context.l10n.commonRetry, onTap: context.read<CardListCubit>().load),
      ],
    ),
  );
}

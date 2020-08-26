import 'package:crypto_currency_wallet/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../styles.dart';
import '../main_account.dart';
import 'package:crypto_repository/crypto_repository.dart';

class MainAccountView extends StatefulWidget {
  @override
  _MainAccountViewState createState() => _MainAccountViewState();
}

class _MainAccountViewState extends State<MainAccountView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey();
  var filterApplied = false;
  List<AccountData> currentData = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: ClearAppBar(),
      body: BlocProvider.value(
        value: AccountListCubit(RepositoryProvider.of(context))..refresh(),
        child: BlocConsumer<AccountListCubit, AccountListState>(
            buildWhen: (stateA, stateB) {
          if (stateA.visibleDetails != stateB.visibleDetails) {
            return currentData.isEmpty;
          } else {
            return stateA != stateB;
          }
        }, listener: (context, state) {
          if (state.state == AccountListProgress.Loading) {
            _refreshIndicatorKey.currentState.show();
          }

          setState(() {
            filterApplied = state.hideEmpty;
          });

          if (currentData.isNotEmpty) {
            for (var item in currentData) {
              if (!state.visibleDetails.contains(item)) {
                _animatedListKey.currentState.removeItem(
                    currentData.indexOf(item),
                    (context, animation) => AccountListItem(
                          accountData: item,
                        ));
              }
            }

            for (var item in state.visibleDetails) {
              if (currentData.contains(item) == false) {
                print("Adding item ${item.toString()}");
                _animatedListKey.currentState
                    .insertItem(currentData.length + 1);
              } else {
                print("Already contains ${item.toString()}");
              }
            }

            currentData.clear();
            currentData.addAll(state.visibleDetails);
          }
        }, builder: (context, result) {
          switch (result.state) {
            case AccountListProgress.Loading:
              return _buildLoadingListView();
              break;
            case AccountListProgress.HaveData:
              return RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: () async =>
                      await BlocProvider.of<AccountListCubit>(context)
                          .refresh(),
                  child: _loadFullData(result.visibleDetails));
              break;
            default:
              return Container(
                child: Text("Error"),
              );
              break;
          }
        }),
      ),
    );
  }

  Widget _buildLoadingListView() {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (_, __) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Shimmer.fromColors(
              key: const Key('synonyms_loading_shimmer'),
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: true,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.only(left: 32.0),
                    height: 32,
                    width: 32,
                  ),
                  Spacer(),
                  Container(
                    color: Colors.white,
                    width: 100,
                    height: 32,
                  ),
                  Spacer(),
                  Container(
                    color: Colors.white,
                    width: 150,
                    height: 44,
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
        });
  }

  Widget _loadFullData(List<AccountData> data) {
    currentData.clear();
    currentData.addAll(data);
    return Stack(
      children: [
        AnimatedList(
          key: _animatedListKey,
          initialItemCount: data.length,
          itemBuilder: (_, item, animation) {
            return AccountListItem(
              accountData: data[item],
            );
          },
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 0.9,
          minChildSize: 0.1,
          builder: (context, scroll) => Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                TouchIndicator(),
                FilterCheckBox(
                  checkBoxValue: filterApplied,
                  onCheckChanged: () =>
                      BlocProvider.of<AccountListCubit>(context)
                          .toggleEmptyAccounts(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

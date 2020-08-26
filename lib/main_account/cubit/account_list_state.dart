part of 'account_list_cubit.dart';

enum AccountListProgress { Loading, HaveData, Error }

class AccountListState extends Equatable {
  final AccountListProgress state;
  final AllUserDetails details;
  final bool hideEmpty;
  final List<AccountData> visibleDetails;

  const AccountListState._(this.state,
      {this.details, this.hideEmpty = false, this.visibleDetails});

  const AccountListState.initial({bool hideEmpty = false})
      : this._(AccountListProgress.Loading);

  const AccountListState.error() : this._(AccountListProgress.Error);

  const AccountListState.haveData(
      AllUserDetails details, bool hideEmpty, List<AccountData> visibleDetails)
      : this._(AccountListProgress.HaveData,
            details: details, visibleDetails: visibleDetails);

  AccountListState copyWith(bool hideEmpty, List<AccountData> newData) =>
      AccountListState._(this.state,
          details: this.details, hideEmpty: hideEmpty, visibleDetails: newData);

  @override
  List<Object> get props =>
      [this.state, this.details, this.hideEmpty, this.visibleDetails];
}

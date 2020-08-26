import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:crypto_repository/crypto_repository.dart';

part 'account_list_state.dart';

class AccountListCubit extends Cubit<AccountListState> {
  final WalletRepository repository;

  AccountListCubit(this.repository) : super(AccountListState.initial());

  Future<void> refresh() async {
    emit(AccountListState.initial(hideEmpty: state.hideEmpty));
    final result = await this.repository.allUserData();

    if (state.hideEmpty) {
      emit(AccountListState.haveData(
          result, state.hideEmpty, _filterEmptyData(result)));
    } else {
      emit(AccountListState.haveData(result, state.hideEmpty, result.accounts));
    }
  }

  void toggleEmptyAccounts() {
    final isEmptyNow = !state.hideEmpty;

    if (isEmptyNow) {
      emit(state.copyWith(isEmptyNow, _filterEmptyData(state.details)));
    } else {
      emit(state.copyWith(isEmptyNow, state.details.accounts));
    }
  }

  List<AccountData> _filterEmptyData(AllUserDetails result) {
    return result.accounts
        .where((element) => double.parse(element.balance) > 0)
        .toList();
  }
}

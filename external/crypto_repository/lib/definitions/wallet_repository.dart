import '../crypto_repository.dart';

abstract class WalletRepository {
  Future<AllUserDetails> allUserData();
}

class DefaultRemoteRepository implements WalletRepository {
  @override
  Future<AllUserDetails> allUserData() async {
    await Future.delayed(Duration(seconds: 3));
    return await Future.value(AllUserDetails(accounts: mockAccount()));
  }
}

import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';

class SuiInfomationViewModel extends BaseViewModel {
  String address =
      '0xd53cb47969f2ac3e9d11d126c2994e6549e7967e2583ab55ea057f0bb760d1cc';

  List<SuiObjectResponse>? get ownedObject => _ownedObject?.data;
  PaginatedObjectsResponse? _ownedObject;

  int? get balance => _balance?.coinObjectCount;
  CoinBalance? _balance;

  SuiInfomationViewModel() {
    load();
  }

  Future<void> load() async {
    getBalance();
    getOwnedObjects();
    notifyListeners();
  }

  Future<void> getBalance() async {
    final client = SuiClient(SuiUrls.testnet);

    _balance = await client.getBalance(address);

    notifyListeners();
  }

  Future<void> requestFaucet() async {
    final faucet = FaucetClient(SuiUrls.faucetDev);
    await faucet.requestSuiFromFaucetV1(address);

    load();
  }

  Future<void> getOwnedObjects() async {
    final client = SuiClient(SuiUrls.testnet);

    _ownedObject = await client.getOwnedObjects(address);

    notifyListeners();
  }
}

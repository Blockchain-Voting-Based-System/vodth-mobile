import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';

class SuiInfomationViewModel extends BaseViewModel {
  String address =
      '0x2b42771d127c7aee2ef9fefc054d00e87adab986ccaf7c5386aa07df7bce9b0b';

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
    final client = SuiClient(SuiUrls.devnet);

    _balance = await client.getBalance(address);

    notifyListeners();
  }

  Future<void> requestFaucet() async {
    final faucet = FaucetClient(SuiUrls.faucetDev);
    await faucet.requestSuiFromFaucetV1(address);

    load();
  }

  Future<void> getOwnedObjects() async {
    final client = SuiClient(SuiUrls.devnet);

    _ownedObject = await client.getOwnedObjects(address);

    notifyListeners();
  }
}

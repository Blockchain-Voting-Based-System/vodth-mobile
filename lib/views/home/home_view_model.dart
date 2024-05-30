import 'package:sui/sui.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';
import 'package:vodth_mobile/core/models/vodth/event_model.dart';

class HomeViewModel extends BaseViewModel {
  String address =
      '0x2b42771d127c7aee2ef9fefc054d00e87adab986ccaf7c5386aa07df7bce9b0b';

  List<SuiObjectResponse>? get ownedObject => _ownedObject?.data;
  PaginatedObjectsResponse? _ownedObject;

  int? get balance => _balance?.coinObjectCount;
  CoinBalance? _balance;

  HomeViewModel() {
    load();
  }

  Future<void> load() async {
    getBalance();
    getOwnedObjects();
    notifyListeners();
  }

  final List<EventModel> events = [
    EventModel(
      id: 1,
      title: 'JCI Present Election',
      description: 'Representative of the Kungfu panda club',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      activate: true,
      bannerUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg3JEBrivo1oZRbeKNoiqhGLz2x5QmdLYXqjNRObkTEw&s',
      candidates: [],
    ),
    EventModel(
      id: 2,
      title: 'BookMeBus Senior Voting Event',
      description: 'BookMeBus is a bus ticket booking platform',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      activate: true,
      bannerUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg3JEBrivo1oZRbeKNoiqhGLz2x5QmdLYXqjNRObkTEw&s',
      candidates: [],
    ),
    EventModel(
      id: 2,
      title: 'CADT Student Embassador Election',
      description: 'BookMeBus is a bus ticket booking platform',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      activate: true,
      bannerUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg3JEBrivo1oZRbeKNoiqhGLz2x5QmdLYXqjNRObkTEw&s',
      candidates: [],
    ),
  ];

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

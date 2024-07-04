import 'package:sui/cryptography/signature.dart';
import 'package:sui/sui_account.dart';
import 'package:sui/sui_client.dart';
import 'package:sui/sui_urls.dart';

class SignTransactionService {
  final SuiAccount account = SuiAccount.fromMnemonics(
    "hybrid bulk segment twelve puzzle evoke hockey defy lava sleep sword want",
    SignatureScheme.Ed25519,
  );

  final SuiClient client = SuiClient(SuiUrls.testnet);

  final String packageObjectId = '0xab81384c6b7b4244cdd8d8d940810f5d5f1657aded5055dbc99d9a0c0e2d3ae2';
}

import 'package:sui/cryptography/signature.dart';
import 'package:sui/sui_account.dart';
import 'package:sui/sui_client.dart';
import 'package:sui/sui_urls.dart';

class SignTransactionService {
  final SuiAccount account = SuiAccount.fromMnemonics(
    "hybrid bulk segment twelve puzzle evoke hockey defy lava sleep sword want",
    SignatureScheme.Ed25519,
  );

  final SuiClient client = SuiClient(SuiUrls.devnet);

  final String packageObjectId = '0x98a90bd1fd6b4e3481a860f2d401d452135af3c18e2d00b12f7c158c182c37a5';
}

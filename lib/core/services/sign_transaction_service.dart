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

  final String packageObjectId = '0xc9dbcbffb3f83b9c36cc03c1acb0bf1b77abadf0ef0536257893e328b6c47376';
}

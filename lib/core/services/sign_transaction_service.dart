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

  final String packageObjectId = '0xe5f1a6e59ff0ad16e5859d6b89bdf4f3165a2297c43d6b4510209de7146a7308';
}

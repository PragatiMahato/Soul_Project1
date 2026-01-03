
import 'package:soul_project/Presentations/Screens/wallet_connect/wallet_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'wallet_data.dart';

Future<void> openOrInstallWallet(WalletInfo wallet) async {
  final schemeUrl = Uri.parse("${wallet.scheme}://");
  if (await canLaunchUrl(schemeUrl)) {
    await launchUrl(schemeUrl);
  } else {
    // Open store link
    final storeUrl = Uri.parse(wallet.androidStore); 
    if (await canLaunchUrl(storeUrl)) {
      await launchUrl(storeUrl);
    }
  }
}


import 'package:url_launcher/url_launcher.dart';
import 'package:wallet/wallet/model.dart';


Future<void> openOrInstallWallet(WalletInfo wallet) async {
  final schemeUrl = Uri.parse("${wallet.scheme}://");
  if (await canLaunchUrl(schemeUrl)) {
    await launchUrl(schemeUrl);
  } else {
    // Open store link
    final storeUrl = Uri.parse(wallet.androidStore); // for Android, use conditionally for iOS
    if (await canLaunchUrl(storeUrl)) {
      await launchUrl(storeUrl);
    }
  }
}

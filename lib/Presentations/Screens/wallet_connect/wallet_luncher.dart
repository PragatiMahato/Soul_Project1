
import 'package:soul_project/Presentations/Screens/wallet_connect/wallet_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'wallet_data.dart';

import 'package:url_launcher/url_launcher.dart';
import 'wallet_data.dart';

Future<void> openOrInstallWallet(WalletInfo wallet) async {
  final Uri schemeUri = Uri.parse('${wallet.scheme}://');

  if (await canLaunchUrl(schemeUri)) {
    await launchUrl(schemeUri, mode: LaunchMode.externalApplication);
  } else {
    // Play Store / App Store
    if (await canLaunchUrl(Uri.parse(wallet.androidStore))) {
      await launchUrl(Uri.parse(wallet.androidStore),
          mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(Uri.parse(wallet.iosStore))) {
      await launchUrl(Uri.parse(wallet.iosStore),
          mode: LaunchMode.externalApplication);
    } else {
      print("Cannot open wallet or store for ${wallet.name}");
    }
  }
}

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallet/wallet/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WalletController extends GetxController {
  var supportedWallets = <WalletInfo>[].obs;
  var selectedWallet = Rxn<WalletInfo>();

  // Add this line for search functionality
  var searchQuery = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchWallets();
  }

  Future<void> fetchWallets() async {
    try {
      final response = await http.get(Uri.parse("https://your-api.com/wallets"));
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        supportedWallets.value = data.map((e) => WalletInfo.fromJson(e)).toList();
      }
    } catch (e) {
      print("Error fetching wallets: $e");
    }
  }

  Future<void> openOrInstallWallet(WalletInfo wallet) async {
    final schemeUrl = Uri.parse("${wallet.scheme}://");
    if (await canLaunchUrl(schemeUrl)) {
      await launchUrl(schemeUrl);
    } else {
      final storeUrl = Uri.parse(wallet.androidStore); // handle iOS conditionally
      if (await canLaunchUrl(storeUrl)) {
        await launchUrl(storeUrl);
      }
    }
    selectedWallet.value = wallet;
  }
}

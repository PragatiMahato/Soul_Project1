import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/wallet/controls.dart';
import 'package:wallet/wallet/wallet_screen.dart';


class HomeScreen extends StatelessWidget {
  final WalletController controller = Get.put(WalletController());

  void showWalletSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ConnectWalletSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WalletConnect Demo")),
      body: Center(
        child: Obx(() {
          if (controller.selectedWallet.value == null) {
            return ElevatedButton(
              onPressed: () => showWalletSheet(context),
              child: const Text("Connect Wallet"),
            );
          } else {
            final wallet = controller.selectedWallet.value!;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Connected Wallet"),
                Text(wallet.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => controller.selectedWallet.value = null,
                  child: const Text("Disconnect"),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}

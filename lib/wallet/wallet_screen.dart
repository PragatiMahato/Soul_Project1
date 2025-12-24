import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wallet/wallet/controls.dart';


class ConnectWalletSheet extends StatelessWidget {
  final WalletController controller = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final wallets = controller.supportedWallets.take(5).toList();
      return Container(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Connect Wallet",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...wallets.map((wallet) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.network(wallet.iconUrl, height: 32),
                  title: Text(wallet.name),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    await controller.openOrInstallWallet(wallet);
                    Navigator.pop(context);
                  },
                )),
          ],
        ),
      );
    });
  }
}

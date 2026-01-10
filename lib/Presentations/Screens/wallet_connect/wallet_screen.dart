import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soul_project/Presentations/Screens/wallet_connect/controller.dart';


class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WalletController(),
      child: const _WalletView(),
    );
  }
}

class _WalletView extends StatelessWidget {
  const _WalletView();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<WalletController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Connect Wallet")),
      body: Center(
        child: _buildContent(controller, context),
      ),
    );
  }

  Widget _buildContent(WalletController c, BuildContext context) {
    switch (c.state) {
      case WalletState.idle:
        return ElevatedButton(
          onPressed: () => c.connect(),
          child: const Text("Connect Wallet"),
        );

      case WalletState.connecting:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 12),
            Text("Connecting wallet..."),
          ],
        );

      case WalletState.connected:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Connected",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(c.walletAddress ?? ""),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => c.disconnect(),
              child: const Text("Remove Connection"),
            ),
          ],
        );
    }
  }
}

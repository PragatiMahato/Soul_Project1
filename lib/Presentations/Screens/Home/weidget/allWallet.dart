import 'package:flutter/material.dart';

class AllWalletPage extends StatelessWidget {
  const AllWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wallets = [
      "MetaMask",
      "OKX Wallet",
      "Bitget Wallet",
      "Rainbow",
      "Coinbase Wallet",
      "Trust Wallet",
      "Safe",
      "Uniswap",
      "TokenPocket",
      "WalletConnect",
      "Phantom",
      "World App",
      "Bee Wallet",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("All Wallet (15+)"),
        leading: const BackButton(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...wallets.map(
            (w) => ListTile(
              title: Text(w),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search Wallet",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

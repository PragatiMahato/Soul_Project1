import 'package:flutter/material.dart';
import 'package:soul_project/Presentations/Screens/wallet_connect/wallet_data.dart';
import 'package:soul_project/Presentations/Screens/wallet_connect/wallet_luncher.dart';

class AllWalletSheet extends StatefulWidget {
  const AllWalletSheet({super.key});

  @override
  State<AllWalletSheet> createState() => _AllWalletSheetState();
}

class _AllWalletSheetState extends State<AllWalletSheet> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final wallets = supportedWallets
        .where((w) => w.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          /// Header
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              const Expanded(
                child: Text(
                  "All Wallet (15+)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Wallet List
          Expanded(
            child: ListView.builder(
              itemCount: wallets.length,
              itemBuilder: (_, i) {
                final wallet = wallets[i];
                return ListTile(
                  leading: Image.asset(wallet.icon, height: 32),
                  title: Text(wallet.name),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    await openOrInstallWallet(wallet);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          /// Search at Bottom
          TextField(
            onChanged: (v) => setState(() => query = v),
            decoration: InputDecoration(
              hintText: "Search Wallet",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: const Color(0xFFF4F4F4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:soul_project/Presentations/Screens/Home/weidget/allWallet.dart';

class ConnectWalletSheet extends StatelessWidget {
  const ConnectWalletSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SheetHeader(
            title: "Connect Wallet",
            onClose: () => Navigator.pop(context),
          ),

          _walletTile("MetaMask"),
          _walletTile("OKX Wallet"),
          _walletTile("Bitget Wallet"),
          _walletTile("Rainbow"),
          _walletTile("Coinbase Wallet"),

          const SizedBox(height: 12),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AllWalletPage()),
              );
            },
            child: const Text(
              "All Wallet (15+)",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _walletTile(String name) {
  return ListTile(
    title: Text(name),
    trailing: const Icon(Icons.chevron_right),
  );
}


}



class _SheetHeader extends StatelessWidget {
  final String title;
  final VoidCallback onClose;

  const _SheetHeader({required this.title, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Spacer(),
        IconButton(onPressed: onClose, icon: const Icon(Icons.close)),
      ],
    );
  }
}
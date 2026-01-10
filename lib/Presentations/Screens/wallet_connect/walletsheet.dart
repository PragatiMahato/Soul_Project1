import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_project/Presentations/Screens/wallet_connect/allwallet.dart';
import 'package:soul_project/Presentations/Screens/wallet_connect/wallet_data.dart';
import 'package:soul_project/Presentations/Screens/wallet_connect/wallet_luncher.dart';

class ConnectWalletSheet extends StatelessWidget {
  final Function(String walletName) onSelect;

  const ConnectWalletSheet({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final topWallets = supportedWallets.take(5).toList(); 

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

          // Wallet list
         ...topWallets.map(
  (wallet) => ListTile(
    contentPadding: EdgeInsets.zero,
    leading: wallet.icon.endsWith(".svg")
        ? SvgPicture.network(
            wallet.icon,
            height: 32,
            placeholderBuilder: (context) =>
                const Icon(Icons.account_balance_wallet),
          )
        : Image.network(
            wallet.icon,
            height: 32,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.account_balance_wallet),
          ),
    title: Text(wallet.name),
    trailing: const Icon(Icons.chevron_right),
    onTap: () async {
await openOrInstallWallet(context, wallet);
  onSelect(wallet.name);
},

  ),
),


          const SizedBox(height: 16),

          /// shows all Wallet Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const AllWalletSheet(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF2F2F2),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                "All Wallet (15+)",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget _walletTile(wallet, {required VoidCallback onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(wallet.icon, height: 32),
      title: Text(wallet.name),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

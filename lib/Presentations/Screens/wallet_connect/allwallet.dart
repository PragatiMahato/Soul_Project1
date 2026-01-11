import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soul_project/Presentations/Screens/wallet_connect/wallet_luncher.dart';
import 'wallet_data.dart';

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
          // ---------- HEADER ----------
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Text(
                  "All Wallet (${wallets.length})",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ---------- LIST / EMPTY STATE ----------
          Expanded(
            child: wallets.isEmpty
                ? _noResultView()
                : ListView.builder(
                    itemCount: wallets.length,
                    itemBuilder: (_, i) {
                      final wallet = wallets[i];

                      return ListTile(
                        leading: wallet.icon.endsWith(".svg")
                            ? SvgPicture.network(
                                wallet.icon,
                                height: 32,
                                placeholderBuilder: (_) =>
                                    const Icon(Icons.account_balance_wallet),
                              )
                            : Image.network(
                                wallet.icon,
                                height: 32,
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.account_balance_wallet),
                              ),
                        title: Text(wallet.name),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () async {
                          await openOrInstallWallet(context, wallet);
                        },
                      );
                    },
                  ),
          ),

          const SizedBox(height: 16),

          // ---------- SEARCH BAR ----------
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

  // ---------- EMPTY STATE ----------
  Widget _noResultView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 🔍 Search illustration (same feel as image)
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F4),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.search,
            size: 72,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'No result found for "$query"',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

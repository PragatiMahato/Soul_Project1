import 'package:flutter/material.dart';

import 'package:soul_project/Presentations/Screens/wallet_connect/wallet_Service.dart';
import 'package:soul_project/Presentations/Screens/wallet_connect/walletsheet.dart';


class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final walletService = WalletConnectService();
  String? walletAddress;

  @override
  void initState() {
    super.initState();
    walletService.init();
  }

  void showWalletSheet() {
   showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (_) => ConnectWalletSheet(
    onSelect: (walletName) {
      print("Selected wallet: $walletName");
    },
  ),
);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WalletConnect Demo")),
      body: Center(
        child: walletAddress == null
            ? ElevatedButton(
                onPressed: showWalletSheet,
                child: const Text("Connect Wallet"),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Connected Wallet"),
                  Text(
                    walletAddress!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      await walletService.disconnect();
                      setState(() => walletAddress = null);
                    },
                    child: const Text("Disconnect"),
                  ),
                ],
              ),
      ),
    );
  }
}

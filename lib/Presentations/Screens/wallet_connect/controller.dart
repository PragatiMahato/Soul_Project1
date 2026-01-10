import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher.dart';

enum WalletState { idle, connecting, connected }

class WalletController extends ChangeNotifier {
  WalletState state = WalletState.idle;
  String? walletName;
  String? walletAddress;

  late WalletConnect connector;
  SessionStatus? session;

  WalletController() {
    connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'Soul Project',
        description: 'Wallet connection',
        url: 'https://example.com',
        icons: ['https://walletconnect.com/walletconnect-logo.png'],
      ),
    );
  }

  Future<void> connect() async {
    state = WalletState.connecting;
    notifyListeners();

    if (!connector.connected) {
      session = await connector.createSession(
        chainId: 1,
        onDisplayUri: (uri) async {
          await launchUrl(
            Uri.parse(uri),
            mode: LaunchMode.externalApplication,
          );
        },
      );
    }

    walletAddress = session?.accounts.first;
    state = WalletState.connected;
    notifyListeners();

    Fluttertoast.showToast(msg: "Wallet connected");
  }

  Future<void> disconnect() async {
    await connector.killSession();
    state = WalletState.idle;
    walletAddress = null;
    notifyListeners();

    Fluttertoast.showToast(msg: "Wallet disconnected");
  }
}

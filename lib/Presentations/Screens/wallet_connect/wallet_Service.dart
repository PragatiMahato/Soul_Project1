import 'package:url_launcher/url_launcher.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class WalletConnectService {
  late WalletConnect connector;
  SessionStatus? session;

  void init() {
    connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'My Flutter DApp',
        description: 'WalletConnect Flutter Demo',
        url: 'https://example.com',
        icons: [
          'https://walletconnect.com/walletconnect-logo.png',
        ],
      ),
    );
  }

  Future<String?> connectWallet() async {
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

    return session?.accounts.first;
  }

  Future<void> disconnect() async {
    if (connector.connected) {
      await connector.killSession();
      session = null;
    }
  }
}

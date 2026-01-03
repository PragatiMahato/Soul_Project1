import 'package:soul_project/Presentations/Screens/wallet_connect/wallet_model.dart';

import 'wallet_data.dart';


final List<WalletInfo> supportedWallets = [
  WalletInfo(
    name: "MetaMask",
    icon: "assets/wallet/metamax.png",
    scheme: "metamask",
    androidStore: "https://play.google.com/store/apps/details?id=io.metamask",
    iosStore: "https://apps.apple.com/app/metamask/id1438144202",
  ),
  WalletInfo(
    name: "Trust Wallet",
    icon: "assets/wallet/trust_wallet.png",
    scheme: "trust",
    androidStore:
        "https://play.google.com/store/apps/details?id=com.wallet.crypto.trustapp",
    iosStore:
        "https://apps.apple.com/app/trust-crypto-bitcoin-wallet/id1288339409",
  ),
  WalletInfo(
    name: "Coinbase Wallet",
    icon: "assets/wallet/coinbase.png",
    scheme: "cbwallet",
    androidStore: "https://play.google.com/store/apps/details?id=org.toshi",
    iosStore: "https://apps.apple.com/app/coinbase-wallet/id1278383455",
  ),
  WalletInfo(
    name: "Rainbow",
    icon: "assets/wallet/rainbow.png",
    scheme: "rainbow",
    androidStore: "https://play.google.com/store/apps/details?id=me.rainbow",
    iosStore:
        "https://apps.apple.com/app/rainbow-ethereum-wallet/id1457119021",
  ),
  WalletInfo(
    name: "Phantom",
    icon: "assets/wallet/phantom.png",
    scheme: "phantom",
    androidStore:
        "https://play.google.com/store/apps/details?id=app.phantom",
    iosStore: "https://apps.apple.com/app/phantom-solana-wallet/id1598432977",
  ),
  WalletInfo(
    name: "Argent",
    icon: "assets/wallet/metamax.png",
    scheme: "argent",
    androidStore: "https://play.google.com/store/apps/details?id=com.argentlabs.android",
    iosStore: "https://apps.apple.com/app/argent/id1358741923",
  ),
  WalletInfo(
    name: "imToken",
    icon: "assets/wallet/metamax.png",
    scheme: "imtoken",
    androidStore: "https://play.google.com/store/apps/details?id=im.token.app",
    iosStore: "https://apps.apple.com/app/imtoken/id1160689873",
  ),
  WalletInfo(
    name: "SafePal",
    icon: "assets/wallet/metamax.png",
    scheme: "safepal",
    androidStore: "https://play.google.com/store/apps/details?id=com.safepal.wallet",
    iosStore: "https://apps.apple.com/app/safepal-wallet/id1487696815",
  ),
  WalletInfo(
    name: "Exodus",
    icon: "assets/wallet/metamax.png",
    scheme: "exodus",
    androidStore: "https://play.google.com/store/apps/details?id=exodusmovement.exodus",
    iosStore: "https://apps.apple.com/app/exodus/id1414384820",
  ),
  WalletInfo(
    name: "MyEtherWallet",
    icon: "assets/wallet/metamax.png",
    scheme: "mew",
    androidStore: "https://play.google.com/store/apps/details?id=com.myetherwallet.mewconnect",
    iosStore: "https://apps.apple.com/app/myetherwallet/id1461489989",
  ),
  WalletInfo(
    name: "Blockchain Wallet",
    icon: "assets/wallet/metamax.png",
    scheme: "blockchain",
    androidStore: "https://play.google.com/store/apps/details?id=piuk.blockchain.android",
    iosStore: "https://apps.apple.com/app/blockchain-wallet/id493253309",
  ),
  WalletInfo(
    name: "ZenGo",
    icon: "assets/wallet/metamax.png",
    scheme: "zengo",
    androidStore: "https://play.google.com/store/apps/details?id=com.zengo.zengo",
    iosStore: "https://apps.apple.com/app/zengo/id1465368687",
  ),
];

import 'wallet_model.dart';

final List<WalletInfo> supportedWallets = [
  WalletInfo(
    name: "MetaMask",
    icon: "https://play-lh.googleusercontent.com/lm6Rk4Qc3eXUIxC8qkFCj46Bho6fbi6Lu3TwWuS3JNU2bBEcNU61arw_wG5wA0c-4IE=w480-h960-rw",
    scheme: "metamask",
    androidStore: "https://play.google.com/store/apps/details?id=io.metamask",
    iosStore: "https://apps.apple.com/app/metamask/id1438144202",
  ),
  WalletInfo(
    name: "Trust Wallet",
    icon: "https://trustwallet.com/assets/images/media/assets/TWT.png",
    scheme: "trust",
    androidStore: "https://play.google.com/store/apps/details?id=com.wallet.crypto.trustapp",
    iosStore: "https://apps.apple.com/app/trust-crypto-bitcoin-wallet/id1288339409",
  ),
  WalletInfo(
    name: "Coinbase Wallet",
    icon: "https://play-lh.googleusercontent.com/PjoJoG27miSglVBXoXrxBSLveV6e3EeBPpNY55aiUUBM9Q1RCETKCOqdOkX2ZydqVf0=w480-h960-rw",
    scheme: "cbwallet",
    androidStore: "https://play.google.com/store/apps/details?id=com.coinbase.android&hl=en",
    iosStore: "https://apps.apple.com/us/app/coinbase-buy-btc-eth-sol/id886427730",
  ),
  WalletInfo(
    name: "Rainbow",
    icon: "https://play-lh.googleusercontent.com/fMUvmUmIpIDoZGTACYohbY3DE7-24GFkQ21WjVHxa57qluzWrr7khkycE8cz_juhew=w480-h960-rw",
    scheme: "rainbow",
    androidStore: "https://play.google.com/store/apps/details?id=me.rainbow",
    iosStore: "https://apps.apple.com/app/rainbow-ethereum-wallet/id1457119021",
  ),
  WalletInfo(
    name: "Phantom",
    icon: "https://play-lh.googleusercontent.com/obRvW02OTYLzJuvic1ZbVDVXLXzI0Vt_JGOjlxZ92XMdBF_i3kqU92u9SgHvJ5pySdM=w480-h960-rw",
    scheme: "phantom",
    androidStore: "https://play.google.com/store/apps/details?id=app.phantom",
    iosStore: "https://apps.apple.com/app/phantom-solana-wallet/id1598432977",
  ),
  WalletInfo(
    name: "OKX Wallet",
    icon: "https://play-lh.googleusercontent.com/TjM3iJJHQBi8yvElMbbP3AJieBK0jAjGKO5oQKUVg09qYPZiADjtjQEBAhMCIB09Ky0=s96-rw",
    scheme: "okx",
    androidStore: "https://play.google.com/store/apps/details?id=com.okinc.okex.gp&hl=en",
    iosStore: "https://apps.apple.com/us/app/okx-buy-bitcoin-btc-crypto/id1327268470",
  ),
  WalletInfo(
    name: "Bitget Wallet",
    icon: "https://play-lh.googleusercontent.com/XC1X070HV7w5uc23FtYLs-k_0EFrHS823aE4GL-tvWNAQEvgguOxLGWmoIJotEdxHd7A=w480-h960-rw",
    scheme: "bitget",
    androidStore: "https://play.google.com/store/search?q=bitget&c=apps&hl=en",
    iosStore: "https://apps.apple.com/us/app/bitget-trade-bitcoin-crypto/id1442778704",
  ),
  WalletInfo(
    name: "Safe (Gnosis Safe)",
    icon: "https://play-lh.googleusercontent.com/EiV2GZdsR-bzhuH8eA63Fij8sYoplq30sLXqTKA21E7dJWNwCTRTFEhHfuUhVdAkKhvrMoGz-TMdLo3qGUSVcyc=w480-h960-rw",
    scheme: "safe",
    androidStore: "https://play.google.com/store/apps/details?id=global.safe.mobileapp&hl=en",
    iosStore: "https://apps.apple.com/us/app/safe-mobile/id6748754793",
  ),
  WalletInfo(
    name: "Uniswap",
    icon: "https://cryptologos.cc/logos/uniswap-uni-logo.png?v=023",
    scheme: "uniswap",
    androidStore: "https://play.google.com/store/search?q=uniswap&c=apps",
    iosStore: "https://apps.apple.com/us/app/uniswap-crypto-nft-wallet/id6443944476",
  ),
  WalletInfo(
    name: "TokenPocket",
    icon: "https://play-lh.googleusercontent.com/hcnLVaagPA_c8TGRDtV4c3R7mkhw3pAlop1WI4zJjjokJ5DErElAqwqkYriYmRRCaaY=w480-h960-rw",
    scheme: "tokenpocket",
    androidStore: "https://play.google.com/store/search?q=tokenpocket+&c=apps",
    iosStore: "https://apps.apple.com/us/app/tokenpocket-crypto-bitcoin/id6444625622",
  ),

  WalletInfo(
    name: "World App",
    icon: "https://play-lh.googleusercontent.com/dcw7_J7eFq0lpmYU7wezaI1NcdCbJDDtoxAzw87MShxOPYwrzdexrfcFBZJUnRGmVg=w480-h960-rw",
    scheme: "worldapp",
    androidStore: "https://play.google.com/store/search?q=world+app&c=apps",
    iosStore: "https://apps.apple.com/us/app/world-app-real-human-network/id1560859847",
  ),
  
];

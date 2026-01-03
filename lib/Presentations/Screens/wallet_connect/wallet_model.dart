class WalletInfo {
  final String name;
  final String icon; // ✅ ADD
  final String scheme;
  final String androidStore;
  final String iosStore;

  WalletInfo({
    required this.name,
    required this.icon,
    required this.scheme,
    required this.androidStore,
    required this.iosStore,
  });
}

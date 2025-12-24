class WalletInfo {
  final String name;
  final String iconUrl; // API icon
  final String scheme;
  final String androidStore;
  final String iosStore;

  WalletInfo({
    required this.name,
    required this.iconUrl,
    required this.scheme,
    required this.androidStore,
    required this.iosStore,
  });

  factory WalletInfo.fromJson(Map<String, dynamic> json) {
    return WalletInfo(
      name: json['name'],
      iconUrl: json['icon_url'],
      scheme: json['scheme'],
      androidStore: json['android_store'],
      iosStore: json['ios_store'],
    );
  }
}

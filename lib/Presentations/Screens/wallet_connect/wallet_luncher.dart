import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'wallet_model.dart';


Future<void> openOrInstallWallet(
  BuildContext context,
  WalletInfo wallet,
) async {
  final Uri schemeUri = Uri.parse('${wallet.scheme}://');

  if (await canLaunchUrl(schemeUri)) {
    // Wallet installed 
    await launchUrl(
      schemeUri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    // Wallet not installed 
showModalBottomSheet(
  context: context,
  backgroundColor: Colors.transparent,
  isScrollControlled: true,
  useSafeArea: true,
  builder: (_) => WalletActionSheet(wallet: wallet),
);


  }
}





// Buttomsheet for app & browser options

class WalletActionSheet extends StatefulWidget {
  final WalletInfo wallet;

  const WalletActionSheet({super.key, required this.wallet});

  @override
  State<WalletActionSheet> createState() => _WalletActionSheetState();
}

class _WalletActionSheetState extends State<WalletActionSheet> {
  bool isAppSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 🔥 THIS CREATES SPACE ON ALL SIDES
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.6,
          ),
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28), 
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            
            Row(
  children: [
    IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    ),
    const Spacer(),
    Text(
      widget.wallet.name,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    const Spacer(),
    IconButton(
      icon: const Icon(Icons.close),
      onPressed: () => Navigator.pop(context),
    ),
  ],
),


              const SizedBox(height: 20),

              // toogle button for app and browser
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    _toggle("App", isAppSelected, () {
                      setState(() => isAppSelected = true);
                    }),
                    _toggle("Browser", !isAppSelected, () {
                      setState(() => isAppSelected = false);
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // wallet icon
              Container(
                width: 72,
                height: 72,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: widget.wallet.icon.endsWith('.svg')
                    ? SvgPicture.network(widget.wallet.icon)
                    : Image.network(widget.wallet.icon),
              ),

              const SizedBox(height: 14),

              
              Text(
                isAppSelected
                    ? "App not installed"
                    : "Open and continue in browser",
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 24),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _pillButton("Copy link", _copyLink),
                  const SizedBox(width: 16),
                  _pillButton(
                    isAppSelected ? "Install app" : "Open browser",
                    isAppSelected ? _installApp : _openInBrowser,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _toggle(String text, bool active, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: active ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 6,
                    )
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: active ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _pillButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(22),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

void showCopiedTopBar() {
  final overlay = Overlay.of(context);
  if (overlay == null) return;

  final entry = OverlayEntry(
    builder: (_) => Positioned(
      top: MediaQuery.of(context).padding.top,
      left: 0,
      right: 0,
      child: Material(
        color: const Color(0xFFD6FFF2),
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Color(0xFF0E7857),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Link copied",
                style: TextStyle(
                  color: Color(0xFF0E7857),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  overlay.insert(entry);

  Future.delayed(const Duration(seconds: 2), () {
    entry.remove();
  });
}

  void _copyLink() {
    Clipboard.setData(
      ClipboardData(text: widget.wallet.androidStore),
    );
    Navigator.pop(context);
    showCopiedTopBar();
  }

  Future<void> _installApp() async {
    await launchUrl(
      Uri.parse(widget.wallet.androidStore),
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> _openInBrowser() async {
    Navigator.pop(context);
    await launchUrl(
      Uri.parse(widget.wallet.androidStore),
      mode: LaunchMode.externalApplication,
    );
  }
}

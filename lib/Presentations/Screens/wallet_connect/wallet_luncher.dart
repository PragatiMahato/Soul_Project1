import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'wallet_model.dart';


Future<void> openOrInstallWallet(
  BuildContext context,
  WalletInfo wallet,
) async {
  final Uri schemeUri = Uri.parse('${wallet.scheme}://');

  if (await canLaunchUrl(schemeUri)) {
    // Wallet installed → open app
    await launchUrl(
      schemeUri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    // Wallet not installed → show UI
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
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
  bool hasInternet = true;

  void _copyLink() {
    Clipboard.setData(
      ClipboardData(text: widget.wallet.androidStore),
    );
    Navigator.pop(context);
  }

  Future<void> _installApp() async {
    try {
      await launchUrl(
        Uri.parse(widget.wallet.androidStore),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      setState(() => hasInternet = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.wallet.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600, 
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
      
            const SizedBox(height: 12),
      
            /// TOGGLE
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color.fromARGB(255, 221, 221, 221))
              ),
              child: Row(
                children: [
                  _toggleButton("App", isAppSelected, () {
                    setState(() => isAppSelected = true);
                  }),
                  _toggleButton("Browser", !isAppSelected, () {
                    setState(() => isAppSelected = false);
                  }),
                ],
              ),
            ),
      
            const SizedBox(height: 16),
      
            /// WALLET IMAGE
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFF4F4F4),
              ),
              child: widget.wallet.icon.endsWith('.svg')
                  ? SvgPicture.network(widget.wallet.icon)
                  : Image.network(
                      widget.wallet.icon,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.account_balance_wallet),
                    ),
            ),
      
            const SizedBox(height: 8),
      
            /// CONTEXT TEXT
            Text(
              isAppSelected
                  ? "App not installed"
                  : "Open and continue in browser",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
      
            const SizedBox(height: 20),
      
            /// ACTION BUTTONS
            Row(
              children: isAppSelected
                  ? _appButtons()
                  : _browserButtons(),
            ),
          ],
        ),
      ),
    );
  }

 List<Widget> _appButtons() => [
      Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           const SizedBox(width: 70),
           _actionButton(
        label: "Copy Link",
        onTap: _copyLink,
      ),
      const SizedBox(width: 20),
      _actionButton(
        label: hasInternet ? "Install App" : "Try Again",
        onTap: _installApp,
      ),
        ],
      )
    ];

List<Widget> _browserButtons() => [
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

       const SizedBox(width: 70),
         _actionButton(
        label: "Copy Link",
        onTap: _copyLink,
      ),
      const SizedBox(width: 20),
      _actionButton(
        label: "Open Browser",
        onTap: () async {
          Navigator.pop(context);
          await launchUrl(
            Uri.parse(widget.wallet.androidStore),
            mode: LaunchMode.platformDefault,
          );
        },
      ),
      ],
     )
    ];

  Widget _toggleButton(
    String text,
    bool active,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: active ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
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

 Widget _actionButton({
  // removed icon
  required String label,
  required VoidCallback onTap,
}) {
  return SizedBox(
    width: 120,
    height: 37,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 237, 237),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    ),
  );

  }
}

import 'package:flutter/material.dart';

class ChooseNetworkDialog extends StatefulWidget {
  const ChooseNetworkDialog({super.key});

  @override
  State<ChooseNetworkDialog> createState() => _ChooseNetworkDialogState();
}

class _ChooseNetworkDialogState extends State<ChooseNetworkDialog> {
  bool isTestnet = true;
  String selectedNetwork = "Scroll Sepolia Testnet";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          const Text(
            "Choose Network",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                _toggleButton("Mainnet", !isTestnet),
                _toggleButton("Testnet", isTestnet),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _networkTile(
            title: "Scroll Sepolia Testnet",
            selected: selectedNetwork == "Scroll Sepolia Testnet",
            onTap: () {
              setState(() => selectedNetwork = "Scroll Sepolia Testnet");
            },
          ),

          _networkTile(
            title: "Plume Testnet",
            selected: selectedNetwork == "Plume Testnet",
            onTap: () {
              setState(() => selectedNetwork = "Plume Testnet");
            },
          ),

          _disabledNetwork("Base Testnet"),
          _disabledNetwork("Neon Testnet"),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _toggleButton(String text, bool selected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isTestnet = text == "Testnet"),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: selected ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _networkTile({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      title: Text(title),
      trailing: selected
          ? const Icon(Icons.radio_button_checked)
          : const Icon(Icons.radio_button_off),
    );
  }

  Widget _disabledNetwork(String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(color: Colors.grey.shade400),
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          "Coming Soon",
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

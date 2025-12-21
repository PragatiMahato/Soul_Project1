import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:soul_project/Core/constants/appStyles.dart';

class DeleteAccountDialog extends StatefulWidget {
  final VoidCallback onConfirm;

  const DeleteAccountDialog({
    super.key,
    required this.onConfirm,
  });

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  final TextEditingController _controller = TextEditingController();
  bool isConfirmed = false;

  static const String confirmText = "Delete my Account";

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        isConfirmed = _controller.text.trim() == confirmText;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
  'assets/images/face_id.png',
  width: 80,
  height: 80,
  fit: BoxFit.contain,
),


            const SizedBox(height: 16),

            const Text(
              "Delete this account?",
              style: AppStyle.heading1,
            ),

            const SizedBox(height: 8),

            const Text(
              "Deleting this account will permanently erase your decentralized "
              "identity from your local device. This action cannot be undone.",
              style: TextStyle(fontSize: 13, color: AppColors.bodyText),
            ),

            const SizedBox(height: 16),

           RichText(
  text: const TextSpan(
    style: TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    children: [
      TextSpan(text: "To Confirm, please type ", style: TextStyle(color: AppColors.bodyText)),
      TextSpan(
        text: "“Delete my Account”",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      TextSpan(text: " below:"),
    ],
  ),
),


            const SizedBox(height: 12),

            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Delete my Account",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                /// CANCEL
                Expanded(
                  child: _ActionButton(
                    text: "Cancel",
                    backgroundColor: AppColors.greyButton,
                    textColor: AppColors.black,
                    onTap: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _ActionButton(
                    text: "Delete Account",
                   backgroundColor: isConfirmed
    ? const Color(0xFFD32F2F)           
    : const Color(0xFFD32F2F).withOpacity(0.4), 

                    textColor: Colors.white,
                    onTap: isConfirmed ? widget.onConfirm : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class _ActionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const _ActionButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: onTap == null ? 0.8 : 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(222),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

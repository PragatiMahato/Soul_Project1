// import 'package:flutter/material.dart';
// import 'package:soul_project/Presentations/Screens/Miscellaneous/widget/preference.dart';
// import 'widget/enabileNotificationWidget.dart';

// class FaceUnlockScreen extends StatelessWidget {
//   final String userId; // Add this

//   const FaceUnlockScreen({super.key, required this.userId}); 

//   @override
//   Widget build(BuildContext context) {
//     return EnableFeatureScreen(
//       title: "Setup the Face Unlock for login purpose",
//       subtitle: "This will ensure that the app will only be accessible by you.",
//       mainImage: "assets/images/facelock.png",
//       buttonText: "Enable Face Unlock",
//       onEnableTap: () async {
//         await FeaturePreference.setFaceUnlock(userId, true);
//         Navigator.pop(context);
//       },
//       onMaybeLater: () async {
//         await FeaturePreference.setFaceUnlock(userId, false);
//         Navigator.pop(context);
//       },
//     );
//   }
// }

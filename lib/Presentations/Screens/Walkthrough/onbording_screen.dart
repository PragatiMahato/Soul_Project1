import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:soul_project/Core/constants/appStyles.dart';
import 'package:soul_project/Presentations/Screens/Home/homePage.dart';
import 'package:soul_project/Presentations/widgets/customButton.dart';

class OnoardingScreen extends StatefulWidget {
  const OnoardingScreen({super.key});

  @override
  State<OnoardingScreen> createState() => _OnoardingScreenState();
}

class _OnoardingScreenState extends State<OnoardingScreen> {
  late final PageController _controller;
  int currentIndex = 0;
  bool isloading=false; 

  final List<Map<String, String>> onbordingData = [
    {
      "title": "Welcome to Soul",
      "subtitle":
          "A privacy-first way to verify your identity—powered by zero-knowledge technology.",
    },
    {
      "title": "Your data. Your control.",
      "subtitle":
          "Keep your information safe and on your local devices — exactly where it belongs.",
    },
    {
      "title": "Proof without exposure",
      "subtitle": "Verify who you are without ever revealing personal details.",
    },
  ];

  void continuewithGoogle() async{
   String webclientID = '930363161118-f4tc7a07cd93ega5q7sgvl6snjhfmcb3.apps.googleusercontent.com';
  try{
   GoogleSignIn signIn = GoogleSignIn.instance;
   await signIn.initialize(serverClientId: webclientID);
     GoogleSignInAccount account = await signIn.authenticate();
    GoogleSignInAuthentication googleAuth = account.authentication;

    final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

    setState(() {
      isloading = true;
    });

    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> HomePage()), (value)=> false);


  }catch(e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(e.toString())
    ));

  }finally{
    setState(() {
      isloading = false;
    });
  }
}

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onbordingData.length,
        (index) => AnimatedContainer(
          duration: const Duration(microseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: currentIndex == index ? 32 : 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.black
                : AppColors.greyButton,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    onbordingData[currentIndex]["title"]!,
                    style: AppStyle.smallText,
                  ),

                  SizedBox(height: 10),
                  Text(
                    onbordingData[currentIndex]["subtitle"]!,
                    style: AppStyle.heading1,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            SizedBox(
              height: 332,
              child: PageView.builder(
                controller: _controller,
                itemCount: onbordingData.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: AppColors.greyButton,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            _buildIndicator(),
            const Spacer(),

           Padding(
  padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
  child: CustomButton(
    text: "Continue with Google",
    onPressed: () {
      if (currentIndex < onbordingData.length - 1) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else {
        continuewithGoogle();
      }
    },
  ),
),

          ],
        ),
      ),
    );
  }
}

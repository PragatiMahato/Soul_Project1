import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:soul_project/Core/constants/appStyles.dart';
import 'package:soul_project/Presentations/Widgets/customButton.dart';
import 'package:soul_project/Presentations/widgets/customTextfield.dart';

class Emailscreen extends StatefulWidget {
  const Emailscreen({super.key});

  @override
  State<Emailscreen> createState() => _EmailscreenState();
}

class _EmailscreenState extends State<Emailscreen> {

  final TextEditingController emailController = TextEditingController();
  bool isFilled = false;
  bool emailIsValid = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back,size: 22,color: AppColors.black,),
              ),
               SizedBox(height: 20,),

               Text("What's your Email address?",
               style: AppStyle.heading1,),

               SizedBox(height: 8,),

               Text("We will send you 6 digit verification code via email",
               style: AppStyle.smallText,),

               SizedBox(height: 30,),

               CustomTextfield(hint: "Enter Email Address",
               controller: emailController,
               keyboardType: TextInputType.emailAddress,
             onChanged: (value) {
  setState(() {
    isFilled = value.isNotEmpty;
    emailIsValid = value.contains("@") && value.contains(".");  
  });
},


               ),

               SizedBox(height: 15,),

               Text.rich(
                TextSpan(
                  text: "By continuing, I agree to the ",
                  style: AppStyle.smallText,
                  children: [
                    TextSpan(
                      text: "User Agreement",
                      style: AppStyle.smallText.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const TextSpan(text: " and "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: AppStyle.smallText.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const TextSpan(text: " of Soul"),
               
                  ]
                )
               ),

                const Spacer(),

                 Padding( 
                  padding: const EdgeInsets.only(bottom: 30), 
                  child: CustomButton(
  text: "Continue",
  onPressed: isFilled
      ? () {
          Navigator.pushNamed(context, "/verificationScreen");
        }
      : null,
),






              ) ], ),)
         ), ); 
       } 
}
import 'package:flutter/material.dart';
import 'package:soul_project/Core/constants/appColors.dart';
import 'package:soul_project/Core/constants/appStyles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child:SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Home", style: AppStyle.heading1,),
                  Row(
                    children: [
                      Icon(Icons.qr_code, size: 24),
                      SizedBox(width: 14),
                      Icon(Icons.notifications_none, size: 24),
                      SizedBox(width: 14),
                      Icon(Icons.settings_outlined, size: 24),
                    ],
                  )
                  
                ],
              )
            ],
          ),
        ) ),
    );
  }
}
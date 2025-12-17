
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:soul_project/services/auth_wrapper.dart';


class Veriffy extends StatefulWidget {
  const Veriffy({super.key});

  @override
  State<Veriffy> createState() => _VeriffyState();
}

class _VeriffyState extends State<Veriffy> {

  @override
  void initState(){
    sendverifylink();
    super.initState();
  }
  sendverifylink()async{
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value)=>{
      Get.snackbar("Link sent", "A link has been sent to your email", margin: EdgeInsets.all(20))
    });
  }

  reload()async{
    await FirebaseAuth.instance.currentUser!.reload().then((value)=>{Get.offAll(Wrapper())});
  }
    @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Verification"),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text("open your email and clink on the link provided to verify your email"),
        ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (()=> reload()),
        child: Icon(Icons.restart_alt_outlined),
        ),
    );
  }
}
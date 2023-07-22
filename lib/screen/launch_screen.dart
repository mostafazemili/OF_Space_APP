import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  getPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var name = preferences.get('name');
    var email = preferences.get('email');
    var password = preferences.get('password');

    print('name : $name');
    print('email : $email');
    print('password : $password');

    if(email != null && password != null && name != null ){
      Navigator.pushReplacementNamed(context, '/bottom_navigaion_screen');
    }
    else {
      Navigator.pushReplacementNamed(context, '/on_boarding_screen');
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      getPreferences();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color(0xFFF3950D),
                  Color(0xFFF4E185),
                ]
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Find your dream apartment with our app!',
              style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
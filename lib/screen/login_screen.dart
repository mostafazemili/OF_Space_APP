import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  String? _emailErorr;
  String? _passwordErorr;


  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LOGIN',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wellcome back...',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'Enter email & password',
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  height: 1,
                  color: Colors.black38),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailTextController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.nunito(),
              enabled: true,
              readOnly: false,
              onTap: () => print('Tapped'),
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.send,
              // textAlign: TextAlign.start,
              decoration: InputDecoration(
                  hintText: 'Email',
                  errorText: _emailErorr,
                  errorStyle: GoogleFonts.nunito(),
                  errorMaxLines: 1 ,
                  hintStyle: GoogleFonts.nunito(),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.email),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    ),
                  )),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordTextController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.nunito(),
              obscureText: _obscurePassword,
              // obscuringCharacter: '#',
              enabled: true,
              readOnly: false,
              onTap: () => print('Tapped'),
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.send,
              onSubmitted: (String value ) => _performLogin(),
              // textAlign: TextAlign.start,
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                  setState(() => _obscurePassword = !_obscurePassword);
                },
                  icon: Icon(
                      _obscurePassword ?  Icons.visibility
                          : Icons.visibility_off ,
                  ),
                ),
                hintText: 'Password',
                errorText: _passwordErorr,
                errorStyle: GoogleFonts.nunito(),
                errorMaxLines: 1 ,

                hintStyle: GoogleFonts.nunito(),
                prefixIcon: Icon(Icons.lock),
                // suffixIcon: IconButton((){
                //   setState(() =>  _obscurePassword = !_obscurePassword);
                // },_obscurePassword ? Icons.visibility : Icons.visibility_off ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _performLogin(),
              child: Text(
                'Login',
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFBD34),
                minimumSize: Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //SOLID - (S) => Single Responsibility

  void _performLogin() {
    if (_checkDate()) {
      _login();
    }
  }

  bool _checkDate() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Enter required data!',
          style: GoogleFonts.nunito(),
        ),
        backgroundColor: Colors.redAccent,
        // padding: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        duration: Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        // action: SnackBarAction(
        //   onPressed: () => print('UNDO ACTION'),
        //   label: 'UNDO',
        //   textColor: Colors.red,
        // ),
      ),
    );
    return false;
  }

  void _login() {
    saveData();
    Navigator.pushReplacementNamed(context, '/bottom_navigaion_screen');
  }


  saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', _emailTextController.text);
    preferences.setString('password', _passwordTextController.text);

  }



}

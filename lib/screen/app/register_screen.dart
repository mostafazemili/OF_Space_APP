import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qatar_ui_app/utlis/helpers.dart';
import 'package:qatar_ui_app/widgets/app_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>  with Helpers {
  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', _nameTextController.text);
    preferences.setString('email', _emailTextController.text);
    preferences.setString('password', _passwordTextController.text);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: const Color(0xFF18978F)),
        title: Text(
          'Register',
          style: GoogleFonts.nunito(
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'register_title',
                style: GoogleFonts.nunito(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
              Text(
                'register_subtitle',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w300,
                  height: 0.8,
                  fontSize: 16,
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 20),
              AppTextField(
                textController: _nameTextController,
                hint: 'name',
                prefixIcon: Icons.person,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 10),
              AppTextField(
                textController: _emailTextController,
                hint: 'email',
                prefixIcon: Icons.email,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              AppTextField(
                textController: _passwordTextController,
                hint: 'password',
                prefixIcon: Icons.lock,
                obscureText: true,
                textInputAction: TextInputAction.done,
                onSubmitted: (String value) {
                  //TODO: Call Login Function
                },
              ),
              SizedBox(height: 20),
              DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: AlignmentDirectional.centerStart,
                        end: AlignmentDirectional.centerEnd,
                        colors: [
                          Color(0xFFF0DE36),
                          Color(0xFFFBEEAC),
                        ]),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        color: Colors.black45,
                        blurRadius: 4,
                      )
                    ]),
                child: ElevatedButton(
                  onPressed: () async => await _preformRegister(),
                  child: Text('Register',style: GoogleFonts.aBeeZee(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold
                  )),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    minimumSize: Size(double.infinity, 45),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'you have an account !!',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFFF0DE36),
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login_screen');
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.aBeeZee(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _preformRegister() async {
    if (_checkData()) {
      saveData();
      Navigator.pushReplacementNamed(context, '/bottom_navigaion_screen');
      // await _register();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data !',error: true );
    return false;
  }

}

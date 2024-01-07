import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mata_kuliah/screens/forgotPassword.dart';
import 'package:mata_kuliah/screens/homePage.dart';
import 'package:mata_kuliah/screens/register.dart';
import 'package:mata_kuliah/utils/validator.dart';
import 'package:mata_kuliah/utils/fire_auth.dart';
import 'package:mata_kuliah/utils/firebase_options.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  void _toggleObscureText() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(user: user),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff70b6f6),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Color(0x1f000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
              child: Image(
                image: AssetImage("assets/Group.png"),
                height: 200,
                width: 175,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.0),
              child: Card(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                color: Color(0xffffffff),
                shadowColor: Color(0xff000000),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Form(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                                child: Align(
                                  alignment: Alignment(-0.7, 0.0),
                                  child: Text(
                                    "Login",
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 25,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                  child: Align(
                                    alignment: Alignment(0.1, 0.0),
                                    child: Text(
                                      "Fill These Form Below!",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 10,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Align(
                                    alignment: Alignment(-0.7, 0.0),
                                    child: Text(
                                      "Email",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        controller: _emailTextController,
                                        focusNode: _focusEmail,
                                        validator: (value) =>
                                            Validator.validateEmail(
                                                email: value),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            hintText: 'Put Your Email Here',
                                            hintStyle: GoogleFonts.poppins(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            prefixIcon: Icon(Icons.people)),
                                      ),
                                      const SizedBox(height: 8.0),
                                      TextFormField(
                                        controller: _passwordTextController,
                                        focusNode: _focusPassword,
                                        obscureText: _isObscure,
                                        validator: (value) =>
                                            Validator.validatePassword(
                                                password: value),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          hintText: 'Put Your Password Here',
                                          hintStyle: GoogleFonts.poppins(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          prefixIcon: Icon(Icons.lock),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _isObscure
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                            ),
                                            onPressed: _toggleObscureText,
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 24.0),
                                      _isProcessing
                                          ? const CircularProgressIndicator()
                                          : SizedBox(
                                              height: 48.0,
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  _focusEmail.unfocus();
                                                  _focusPassword.unfocus();

                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    setState(() {
                                                      _isProcessing = true;
                                                    });

                                                    String email =
                                                        _emailTextController
                                                            .text;
                                                    String password =
                                                        _passwordTextController
                                                            .text;

                                                    print(
                                                        "Email: $email, Password: $password");

                                                    User? user = await FireAuth
                                                        .signInUsingEmailPassword(
                                                      email: email,
                                                      password: password,
                                                    );

                                                    setState(() {
                                                      _isProcessing = false;
                                                    });

                                                    if (user != null) {
                                                      Navigator.of(context)
                                                          .pushReplacement(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomePage(
                                                                  user: user),
                                                        ),
                                                      );
                                                    } else {
                                                      print("Login failed");
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                              "Invalid email or password. Please try again."),
                                                          backgroundColor:
                                                              Colors.red,
                                                        ),
                                                      );
                                                    }
                                                  }
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.white,
                                                  onPrimary: Colors.black,
                                                  textStyle:
                                                      GoogleFonts.poppins(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  side: BorderSide(
                                                    color: Colors.blue[700]!,
                                                  ),
                                                ),
                                                child: const Text('Sign In'),
                                              ),
                                            ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 30),
                                        child: Align(
                                          alignment: Alignment(0.6, 0.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ForgotPassPage()),
                                              );
                                            },
                                            child: Text(
                                              "Forgot password?",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 11,
                                                color: Color(0xff000000),
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment(-0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 50),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 0, 30, 0),
                                      child: Text(
                                        "Don't Have an Account?",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterPage()),
                                        );
                                      },
                                      child: Text(
                                        "Sign Up",
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10,
                                          color: Color(0xff000000),
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image(
                              image: AssetImage("assets/logobawah.png"),
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

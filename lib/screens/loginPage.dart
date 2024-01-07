import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mata_kuliah/screens/forgotPassword.dart';
import 'package:mata_kuliah/screens/homePage.dart';
import 'package:mata_kuliah/screens/register.dart';
import 'package:mata_kuliah/validator.dart';
import 'package:mata_kuliah/fire_auth.dart';

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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'), // Add a title if needed
        ),
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 48.0, 24.0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2017/10/31/23/33/desk-2906792_640.png"),
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 30),
                      child: Text(
                        "MataCoolYeah",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 22,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _emailTextController,
                            focusNode: _focusEmail,
                            validator: (value) =>
                                Validator.validateEmail(email: value),
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: GoogleFonts.poppins(),
                              prefixIcon: Icon(Icons.person),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextFormField(
                            controller: _passwordTextController,
                            focusNode: _focusPassword,
                            obscureText: _isObscure,
                            validator: (value) =>
                                Validator.validatePassword(password: value),
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(),
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

                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          _isProcessing = true;
                                        });

                                        User? user = await FireAuth
                                            .signInUsingEmailPassword(
                                          email: _emailTextController.text,
                                          password:
                                              _passwordTextController.text,
                                        );
                                        setState(() {
                                          _isProcessing = false;
                                        });

                                        if (user != null) {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage(user: user),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      textStyle: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      side: BorderSide(
                                        color: Colors.green[700]!,
                                      ),
                                    ),
                                    child: const Text('Sign In'),
                                  ),
                                ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen()));
                                },
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: Color(0xffffc962),
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            textColor: Color(0xff000000),
                            height: 45,
                            minWidth: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              // Return a loading indicator or placeholder while initializing Firebase
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

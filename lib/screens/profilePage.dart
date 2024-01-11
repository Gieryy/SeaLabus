import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mata_kuliah/screens/editProfilePage.dart';
import 'package:mata_kuliah/screens/landingPage.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  late Future<DocumentSnapshot> userData;
  bool _isSigningOut = false;

  @override
  void initState() {
    super.initState();
    userData = getUserData();
  }

  Future<DocumentSnapshot> getUserData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.doc(widget.user.uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'SeaLabus',
          style: GoogleFonts.ubuntu(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFFEAF2FF),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            var userData = snapshot.data?.data() as Map<String, dynamic>?;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 32),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.user.photoURL ?? ''),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name',
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditProfilePage(user: widget.user),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '${widget.user.displayName}',
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'NRP',
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '${widget.user.displayName}',
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Email',
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '${widget.user.email}',
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  if (userData != null && userData['Email'] != null)
                    Text(
                      'Email: ${userData['Email']}',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                ],
              ),
            );
          }
          const SizedBox(height: 78);
          const Divider(
            color: Colors.black,
            indent: 24,
            endIndent: 24,
          );
          const SizedBox(height: 43);
          _isSigningOut
              ? const CircularProgressIndicator(color: Colors.black)
              : Container(
                  padding: const EdgeInsets.only(left: 160, right: 160),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFFEA4335),
                          ),
                          surfaceTintColor: Colors.white,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          fixedSize: const Size(200, 40)),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              surfaceTintColor: Colors.white,
                              title: const Text("WARNING"),
                              content:
                                  const Text("Are you sure want to log out?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    //Close Dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.inter(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                        width: 2,
                                        color: Colors.red,
                                      ),
                                      backgroundColor: Colors.white,
                                      surfaceTintColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  onPressed: () async {
                                    setState(() {
                                      _isSigningOut = true;
                                    });
                                    await FirebaseAuth.instance.signOut();
                                    setState(() {
                                      _isSigningOut = false;
                                    });
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LandingPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Log Out",
                                    style: GoogleFonts.inter(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'Log Out',
                        style: GoogleFonts.inter(
                            color: const Color(0xFFEA4335),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )));
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfilePage extends StatefulWidget {
  final User user;

  EditProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _nrpController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.displayName);
    _nrpController = TextEditingController();
    loadPhoneNumber();
  }

  void loadPhoneNumber() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot snapshot = await users.doc(widget.user.uid).get();

    if (snapshot.exists) {
      var userData = snapshot.data() as Map<String, dynamic>;
      setState(() {
        _nrpController.text = userData['NRP'] ?? '';
      });
    }
  }

  void saveChanges() async {
    await widget.user.updateDisplayName(_nameController.text);

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(widget.user.uid).set(
      {
        'NRP': _nrpController.text,
      },
      SetOptions(merge: true),
    );

    Navigator.pop(context); // Kembali ke layar sebelumnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: GoogleFonts.poppins()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _nrpController,
              decoration: InputDecoration(labelText: 'NRP'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: saveChanges,
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditMataKuliah extends StatefulWidget {
  const EditMataKuliah({super.key});

  @override
  State<EditMataKuliah> createState() => EditMataKuliahState();
}

class EditMataKuliahState extends State<EditMataKuliah> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController kodeMataKuliahController =
      TextEditingController();
  final TextEditingController namaMataKuliahController =
      TextEditingController();
  final TextEditingController sksController = TextEditingController();
  final TextEditingController jamMasuk = TextEditingController();
  final TextEditingController jamKeluar = TextEditingController();
  final TextEditingController gedung = TextEditingController();
  final TextEditingController ruangan = TextEditingController();
  final TextEditingController dosenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference matakuliah = firestore.collection('matakuliah');

    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(args);

    // kodeMataKuliahController.text = args['kodeMataKuliah'] ?? '';
    // namaMataKuliahController.text = args['namaMataKuliah'] ?? '';
    // sksController.text = args['sks'] ?? '';
    // jamMasuk.text = args['jamMasuk'] ?? '';
    // jamKeluar.text = args['jamKeluar'] ?? '';
    // gedung.text = args['gedung'] ?? '';
    // ruangan.text = args['ruangan'] ?? '';
    // dosenController.text = args['dosen'] ?? '';

    try {
      kodeMataKuliahController.text = args['kodeMataKuliah'] ?? '';
    } catch (e) {
      print('Error in kodeMataKuliah: $e');
      // Handle the error or provide a default value
    }

    try {
      namaMataKuliahController.text = args['namaMataKuliah'] ?? '';
    } catch (e) {
      print('Error in namaMataKuliah: $e');
      // Handle the error or provide a default value
    }

    try {
      sksController.text = args['sks']?.toString() ?? '';
    } catch (e) {
      print('Error in sks: $e');
      // Handle the error or provide a default value
    }

    try {
      jamMasuk.text = args['jamMasuk'] ?? '';
    } catch (e) {
      print('Error in jamMasuk: $e');
      // Handle the error or provide a default value
    }

    try {
      jamKeluar.text = args['jamKeluar'] ?? '';
    } catch (e) {
      print('Error in jamKeluar: $e');
      // Handle the error or provide a default value
    }

    try {
      gedung.text = args['gedung'] ?? '';
    } catch (e) {
      print('Error in gedung: $e');
      // Handle the error or provide a default value
    }

    try {
      ruangan.text = args['ruangan'] ?? '';
    } catch (e) {
      print('Error in ruangan: $e');
      // Handle the error or provide a default value
    }

    try {
      dosenController.text = args['dosen'] ?? '';
    } catch (e) {
      print('Error in dosen: $e');
      // Handle the error or provide a default value
    }

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Kode MataKuliah',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              SizedBox(height: 18),
              TextField(
                controller: kodeMataKuliahController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 108, 150, 217),
                      )),
                  hintText: 'Masukkan Kode Matakuliah',
                ),
              ),
              SizedBox(height: 12),
              Text('Nama MataKuliah',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              TextField(
                controller: namaMataKuliahController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 108, 150, 217),
                      )),
                  hintText: 'Masukkan Nama Matakuliah',
                ),
              ),
              SizedBox(height: 12),
              Text('SKS',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              TextField(
                controller: sksController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 108, 150, 217),
                      )),
                  hintText: 'Masukkan jumlah SKS',
                ),
              ),
              SizedBox(height: 12),
              Text('Jam Mulai Kelas',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              TextField(
                controller: jamMasuk,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 108, 150, 217),
                      )),
                  hintText: 'Jam Masuk Kelas',
                ),
              ),
              SizedBox(height: 12),
              Text('Jam Selesai Kelas',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              TextField(
                controller: jamKeluar,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 108, 150, 217),
                      )),
                  hintText: 'Jam Selesai Matakuliah',
                ),
              ),
              SizedBox(height: 12),
              Text('Nomor Gedung',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              TextField(
                controller: gedung,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 108, 150, 217),
                      )),
                  hintText: 'Masukkan Nomor Gedung',
                ),
              ),
              SizedBox(height: 12),
              Text('Nomor Ruangan',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              TextField(
                controller: ruangan,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 108, 150, 217),
                      )),
                  hintText: 'Masukkan Nomor Ruangan',
                ),
              ),
              SizedBox(height: 12),
              Text('Dosen Pengajar',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              TextField(
                controller: dosenController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 108, 150, 217),
                      )),
                  hintText: 'Masukkan Nama Dosen Pengajar',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('SUMBIT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

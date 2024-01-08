import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMataKuliah extends StatefulWidget {
  @override
  _AddMataKuliahState createState() => _AddMataKuliahState();
}

class _AddMataKuliahState extends State<AddMataKuliah> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController kodeMataKuliahController =
      TextEditingController();
  final TextEditingController namaMataKuliahController =
      TextEditingController();
  final TextEditingController sks = TextEditingController();
  final TextEditingController jamMasuk = TextEditingController();
  final TextEditingController jamKeluar = TextEditingController();
  final TextEditingController gedung = TextEditingController();
  final TextEditingController ruangan = TextEditingController();
  final TextEditingController dosen = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference matakuliah = firestore.collection('matakuliah');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('SeaLabus',
            style:
                GoogleFonts.ubuntu(fontSize: 14, fontWeight: FontWeight.w600)),
        backgroundColor: const Color(0xFFEAF2FF),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Tambah Data MataKuliah Baru',
                style: GoogleFonts.ubuntu(
                    fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    controller: sks,
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
                    controller: dosen,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 108, 150, 217),
                          )),
                      hintText: 'Masukkan Nama Dosen Pengajar',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              ElevatedButton(
                child: Text(
                  'Submit',
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.normal),
                ),
                onPressed: () {
                  String sksValue = sks.text.trim();

                  if (sksValue.isNotEmpty) {
                    try {
                      int sksInt = int.parse(sksValue);

                      matakuliah.add({
                        'kodeMataKuliah': kodeMataKuliahController.text,
                        'namaMataKuliah': namaMataKuliahController.text,
                        'sks': sksInt,
                        'jamMasuk': jamMasuk.text,
                        'jamKeluar': jamKeluar.text,
                        'gedung': gedung.text,
                        'ruangan': ruangan.text,
                        'dosen': dosen.text,
                      });
                      kodeMataKuliahController.text = '';
                      namaMataKuliahController.text = '';
                      sks.text = '';
                      jamMasuk.text = '';
                      jamKeluar.text = '';
                      gedung.text = '';
                      ruangan.text = '';
                      dosen.text = '';

                      Navigator.pop(context);
                    } catch (e) {
                      print('Error parsing SKS: $e');
                    }
                  } else {
                    print('SKS field is empty');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

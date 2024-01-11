import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mata_kuliah/screens/fileMataKuliah.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mata_kuliah/screens/homePage.dart';
import 'package:mata_kuliah/screens/schedule.dart';

class Tabelmatakuliah extends StatelessWidget {
  final MatakuliahService _matakuliahService = MatakuliahService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SeaLabus',
          style: GoogleFonts.ubuntu(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFFEAF2FF),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (context) => ScheduleScreen(),
        //       ),
        //     );
        //   },
        // ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.file_upload),
            onPressed: () {
              _matakuliahService.importmatakuliahFromCSV(context);
            },
          ),
        ],
      ),
      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
              elevation: 0,
              color: const Color(0xFFEAF2FF),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Jadwal Mata Kuliah',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 24,
                          color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('rekap_nilai')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        List<DocumentSnapshot> documents = snapshot.data!.docs;
                        List<DataRow> rows = [];

                        for (var document in documents) {
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;

                          DataRow row = DataRow(cells: [
                            DataCell(Text(data['dosen'] ?? '')),
                            DataCell(Text(data['gedung']?.toString() ?? '')),
                            DataCell(Text(data['jamKeluar']?.toString() ?? '')),
                            DataCell(Text(data['jamMasuk']?.toString() ?? '')),
                            DataCell(Text(data['kodeMataKuliah'] ?? '')),
                            DataCell(Text(data['namaMataKuliah'] ?? '')),
                            DataCell(Text(data['ruangan']?.toString() ?? '')),
                            DataCell(Text(data['sks']?.toString() ?? '')),
                            DataCell(Text(data['hari'] ?? '')),
                            DataCell(
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Konfirmasi Hapus'),
                                        content: Text(
                                            'Apakah Anda yakin ingin menghapus data ini?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Batal'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              String documentId =
                                                  document.id ?? '';
                                              _matakuliahService
                                                  .deletematakuliah(
                                                      document.id);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Hapus'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ]);

                          rows.add(row);
                        }
                        return DataTable(columns: [
                          DataColumn(label: Text('Dosen')),
                          DataColumn(label: Text('Gedung')),
                          DataColumn(label: Text('Jam Keluar')),
                          DataColumn(label: Text('Jam Masuk')),
                          DataColumn(label: Text('Kode Mata Kuliah')),
                          DataColumn(label: Text('Nama Mata Kuliah')),
                          DataColumn(label: Text('Ruangan')),
                          DataColumn(label: Text('SKS')),
                          DataColumn(label: Text('Hari')),
                          DataColumn(label: Text('Aksi'))
                        ], rows: rows);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

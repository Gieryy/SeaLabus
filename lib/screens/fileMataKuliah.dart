import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class matakuliah {
  String dosen;
  var gedung;
  var jamKeluar;
  var jamMasuk;
  String kodeMataKuliah;
  String namaMataKuliah;
  var ruangan;
  var sks;
  String hari;

  matakuliah({
    required this.dosen,
    required this.gedung,
    required this.jamKeluar,
    required this.jamMasuk,
    required this.kodeMataKuliah,
    required this.namaMataKuliah,
    required this.ruangan,
    required this.sks,
    required this.hari,
  });

  Map<String, dynamic> toMap() {
    return {
      'dosen': dosen,
      'gedung': gedung,
      'jamKeluar': jamKeluar,
      'jamMasuk': jamMasuk,
      'kodeMataKuliah': kodeMataKuliah,
      'namaMataKuliah': namaMataKuliah,
      'ruangan': ruangan,
      'sks': sks,
      'hari': hari,
    };
  }
}

class MatakuliahService {
  final CollectionReference _matakuliahCollection =
      FirebaseFirestore.instance.collection('rekap_nilai');

  Future<void> importmatakuliahFromCSV(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'xls', 'xlsx'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      String csvString = utf8.decode(file.bytes!);
      List<List<dynamic>> csvTable = CsvToListConverter().convert(csvString);

      for (List<dynamic> row in csvTable) {
        matakuliah file = matakuliah(
            dosen: row[0] as String,
            gedung: row[1],
            jamKeluar: row[2],
            jamMasuk: row[3],
            kodeMataKuliah: row[4] as String,
            namaMataKuliah: row[5] as String,
            ruangan: row[6],
            sks: row[7],
            hari: row[8]);

        await _matakuliahCollection.add(file.toMap());
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('file berhasil diimport.'),
        ),
      );
    }
  }

  Future<void> deletematakuliah(String documentId) async {
    await _matakuliahCollection.doc(documentId).delete();
  }
}

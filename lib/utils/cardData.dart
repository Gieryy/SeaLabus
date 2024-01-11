// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:mata_kuliah/utils/firebase_options.dart';

// class CardData extends StatelessWidget {
//   final String kodeMataKuliah;
//   final String namaMataKuliah;
//   final String sks;
//   final String jamMasuk;
//   final String jamKeluar;
//   final String gedung;
//   final String ruangan;
//   final String dosen;

//   CardData(this.kodeMataKuliah, this.namaMataKuliah, this.sks,
//   this.jamMasuk, this.jamKeluar, this.gedung, this.ruangan, this.dosen)

//   @override
//   Widget build(BuildContext context){
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference matakuliah = firestore.collection('matakuliah');
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(9),
//         border: Border.all(color: Colors.blue),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 child: Text(
//                   "$kodeMataKuliah",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Text(
//                 "$namaMataKuliah",
//                 style: TextStyle(fontSize: 14),
//               ),
//               Text(
//                 "Email : $email",
//                 style: TextStyle(fontSize: 14),
//               ),
//               Text(
//                 "No Telp: $no_hp",
//                 style: TextStyle(fontSize: 14),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 height: 40,
//                 width: 60,
//                 child: ElevatedButton(
//                     child: const Center(
//                         child: Icon(
//                       Icons.edit,
//                       color: Colors.white,
//                     )),
//                     onPressed: () {
//                       Navigator.pushNamed(context, 'update_mhs', arguments: {
//                         'nama': nama,
//                         'nrp': nrp,
//                         'email': email,
//                         'no_hp': no_hp,
//                         'documentId': documentId,
//                       });
//                     }),
//               ),
//               SizedBox(
//                 height: 40,
//                 width: 60,
//                 child: ElevatedButton(
//                     child: const Center(
//                         child: Icon(
//                       Icons.delete,
//                       color: Colors.white,
//                     )),
//                     onPressed: () {
//                       showDialog(
//                           context: context,
//                           barrierDismissible: false,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: const Text("Warning"),
//                               content: const Text("Remove this data?"),
//                               actions: <Widget>[
//                                 TextButton(
//                                   child: const Text('CANCEL'),
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                 ),
//                                 TextButton(
//                                   child: const Text('Remove'),
//                                   onPressed: () {
//                                     mahasiswa.doc(documentId).delete();
//                                     Navigator.of(context).pop();
//                                   },
//                                 )
//                               ],
//                             );
//                           });
//                     }),
//               )
//             ],
//           )
//         ],
//       ),
//     )
//   }
// }

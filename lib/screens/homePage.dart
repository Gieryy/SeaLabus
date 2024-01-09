import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mata_kuliah/main.dart';
import 'package:mata_kuliah/screens/addMataKuliah.dart';
import 'package:mata_kuliah/utils/firebase_options.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late User _currentUser;
  get user => _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
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
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.zero,
            border: Border.all(color: Color(0x4d9e9e9e), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 39, 20, 35),
                child: TextField(
                  controller: TextEditingController(),
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    hintText: "what courses are you looking for",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 10,
                      color: Color(0xff000000),
                    ),
                    filled: true,
                    fillColor: Color(0xffffffff),
                    isDense: false,
                    contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                    prefixIcon:
                        Icon(Icons.search, color: Color(0xff212435), size: 24),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Align(
                  alignment: Alignment(-0.8, 0.0),
                  child: Text(
                    'Courses',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 24,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 5, 0, 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddMataKuliah()),
                        );
                      },
                      child: Text('Buat Data Matakuliah Baru'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Container(
                  height: MediaQuery.of(context).size.height - 200,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('matakuliah')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Data is still loading
                        return CircularProgressIndicator();
                      }

                      if (snapshot.hasError) {
                        // Print the error for debugging
                        print('Error: ${snapshot.error}');
                        return Text('Error loading data');
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        // No data available
                        return Text('No data available');
                      }

                      List<DocumentSnapshot> documents = snapshot.data!.docs;

                      return ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          try {
                            if (index < 0 || index >= documents.length) {
                              throw RangeError('Index out of range: $index');
                            }

                            Map<String, dynamic>? courseData = documents[index]
                                .data() as Map<String, dynamic>?;

                            if (courseData == null) {
                              // Handle null data
                              return SizedBox();
                            }

                            return coursesCard(
                              courseData['kodeMataKuliah'] ?? '',
                              courseData['namaMataKuliah'] ?? '',
                              courseData['sks'] ?? 0,
                              courseData['jamMasuk'] ?? '',
                              courseData['jamKeluar'] ?? '',
                              courseData['gedung'] ?? '',
                              courseData['ruangan'] ?? '',
                              courseData['dosen'] ?? '',
                            );
                          } catch (e) {
                            // Print error details for debugging
                            print('Error in StreamBuilder: $e');
                            return SizedBox();
                          }
                        },
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color.fromARGB(255, 2, 86, 230),
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget coursesCard(String kodeMataKuliah, String namaMataKuliah, int sks,
      String jamMasuk, jamKeluar, String gedung, String ruangan, String dosen) {
    return SizedBox(
      height: 230,
      width: 205,
      child: Card(
        elevation: 0,
        color: const Color(0xFFEAF2FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$kodeMataKuliah $namaMataKuliah",
                style: GoogleFonts.ubuntu(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                'SKS : $sks',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Jadwal : $jamMasuk - $jamKeluar",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Ruangan : Gedung $gedung - $ruangan",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Dosen : $dosen",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

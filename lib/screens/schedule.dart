// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_date_timeline/easy_date_timeline.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mata_kuliah/screens/addMataKuliah.dart';
// import 'package:mata_kuliah/screens/homePage.dart';
// import 'package:mata_kuliah/screens/profilePage.dart';

// class ScheduleScreen extends StatefulWidget {
//   final User user;
//   // const ScheduleScreen({Key? key, required this.user}) : super(key: key);

//   @override
//   ScheduleScreenState createState() => ScheduleScreenState();
// }

// class ScheduleScreenState extends State<ScheduleScreen> {
//   final EasyInfiniteDateTimelineController _controller =
//       EasyInfiniteDateTimelineController();
//   int _selectedIndex = 0;
//   int _currentIndex = 0;
//   late User _currentUser;

//   DateTime _focusDate = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           elevation: 0,
//           title: Text(
//             'Sealabus',
//             style:
//                 GoogleFonts.ubuntu(fontSize: 14, fontWeight: FontWeight.w600),
//           ),
//           backgroundColor: const Color(0xFFEAF2FF),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.add),
//               onPressed: () {
//                 Navigator.pushNamed(context, 'file_matakuliah');
//               },
//             ),
//           ],
//         ),
//         backgroundColor: Color(0xffffffff),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               EasyInfiniteDateTimeLine(
//                 controller: _controller,
//                 firstDate: DateTime(2023),
//                 focusDate: _focusDate,
//                 lastDate: DateTime(2023, 12, 31),
//                 onDateChange: (selectedDate) {
//                   setState(() {
//                     _focusDate = selectedDate;
//                   });
//                 },
//               ),
//               SizedBox(height: 90),
//               Container(
//                 height: MediaQuery.of(context).size.height - 200,
//                 child: ListView.builder(
//                   physics: BouncingScrollPhysics(),
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   itemCount: 9,
//                   itemBuilder: (BuildContext, int index) {
//                     return coursesCard('ISB - 311 Sistem Informasi Seluler',
//                         '3jam', 'Ruangan 42021');
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           selectedItemColor: const Color.fromARGB(255, 2, 86, 230),
//           unselectedItemColor: Colors.black,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.calendar_month),
//               label: 'Schedule',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Account',
//             ),
//           ],
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//               if (_currentIndex == 0) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomePage(user: user)),
//                 );
//               }
//               if (_currentIndex == 1) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ScheduleScreen()),
//                 );
//               }
//               if (_currentIndex == 2) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => ProfilePage(user: user)),
//                 );
//               }
//             });
//           },
//         ));
//   }

//   Widget coursesCard(String title, String time, String place) {
//     return SizedBox(
//       height: 125,
//       width: 205,
//       child: Card(
//         elevation: 0,
//         color: const Color(0xFFEAF2FF),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: GoogleFonts.ubuntu(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 time,
//                 style: GoogleFonts.poppins(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 place,
//                 style: GoogleFonts.poppins(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

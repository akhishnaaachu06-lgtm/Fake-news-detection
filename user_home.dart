//
// import 'package:eample/password.dart';
// import 'package:eample/view_all_news.dart';
// import 'package:eample/view_current_location.dart';
// import 'package:eample/view_news%20_by_area.dart';
// import 'package:flutter/material.dart';
//
// import 'complaint.dart';
// import 'feedback.dart';
//
// void main()
// {
//   runApp(home());
// }
// class home extends StatelessWidget {
//   const home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home:homesub(),);
//   }
// }
// class homesub extends StatefulWidget {
//   const homesub({Key? key}) : super(key: key);
//
//   @override
//   State<homesub> createState() => _homesubState();
// }
//
// class _homesubState extends State<homesub> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.black,
//        title:Text('USER HOME',style: TextStyle(color: Colors.white),) ,
//      ),
//      drawer: Drawer(child: ListView(children: [
//        DrawerHeader(
//            decoration: BoxDecoration(color: Colors.blue),
//
//            child:Text("Menu",style: TextStyle(color: Colors.white),)),
//        ListTile(title: Text('Send complaint',style: TextStyle(color: Colors.black),),
//        onTap: (){
//          Navigator.push(context, MaterialPageRoute(builder: (context)=>complaintsub()));
//
//        },),
//        ListTile(title: Text('Feedback',style: TextStyle(color: Colors.black),),
//        onTap: (){
//          Navigator.push(context, MaterialPageRoute(builder: (context)=>feedbacksub()));
//        },),
//        ListTile(title: Text('Change Password',style: TextStyle(color: Colors.black),),
//        onTap: (){
//          Navigator.push(context, MaterialPageRoute(builder:(context)=>change_password()));
//        },),
//        ListTile(title: Text('View All News',style: TextStyle(color: Colors.black),),
//        onTap: (){
//          Navigator.push(context, MaterialPageRoute(builder: (context)=>view_all_newssub()));
//        },),
//        ListTile(title: Text('View Current Location',style: TextStyle(color: Colors.black),),
//        onTap: (){
//          Navigator.push(context, MaterialPageRoute(builder: (context)=>view_current_locationsub()));
//        },),
//        ListTile(title: Text('View News by Area',style: TextStyle(color: Colors.black),),
//        onTap: (){
//          Navigator.push(context, MaterialPageRoute(builder: (context)=>view_news_by_areasub()));
//        },)
//      ],),),
//       );
//   }
// }




// import 'package:eample/password.dart';
// import 'package:eample/view_all_news.dart';
// import 'package:eample/view_current_location.dart';
// import 'package:eample/view_news%20_by_area.dart';
// import 'package:flutter/material.dart';
//
// import 'complaint.dart';
// import 'feedback.dart';
// import 'login.dart';
// import 'fake_news.dart';
//
// void main() {
//   runApp(home());
// }
//
// class home extends StatelessWidget {
//   const home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: homesub());
//   }
// }
//
// class homesub extends StatefulWidget {
//   const homesub({Key? key}) : super(key: key);
//
//   @override
//   State<homesub> createState() => _homesubState();
// }
//
// class _homesubState extends State<homesub> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(
//           'USER HOME',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         elevation: 5,
//       ),
//       drawer: Drawer(
//         child: Container(
//           color: Colors.white,
//           child: ListView(
//             children: [
//               Container(
//                 height: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [Colors.blue, Colors.blue[800]!],
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Menu",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               _buildMenuItem(
//                 icon: Icons.report_problem,
//                 text: 'Send complaint',
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => complaintsub()));
//                 },
//               ),
//               _buildMenuItem(
//                 icon: Icons.feedback,
//                 text: 'Feedback',
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => feedbacksub()));
//                 },
//               ),
//               _buildMenuItem(
//                 icon: Icons.lock_reset,
//                 text: 'Change Password',
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => change_password()));
//                 },
//               ),
//               _buildMenuItem(
//                 icon: Icons.article,
//                 text: 'View All News',
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => view_all_newssub()));
//                 },
//               ),
//               _buildMenuItem(
//                 icon: Icons.article,
//                 text: 'Check News',
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => fake_news_sub()));
//                 },
//               ),
//               _buildMenuItem(
//                 icon: Icons.location_on,
//                 text: 'View Current Location',
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => view_current_locationsub()));
//                 },
//               ),
//               _buildMenuItem(
//                 icon: Icons.map,
//                 text: 'View News by Area',
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => view_news_by_areasub()));
//                 },
//               ),
//
//               _buildMenuItem(
//                 icon: Icons.logout,
//                 text: 'Logout',
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => logsub()));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.grey[100]!, Colors.grey[300]!],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.home,
//                 size: 80,
//                 color: Colors.blue,
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Welcome to USER HOME',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 40),
//                 child: Text(
//                   'Select an option from the menu to get started',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[700],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMenuItem(
//       {required IconData icon,
//         required String text,
//         required VoidCallback onTap}) {
//     return ListTile(
//     leading: Container(
//     width: 40,
//     height: 40,
//     decoration: BoxDecoration(
//     color: Colors.blue[50],
//     borderRadius: BorderRadius.circular(8),
//     ),
//     child: Icon(
//     icon,
//     color: Colors.blue,
//     size: 24,
//     ),
//     ),
//     title: Text(
//     text,
//     style: TextStyle(
//     color: Colors.black,
//     fontSize: 16,
//     fontWeight: FontWeight.w500,
//     ),
//     ),
//     trailing: Icon(
//     Icons.arrow_forward_ios,
//     color: Colors.grey,
//     size: 16,
//     ),
//     onTap: onTap,
//     contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//     );
//     }
// }





// import 'package:eample/password.dart';
// import 'package:eample/view_all_news.dart';
// import 'package:eample/view_current_location.dart';
// import 'package:eample/view_news%20_by_area.dart';
// import 'package:flutter/material.dart';
// import 'complaint.dart';
// import 'feedback.dart';
//
// void main() {
//   runApp(home());
// }
//
// class home extends StatelessWidget {
//   const home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: homesub(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class homesub extends StatefulWidget {
//   const homesub({Key? key}) : super(key: key);
//
//   @override
//   State<homesub> createState() => _homesubState();
// }
//
// class _homesubState extends State<homesub> with SingleTickerProviderStateMixin {
//   final TextEditingController _searchController = TextEditingController();
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1500),
//     );
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeIn,
//       ),
//     );
//     _animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   void _searchNews(String query) {
//     if (query.isNotEmpty) {
//       // Show search results or navigate to search page
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           backgroundColor: Color(0xFF1A1A2E),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//             side: BorderSide(color: Colors.amber.shade300, width: 1.5),
//           ),
//           title: Row(
//             children: [
//               Icon(Icons.search_rounded, color: Colors.amber.shade300),
//               SizedBox(width: 10),
//               Text(
//                 "Searching:",
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ],
//           ),
//           content: Text(
//             '"$query"',
//             style: TextStyle(color: Colors.grey.shade300, fontSize: 16),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.amber.shade300,
//               ),
//               child: Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 // Navigate to search results or analyze news
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text("Analyzing news..."),
//                     backgroundColor: Colors.amber.shade800,
//                     behavior: SnackBarBehavior.floating,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber.shade600,
//                 foregroundColor: Colors.black,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Text("Verify"),
//             ),
//           ],
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final bool isMobile = screenSize.width <= 600;
//
//     return Scaffold(
//       backgroundColor: Color(0xFF0F3460),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xFF1A1A2E),
//                 Color(0xFF16213E),
//                 Color(0xFF0F3460),
//               ],
//             ),
//           ),
//         ),
//         title: Row(
//           children: [
//             Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 gradient: RadialGradient(
//                   colors: [
//                     Colors.amber.shade300,
//                     Colors.orange.shade700,
//                   ],
//                 ),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 Icons.verified_rounded,
//                 color: Colors.white,
//                 size: isMobile ? 20 : 24,
//               ),
//             ),
//             SizedBox(width: 10),
//             ShaderMask(
//               shaderCallback: (bounds) => LinearGradient(
//                 colors: [Colors.amber.shade300, Colors.orange.shade500],
//               ).createShader(bounds),
//               child: Text(
//                 "NO CAP NEWS",
//                 style: TextStyle(
//                   fontSize: isMobile ? 18 : 22,
//                   fontWeight: FontWeight.w900,
//                   letterSpacing: 1.5,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           // Notification/Alert Icon
//           Stack(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.notifications_outlined, color: Colors.white),
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text("No new notifications"),
//                       backgroundColor: Colors.amber.shade800,
//                       behavior: SnackBarBehavior.floating,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   padding: EdgeInsets.all(4),
//                   decoration: BoxDecoration(
//                     color: Colors.red.shade700,
//                     shape: BoxShape.circle,
//                   ),
//                   constraints: BoxConstraints(
//                     minWidth: 8,
//                     minHeight: 8,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       drawer: Theme(
//         data: Theme.of(context).copyWith(
//           canvasColor: Color(0xFF1A1A2E),
//         ),
//         child: Drawer(
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Color(0xFF1A1A2E),
//                   Color(0xFF0F3460),
//                 ],
//               ),
//             ),
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 DrawerHeader(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Colors.amber.shade600,
//                         Colors.orange.shade700,
//                       ],
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.2),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Icon(
//                           Icons.person_rounded,
//                           color: Colors.white,
//                           size: 35,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         "No Cap News",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "Verified User",
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.8),
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.report_problem_rounded,
//                   title: 'Send complaint',
//                   color: Colors.red.shade300,
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => complaintsub()),
//                     );
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.star_rounded,
//                   title: 'Feedback',
//                   color: Colors.amber.shade300,
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => feedbacksub()),
//                     );
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.lock_reset_rounded,
//                   title: 'Change Password',
//                   color: Colors.blue.shade300,
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => change_password()),
//                     );
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.newspaper_rounded,
//                   title: 'View All News',
//                   color: Colors.green.shade300,
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => view_all_newssub()),
//                     );
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.location_on_rounded,
//                   title: 'View Current Location',
//                   color: Colors.purple.shade300,
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => view_current_locationsub()),
//                     );
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.map_rounded,
//                   title: 'View News by Area',
//                   color: Colors.orange.shade300,
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => view_news_by_areasub()),
//                     );
//                   },
//                 ),
//                 Divider(color: Colors.white.withOpacity(0.1)),
//                 _buildDrawerItem(
//                   icon: Icons.logout_rounded,
//                   title: 'Sign Out',
//                   color: Colors.grey.shade400,
//                   onTap: () {
//                     Navigator.pop(context);
//                     _showSignOutDialog(context);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: FadeTransition(
//         opacity: _fadeAnimation,
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF0F3460),
//                 Color(0xFF1A1A2E),
//               ],
//             ),
//           ),
//           child: SafeArea(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.all(isMobile ? 16 : 24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Welcome Message
//                     Container(
//                       margin: EdgeInsets.only(bottom: 16),
//                       child: Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Welcome back,",
//                                 style: TextStyle(
//                                   color: Colors.grey.shade400,
//                                   fontSize: isMobile ? 14 : 16,
//                                 ),
//                               ),
//                               Text(
//                                 "Truth Seeker!",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: isMobile ? 22 : 26,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Spacer(),
//                           Container(
//                             padding: EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.verified_rounded,
//                                   color: Colors.amber.shade300,
//                                   size: 16,
//                                 ),
//                                 SizedBox(width: 4),
//                                 Text(
//                                   "Trust Score: 95%",
//                                   style: TextStyle(
//                                     color: Colors.amber.shade300,
//                                     fontSize: isMobile ? 12 : 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     // Search Bar - Main Feature
//                     Container(
//                       margin: EdgeInsets.only(bottom: 24),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Check News",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: isMobile ? 18 : 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(
//                                 color: Colors.amber.withOpacity(0.3),
//                                 width: 1.5,
//                               ),
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(
//                                   child: TextField(
//                                     controller: _searchController,
//                                     style: TextStyle(color: Colors.white),
//                                     decoration: InputDecoration(
//                                       hintText: "Paste news headline or URL...",
//                                       hintStyle: TextStyle(
//                                         color: Colors.grey.shade500,
//                                         fontSize: isMobile ? 13 : 14,
//                                       ),
//                                       prefixIcon: Icon(
//                                         Icons.search_rounded,
//                                         color: Colors.amber.shade300,
//                                       ),
//                                       border: InputBorder.none,
//                                       contentPadding: EdgeInsets.symmetric(
//                                         horizontal: 16,
//                                         vertical: isMobile ? 14 : 16,
//                                       ),
//                                     ),
//                                     onSubmitted: _searchNews,
//                                   ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(right: 8),
//                                   child: ElevatedButton(
//                                     onPressed: () => _searchNews(_searchController.text),
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.amber.shade600,
//                                       foregroundColor: Colors.black,
//                                       elevation: 0,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(15),
//                                       ),
//                                       minimumSize: Size(isMobile ? 50 : 60, isMobile ? 45 : 50),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Text(
//                                           "Check",
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: isMobile ? 12 : 14,
//                                           ),
//                                         ),
//                                         SizedBox(width: 4),
//                                         Icon(
//                                           Icons.verified_rounded,
//                                           size: isMobile ? 16 : 18,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     // Quick Stats
//                     Container(
//                       margin: EdgeInsets.only(bottom: 24),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: _buildStatCard(
//                               icon: Icons.newspaper_rounded,
//                               value: "24",
//                               label: "News Today",
//                               color: Colors.blue.shade300,
//                             ),
//                           ),
//                           SizedBox(width: 12),
//                           Expanded(
//                             child: _buildStatCard(
//                               icon: Icons.verified_rounded,
//                               value: "18",
//                               label: "Verified",
//                               color: Colors.green.shade300,
//                             ),
//                           ),
//                           SizedBox(width: 12),
//                           Expanded(
//                             child: _buildStatCard(
//                               icon: Icons.warning_amber_rounded,
//                               value: "6",
//                               label: "Fake News",
//                               color: Colors.red.shade300,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     // Quick Actions
//                     Text(
//                       "Quick Actions",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: isMobile ? 18 : 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 16),
//
//                     // Action Buttons Grid
//                     GridView.count(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 12,
//                       crossAxisSpacing: 12,
//                       childAspectRatio: isMobile ? 1.5 : 1.8,
//                       children: [
//                         _buildActionCard(
//                           icon: Icons.newspaper_rounded,
//                           label: "All News",
//                           color: Colors.blue.shade600,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => view_all_newssub()),
//                             );
//                           },
//                         ),
//                         _buildActionCard(
//                           icon: Icons.location_on_rounded,
//                           label: "Local News",
//                           color: Colors.purple.shade600,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => view_news_by_areasub()),
//                             );
//                           },
//                         ),
//                         _buildActionCard(
//                           icon: Icons.report_problem_rounded,
//                           label: "Complaint",
//                           color: Colors.red.shade600,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => complaintsub()),
//                             );
//                           },
//                         ),
//                         _buildActionCard(
//                           icon: Icons.star_rounded,
//                           label: "Feedback",
//                           color: Colors.amber.shade600,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => feedbacksub()),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: 20),
//
//                     // Recent News Section
//                     Container(
//                       padding: EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.05),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(
//                           color: Colors.white.withOpacity(0.1),
//                         ),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Recent Verified News",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: isMobile ? 16 : 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(builder: (context) => view_all_newssub()),
//                                   );
//                                 },
//                                 style: TextButton.styleFrom(
//                                   foregroundColor: Colors.amber.shade300,
//                                 ),
//                                 child: Text("View All"),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 12),
//                           _buildNewsItem(
//                             "Election results declared...",
//                             "Verified",
//                             Colors.green,
//                           ),
//                           _buildNewsItem(
//                             "Breaking: New policy announced...",
//                             "Fake News",
//                             Colors.red,
//                           ),
//                           _buildNewsItem(
//                             "Weather update for tomorrow...",
//                             "Verified",
//                             Colors.green,
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     SizedBox(height: 16),
//
//                     // Trust Tips
//                     Container(
//                       padding: EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Colors.amber.shade600.withOpacity(0.2),
//                             Colors.orange.shade700.withOpacity(0.1),
//                           ],
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(
//                           color: Colors.amber.withOpacity(0.3),
//                         ),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.lightbulb_rounded,
//                             color: Colors.amber.shade300,
//                             size: 30,
//                           ),
//                           SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Trust Tip",
//                                   style: TextStyle(
//                                     color: Colors.amber.shade300,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: isMobile ? 14 : 16,
//                                   ),
//                                 ),
//                                 Text(
//                                   "Always verify news from multiple sources before sharing.",
//                                   style: TextStyle(
//                                     color: Colors.grey.shade300,
//                                     fontSize: isMobile ? 12 : 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDrawerItem({
//     required IconData icon,
//     required String title,
//     required Color color,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Container(
//         padding: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Icon(icon, color: color, size: 22),
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//         ),
//       ),
//       trailing: Icon(
//         Icons.arrow_forward_ios_rounded,
//         color: Colors.grey.shade400,
//         size: 16,
//       ),
//       onTap: onTap,
//     );
//   }
//
//   Widget _buildStatCard({
//     required IconData icon,
//     required String value,
//     required String label,
//     required Color color,
//   }) {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.05),
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(
//           color: color.withOpacity(0.3),
//         ),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: color, size: 24),
//           SizedBox(height: 8),
//           Text(
//             value,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               color: Colors.grey.shade400,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildActionCard({
//     required IconData icon,
//     required String label,
//     required Color color,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               color,
//               color.withOpacity(0.7),
//             ],
//           ),
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: color.withOpacity(0.3),
//               blurRadius: 8,
//               offset: Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: Colors.white, size: 30),
//             SizedBox(height: 8),
//             Text(
//               label,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNewsItem(String title, String status, Color statusColor) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 8),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.03),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               title,
//               style: TextStyle(color: Colors.white),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color: statusColor.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: statusColor),
//             ),
//             child: Text(
//               status,
//               style: TextStyle(
//                 color: statusColor,
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showSignOutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Color(0xFF1A1A2E),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//           side: BorderSide(color: Colors.amber.shade300, width: 1.5),
//         ),
//         title: Text(
//           "Sign Out",
//           style: TextStyle(color: Colors.white),
//         ),
//         content: Text(
//           "Are you sure you want to sign out?",
//           style: TextStyle(color: Colors.grey.shade300),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             style: TextButton.styleFrom(
//               foregroundColor: Colors.grey.shade400,
//             ),
//             child: Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               // Add sign out logic here
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text("Signed out successfully"),
//                   backgroundColor: Colors.amber.shade800,
//                   behavior: SnackBarBehavior.floating,
//                 ),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red.shade600,
//               foregroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: Text("Sign Out"),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:eample/password.dart';
import 'package:eample/url.dart';
import 'package:eample/view_all_news.dart';
import 'package:eample/view_current_location.dart';
import 'package:eample/view_news%20_by_area.dart';
import 'package:eample/view_news_by_area.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'complaint.dart';
import 'feedback.dart';

void main() {
  runApp(home());
}

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: homesub(),
    );
  }
}

class homesub extends StatefulWidget {
  const homesub({Key? key}) : super(key: key);

  @override
  State<homesub> createState() => _homesubState();
}

class _homesubState extends State<homesub> {
  TextEditingController newsController = TextEditingController();
  String prediction = "";
  bool isLoading = false;
  List recentChecks = [];

  @override
  void initState() {
    super.initState();
    loadRecentChecks();
  }

  Future<void> loadRecentChecks() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    setState(() {
      recentChecks = sh.getStringList('recent_checks') ?? [];
    });
  }

  Future<void> checkNews() async {
    if (newsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter news to check'),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    SharedPreferences sh = await SharedPreferences.getInstance();

    try {
      var response = await http.post(
        Uri.parse("${sh.getString("ip")}/send_newss"),
        body: {
          "news": newsController.text,
          "uid": sh.getString("uid").toString(),
        },
      );

      var jsonData = json.decode(response.body);

      setState(() {
        prediction = jsonData["prediction"];
        isLoading = false;

        // Save to recent checks
        List updated = [newsController.text, ...recentChecks];
        if (updated.length > 5) updated = updated.sublist(0, 5);
        recentChecks = updated;
        sh.setStringList('recent_checks', recentChecks.cast<String>());
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error checking news'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'HOME',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 2,
            shadows: [
              Shadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade50, Colors.white],
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue.shade700, Colors.purple.shade700],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -20,
                      right: -20,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      left: -30,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Welcome Back!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  children: [
                    _buildDrawerItem(Icons.report_problem, 'Detection using url', Colors.orange, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => url()));
                    }),
                    _buildDrawerItem(Icons.report_problem, 'Send complaint', Colors.orange, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => complaintsub()));
                    }),
                    _buildDrawerItem(Icons.feedback, 'Feedback', Colors.green, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => feedbacksub()));
                    }),
                    _buildDrawerItem(Icons.lock, 'Change Password', Colors.red, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => change_password()));
                    }),
                    _buildDrawerItem(Icons.newspaper, 'View All News', Colors.purple, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => view_all_newssub()));
                    }),
                    _buildDrawerItem(Icons.location_on, 'View Current Location', Colors.teal, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => view_current_locationsub()));
                    }),
                    _buildDrawerItem(Icons.map, 'View News by Area', Colors.indigo, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => view_news_by_areasub()));
                    }),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Version 1.0.0',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade400, Colors.purple.shade400],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // User Info Header
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Colors.blue.shade700, size: 30),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, User!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Welcome to News Portal',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Main Fake News Checking Card
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.blue.shade400, Colors.purple.shade400],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(Icons.verified, color: Colors.white, size: 30),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Fake News Detection',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade900,
                                      ),
                                    ),
                                    Text(
                                      'Verify news authenticity instantly',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),

                          // News Input Field
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: TextField(
                              controller: newsController,
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: 'Paste or type news article here...',
                                hintStyle: TextStyle(color: Colors.grey.shade500),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.all(20),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // Check Button
                          Container(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: isLoading ? null : checkNews,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade700,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 5,
                              ),
                              child: isLoading
                                  ? CircularProgressIndicator(color: Colors.white)
                                  : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.search, size: 24),
                                  SizedBox(width: 10),
                                  Text(
                                    'CHECK NEWS',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Prediction Result
                          if (prediction.isNotEmpty) ...[
                            SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: prediction == "fake"
                                    ? Colors.red.shade50
                                    : Colors.green.shade50,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: prediction == "fake"
                                      ? Colors.red.shade200
                                      : Colors.green.shade200,
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    prediction == "fake"
                                        ? Icons.warning_amber_rounded
                                        : Icons.check_circle,
                                    color: prediction == "fake"
                                        ? Colors.red.shade700
                                        : Colors.green.shade700,
                                    size: 50,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'RESULT:',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Text(
                                    prediction.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: prediction == "fake"
                                          ? Colors.red.shade700
                                          : Colors.green.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          // Clear Button
                          if (newsController.text.isNotEmpty || prediction.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    newsController.clear();
                                    prediction = "";
                                  });
                                },
                                child: Text('Clear'),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Quick Actions Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Actions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.2,
                        children: [
                          _buildQuickActionCard(
                            'Complaint',
                            Icons.report_problem,
                            Colors.orange,
                                () => Navigator.push(context, MaterialPageRoute(builder: (context) => complaintsub())),
                          ),
                          _buildQuickActionCard(
                            'Feedback',
                            Icons.feedback,
                            Colors.green,
                                () => Navigator.push(context, MaterialPageRoute(builder: (context) => feedbacksub())),
                          ),
                          _buildQuickActionCard(
                            'All News',
                            Icons.newspaper,
                            Colors.purple,
                                () => Navigator.push(context, MaterialPageRoute(builder: (context) => view_all_newssub())),
                          ),
                          _buildQuickActionCard(
                            'Location',
                            Icons.location_on,
                            Colors.teal,
                                () => Navigator.push(context, MaterialPageRoute(builder: (context) => view_current_locationsub())),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Recent Checks Section
                if (recentChecks.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recent Checks',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: recentChecks.length,
                            separatorBuilder: (context, index) => Divider(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue.shade100,
                                  child: Icon(Icons.history, color: Colors.blue.shade700, size: 20),
                                ),
                                title: Text(
                                  recentChecks[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onTap: () {
                                  setState(() {
                                    newsController.text = recentChecks[index];
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, Color color, VoidCallback onTap) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildQuickActionCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 30),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
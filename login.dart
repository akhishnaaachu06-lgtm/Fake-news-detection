// import 'dart:convert';
//
// import 'package:eample/reg.dart';
// import 'package:eample/user_home.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
//
// class logsub extends StatefulWidget {
//   const logsub ({Key? key}) : super(key: key);
//
//   @override
//   State<logsub> createState() => _State();
// }
//
// class _State extends State<logsub> {
//   TextEditingController name = TextEditingController();
//   TextEditingController password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {context
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text("Login", style: TextStyle(color: Colors.white),),
//       ),
//       body: Center(child: Column(children:
//       [TextField(controller: name, decoration:
//       InputDecoration(hintText:"username",border: OutlineInputBorder()),
//       ), TextField(controller: password, decoration:
//       InputDecoration(hintText:"password",border: OutlineInputBorder()),
//       ),
//         ElevatedButton(
//           onPressed: () async {
//             SharedPreferences sh = await SharedPreferences.getInstance();
//
//             String? ip = sh.getString("ip");
//             if (ip == null) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text("IP not set")),
//               );
//               return;
//             }
//
//             var response = await http.post(
//               Uri.parse("$ip/login1_post"),
//               body: {
//                 "username": name.text,
//                 "password": password.text,
//               },
//             );
//
//             var decodeddata = json.decode(response.body);
//
//             if (decodeddata['status'] == 'ok') {
//               await sh.setString('uid', decodeddata['uid']);
//               await sh.setString('password', password.text);
//
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => home()), // change this
//               );
//             } else {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: Text("Login Failed"),
//                   content: Text("Invalid username or password"),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: Text("OK"),
//                     )
//                   ],
//                 ),
//               );
//             }
//           },
//           child: Text("Login"),
//         ),
//
//
//
//         ElevatedButton(onPressed: ()async{
//           Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => registersub()));
//         }, child: Text("Register"))
//       ]
//       ),),);
//   }
// }


// import 'dart:convert';
//
// import 'package:eample/reg.dart';
// import 'package:eample/user_home.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// class logsub extends StatefulWidget {
//   const logsub({Key? key}) : super(key: key);
//
//   @override
//   State<logsub> createState() => _State();
// }
//
// class _State extends State<logsub> {
//   TextEditingController name = TextEditingController();
//   TextEditingController password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(
//           "Login",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         elevation: 4,
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
//           child: Container(
//             width: 350,
//             padding: EdgeInsets.all(30),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   spreadRadius: 3,
//                   blurRadius: 10,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(bottom: 20),
//                   child: Icon(
//                     Icons.account_circle,
//                     size: 60,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(bottom: 10),
//                   child: Text(
//                     "Login to continue",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(bottom: 15),
//                   child: TextField(
//                     controller: name,
//                     decoration: InputDecoration(
//                       hintText: "username",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue, width: 2),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       contentPadding: EdgeInsets.all(15),
//                       prefixIcon: Icon(Icons.person),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(bottom: 20),
//                   child: TextField(
//                     controller: password,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: "password",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue, width: 2),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       contentPadding: EdgeInsets.all(15),
//                       prefixIcon: Icon(Icons.lock),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 50,
//                   margin: EdgeInsets.only(bottom: 15),
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       SharedPreferences sh = await SharedPreferences.getInstance();
//
//                       String? ip = sh.getString("ip");
//                       if (ip == null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("IP not set")),
//                         );
//                         return;
//                       }
//
//                       var response = await http.post(
//                         Uri.parse("$ip/login1_post"),
//                         body: {
//                           "username": name.text,
//                           "password": password.text,
//                         },
//                       );
//
//                       var decodeddata = json.decode(response.body);
//
//                       if (decodeddata['status'] == 'ok') {
//                         await sh.setString('uid', decodeddata['uid']);
//                         await sh.setString('password', password.text);
//
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) => home()), // change this
//                         );
//                       } else {
//                         showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                             title: Text("Login Failed"),
//                             content: Text("Invalid username or password"),
//                             actions: [
//                               TextButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 child: Text("OK"),
//                               )
//                             ],
//                           ),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 3,
//                     ),
//                     child: Text(
//                       "Login",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => registersub()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 3,
//                     ),
//                     child: Text(
//                       "Register",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 20),
//                   child: Text(
//                     "Enter your username and password to Login",
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }










import 'dart:convert';
import 'package:eample/reg.dart';
import 'package:eample/user_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class logsub extends StatefulWidget {
  const logsub({Key? key}) : super(key: key);

  @override
  State<logsub> createState() => _State();
}

class _State extends State<logsub> with SingleTickerProviderStateMixin {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<String> _quotes = [
    "🔍 Separate fact from fiction",
    "📰 Don't believe everything you read",
    "💡 Think before you share",
    "🌐 Verify before you amplify",
    "🎯 Truth matters in digital age",
    "⚡ Stop fake news in its tracks",
  ];

  int _currentQuoteIndex = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();

    // Rotate quotes every 4 seconds
    Future.delayed(const Duration(seconds: 4), _rotateQuote);
  }

  void _rotateQuote() {
    if (mounted) {
      setState(() {
        _currentQuoteIndex = (_currentQuoteIndex + 1) % _quotes.length;
      });
      Future.delayed(const Duration(seconds: 4), _rotateQuote);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Responsive sizing method
  double getResponsiveFontSize(double baseSize) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 1200) {
      // Desktop/Laptop
      return baseSize * 1.2;
    } else if (screenWidth > 600) {
      // Tablet
      return baseSize * 1.0;
    } else {
      // Mobile
      return baseSize * 0.9;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenSize = MediaQuery.of(context).size;
    final bool isDesktop = screenSize.width > 1200;
    final bool isTablet = screenSize.width > 600 && screenSize.width <= 1200;
    final bool isMobile = screenSize.width <= 600;

    // Set maximum width for form container
    final double maxFormWidth = isDesktop ? 450 : (isTablet ? 400 : 350);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade900,
              Colors.purple.shade800,
              Colors.deepPurple.shade900,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(isMobile ? 16 : 24),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  constraints: BoxConstraints(maxWidth: maxFormWidth),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo - Smaller on mobile
                      Container(
                        width: isMobile ? 70 : (isTablet ? 90 : 100),
                        height: isMobile ? 70 : (isTablet ? 90 : 100),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: isMobile ? 1.5 : 2,
                          ),
                        ),
                        child: Icon(
                          Icons.security_rounded,
                          size: isMobile ? 35 : (isTablet ? 45 : 50),
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: isMobile ? 15 : 25),

                      // App Title - Responsive font
                      Text(
                        "No Cap News",
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(28),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                          shadows: const [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.black26,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: isMobile ? 15 : 20),

                      // Quote Container - Compact on mobile
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: isMobile ? 10 : 15,
                          horizontal: isMobile ? 0 : 10,
                        ),
                        padding: EdgeInsets.all(isMobile ? 12 : 16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Text(
                            _quotes[_currentQuoteIndex],
                            key: ValueKey(_currentQuoteIndex),
                            style: TextStyle(
                              fontSize: getResponsiveFontSize(16),
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),

                      SizedBox(height: isMobile ? 15 : 25),

                      // Login Form Card - Compact padding on mobile
                      Container(
                        padding: EdgeInsets.all(isMobile ? 16 : (isTablet ? 20 : 24)),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: BorderRadius.circular(isMobile ? 20 : 25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: isMobile ? 10 : 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Username Field
                            TextField(
                              controller: name,
                              style: TextStyle(
                                fontSize: getResponsiveFontSize(14),
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                hintText: "Username",
                                hintStyle: TextStyle(
                                  fontSize: getResponsiveFontSize(14),
                                  color: Colors.grey.shade600,
                                ),
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  size: getResponsiveFontSize(20),
                                  color: Colors.deepPurple.shade700,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 15 : 20,
                                  vertical: isMobile ? 12 : 15,
                                ),
                                isDense: isMobile, // Makes field more compact on mobile
                              ),
                            ),

                            SizedBox(height: isMobile ? 12 : 16),

                            // Password Field
                            TextField(
                              controller: password,
                              obscureText: true,
                              style: TextStyle(
                                fontSize: getResponsiveFontSize(14),
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  fontSize: getResponsiveFontSize(14),
                                  color: Colors.grey.shade600,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: getResponsiveFontSize(20),
                                  color: Colors.deepPurple.shade700,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 15 : 20,
                                  vertical: isMobile ? 12 : 15,
                                ),
                                isDense: isMobile,
                              ),
                            ),

                            SizedBox(height: isMobile ? 20 : 24),

                            // Login Button
                            SizedBox(
                              width: double.infinity,
                              height: isMobile ? 45 : (isTablet ? 50 : 55),
                              child: ElevatedButton(
                                onPressed: () async {
                                  SharedPreferences sh = await SharedPreferences.getInstance();

                                  String? ip = sh.getString("ip");
                                  if (ip == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "IP not set",
                                          style: TextStyle(fontSize: getResponsiveFontSize(14)),
                                        ),
                                        backgroundColor: Colors.red,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                    return;
                                  }

                                  var response = await http.post(
                                    Uri.parse("$ip/login1_post"),
                                    body: {
                                      "username": name.text,
                                      "password": password.text,
                                    },
                                  );

                                  var decodeddata = json.decode(response.body);

                                  if (decodeddata['status'] == 'ok') {
                                    await sh.setString('uid', decodeddata['uid']);
                                    await sh.setString('password', password.text);

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => home()),
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(
                                          "Login Failed",
                                          style: TextStyle(fontSize: getResponsiveFontSize(18)),
                                        ),
                                        content: Text(
                                          "Invalid username or password",
                                          style: TextStyle(fontSize: getResponsiveFontSize(14)),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text(
                                              "OK",
                                              style: TextStyle(fontSize: getResponsiveFontSize(14)),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple.shade800,
                                  foregroundColor: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: getResponsiveFontSize(16),
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: isMobile ? 12 : 16),

                            // Register Button
                            SizedBox(
                              width: double.infinity,
                              height: isMobile ? 45 : (isTablet ? 50 : 55),
                              child: OutlinedButton(
                                onPressed: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => registersub()),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.deepPurple.shade800,
                                  side: BorderSide(
                                    color: Colors.deepPurple.shade800,
                                    width: isMobile ? 1.5 : 2,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "Create New Account",
                                  style: TextStyle(
                                    fontSize: getResponsiveFontSize(14),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: isMobile ? 15 : 20),

                      // Footer Text
                      Text(
                        "Together we fight misinformation",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: getResponsiveFontSize(12),
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// import 'dart:convert';
// import 'package:eample/login.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// class register extends StatelessWidget {
//   const register({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: registersub(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class registersub extends StatefulWidget {
//   const registersub({Key? key}) : super(key: key);
//
//   @override
//   State<registersub> createState() => _registersubState();
// }
//
// class _registersubState extends State<registersub> {
//
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController confirm = TextEditingController();
//
//   List areaList = [];
//   String? selectedAreaId;
//
//   @override
//   void initState() {
//     super.initState();
//     loadArea();
//   }
//
//   Future<void> loadArea() async {
//     SharedPreferences sh = await SharedPreferences.getInstance();
//
//     var response = await http.get(
//       Uri.parse("${sh.getString("ip")}/load_area"),
//     );
//
//     var jsonData = json.decode(response.body);
//
//     if (jsonData['status'] == 'ok') {
//       setState(() {
//         areaList = jsonData['data'];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//
//               TextField(
//                 controller: name,
//                 decoration: InputDecoration(
//                   labelText: "Name",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//
//               SizedBox(height: 10),
//
//               TextField(
//                 controller: email,
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//
//               SizedBox(height: 10),
//
//               TextField(
//                 controller: phone,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   labelText: "Phone",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//
//               SizedBox(height: 10),
//
//               TextField(
//                 controller: password,
//                 decoration: InputDecoration(
//                   labelText: "password",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//
//               SizedBox(height: 10),
//
//               TextField(
//                 controller: confirm,
//                 decoration: InputDecoration(
//                   labelText: "confirm password",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//
//               SizedBox(height: 10),
//
//               DropdownButtonFormField<String>(
//                 value: selectedAreaId,
//                 hint: Text("Select Area"),
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//                 items: areaList.map((area) {
//                   return DropdownMenuItem<String>(
//                     value: area['id'].toString(),
//                     child: Text(
//                       "${area['areas']} - ${area['district']}",
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedAreaId = value;
//                   });
//                 },
//               ),
//
//               SizedBox(height: 20),
//
//               ElevatedButton(
//                 onPressed: () async {
//
//                   if (selectedAreaId == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Please select area")),
//                     );
//                     return;
//                   }
//
//                   SharedPreferences sh =
//                   await SharedPreferences.getInstance();
//
//                   var response = await http.post(
//                     Uri.parse("${sh.getString("ip")}/register_users"),
//                     body: {
//                       "name": name.text,
//                       "email": email.text,
//                       "phone": phone.text,
//                       "area_id": selectedAreaId!,
//                       'password':password.text,
//                       'confirm':confirm.text
//                     },
//                   );
//
//                   var decodedData = json.decode(response.body);
//
//                   if (decodedData['status'] == 'ok') {
//                     showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         title: Text("Registration"),
//                         content: Text("Successful"),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => logsub(),
//                                 ),
//                               );
//                             },
//                             child: Text("Login"),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//                 },
//                 child: Text("Register"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'dart:convert';
// import 'package:eample/login.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// class register extends StatelessWidget {
//   const register({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: registersub(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class registersub extends StatefulWidget {
//   const registersub({Key? key}) : super(key: key);
//
//   @override
//   State<registersub> createState() => _registersubState();
// }
//
// class _registersubState extends State<registersub> {
//
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController confirm = TextEditingController();
//
//   List areaList = [];
//   String? selectedAreaId;
//
//   @override
//   void initState() {
//     super.initState();
//     loadArea();
//   }
//
//   Future<void> loadArea() async {
//     SharedPreferences sh = await SharedPreferences.getInstance();
//
//     var response = await http.get(
//       Uri.parse("${sh.getString("ip")}/load_area"),
//     );
//
//     var jsonData = json.decode(response.body);
//
//     if (jsonData['status'] == 'ok') {
//       setState(() {
//         areaList = jsonData['data'];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(
//           "Registration",
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
//             width: 400,
//             margin: EdgeInsets.all(20),
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
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//
//                   Container(
//                     margin: EdgeInsets.only(bottom: 20),
//                     child: Icon(
//                       Icons.app_registration,
//                       size: 60,
//                       color: Colors.blue,
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(bottom: 20),
//                     child: Text(
//                       "Create New Account",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     child: TextField(
//                       controller: name,
//                       decoration: InputDecoration(
//                         labelText: "Name",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue, width: 2),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         contentPadding: EdgeInsets.all(15),
//                         prefixIcon: Icon(Icons.person),
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     child: TextField(
//                       controller: email,
//                       decoration: InputDecoration(
//                         labelText: "Email",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue, width: 2),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         contentPadding: EdgeInsets.all(15),
//                         prefixIcon: Icon(Icons.email),
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     child: TextField(
//                       controller: phone,
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         labelText: "Phone",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue, width: 2),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         contentPadding: EdgeInsets.all(15),
//                         prefixIcon: Icon(Icons.phone),
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     child: TextField(
//                       controller: password,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: "password",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue, width: 2),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         contentPadding: EdgeInsets.all(15),
//                         prefixIcon: Icon(Icons.lock),
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     child: TextField(
//                       controller: confirm,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: "confirm password",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue, width: 2),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         contentPadding: EdgeInsets.all(15),
//                         prefixIcon: Icon(Icons.lock_outline),
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     child: DropdownButtonFormField<String>(
//                       value: selectedAreaId,
//                       hint: Text("Select Area"),
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.blue, width: 2),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//                         prefixIcon: Icon(Icons.location_on),
//                       ),
//                       items: areaList.map((area) {
//                         return DropdownMenuItem<String>(
//                           value: area['id'].toString(),
//                           child: Text(
//                             "${area['areas']} - ${area['district']}",
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           selectedAreaId = value;
//                         });
//                       },
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(top: 20),
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () async {
//
//                         if (selectedAreaId == null) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("Please select area")),
//                           );
//                           return;
//                         }
//
//                         SharedPreferences sh =
//                         await SharedPreferences.getInstance();
//
//                         var response = await http.post(
//                           Uri.parse("${sh.getString("ip")}/register_users"),
//                           body: {
//                             "name": name.text,
//                             "email": email.text,
//                             "phone": phone.text,
//                             "area_id": selectedAreaId!,
//                             'password': password.text,
//                             'confirm': confirm.text
//                           },
//                         );
//
//                         var decodedData = json.decode(response.body);
//
//                         if (decodedData['status'] == 'ok') {
//                           showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                               title: Text("Registration"),
//                               content: Text("Successful"),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => logsub(),
//                                       ),
//                                     );
//                                   },
//                                   child: Text("Login"),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         elevation: 3,
//                       ),
//                       child: Text(
//                         "Register",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.only(top: 20),
//                     child: Text(
//                       "Fill all details to create your account",
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[600],
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
import 'dart:convert';
import 'package:eample/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: registersub(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class registersub extends StatefulWidget {
  const registersub({Key? key}) : super(key: key);

  @override
  State<registersub> createState() => _registersubState();
}

class _registersubState extends State<registersub> with SingleTickerProviderStateMixin {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();

  List areaList = [];
  String? selectedAreaId;

  // Validation states
  bool _isNameValid = true;
  bool _isEmailValid = true;
  bool _isPhoneValid = true;
  bool _isPasswordValid = true;
  bool _isConfirmValid = true;
  bool _isAreaValid = true;

  String _nameError = '';
  String _emailError = '';
  String _phoneError = '';
  String _passwordError = '';
  String _confirmError = '';

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  final List<String> _truthQuotes = [
    "📰 ",
    "🔍 ",
    "⚖️ ",
    "🎯 ",
    "💪 ",
    "👁️ ",
  ];

  @override
  void initState() {
    super.initState();
    loadArea();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.7, curve: Curves.easeOutCubic),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 0.9, curve: Curves.easeOutBack),
      ),
    );

    _rotateAnimation = Tween<double>(begin: -0.1, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  Future<void> loadArea() async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    var response = await http.get(
      Uri.parse("${sh.getString("ip")}/load_area"),
    );

    var jsonData = json.decode(response.body);

    if (jsonData['status'] == 'ok') {
      setState(() {
        areaList = jsonData['data'];
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirm.dispose();
    super.dispose();
  }

  // Validation Methods
  bool _validateName() {
    if (name.text.isEmpty) {
      setState(() {
        _isNameValid = false;
        _nameError = 'Name is required';
      });
      return false;
    } else if (name.text.length < 3) {
      setState(() {
        _isNameValid = false;
        _nameError = 'Name must be at least 3 characters';
      });
      return false;
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name.text)) {
      setState(() {
        _isNameValid = false;
        _nameError = 'Name can only contain letters and spaces';
      });
      return false;
    }
    setState(() {
      _isNameValid = true;
      _nameError = '';
    });
    return true;
  }

  bool _validateEmail() {
    if (email.text.isEmpty) {
      setState(() {
        _isEmailValid = false;
        _emailError = 'Email is required';
      });
      return false;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.text)) {
      setState(() {
        _isEmailValid = false;
        _emailError = 'Enter a valid email address';
      });
      return false;
    }
    setState(() {
      _isEmailValid = true;
      _emailError = '';
    });
    return true;
  }

  bool _validatePhone() {
    if (phone.text.isEmpty) {
      setState(() {
        _isPhoneValid = false;
        _phoneError = 'Phone number is required';
      });
      return false;
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(phone.text)) {
      setState(() {
        _isPhoneValid = false;
        _phoneError = 'Enter a valid 10-digit phone number';
      });
      return false;
    }
    setState(() {
      _isPhoneValid = true;
      _phoneError = '';
    });
    return true;
  }

  bool _validatePassword() {
    if (password.text.isEmpty) {
      setState(() {
        _isPasswordValid = false;
        _passwordError = 'Password is required';
      });
      return false;
    } else if (password.text.length < 8) {
      setState(() {
        _isPasswordValid = false;
        _passwordError = 'Password must be at least 8 characters';
      });
      return false;
    } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(password.text)) {
      setState(() {
        _isPasswordValid = false;
        _passwordError = 'Password must contain letters and numbers';
      });
      return false;
    }
    setState(() {
      _isPasswordValid = true;
      _passwordError = '';
    });
    return true;
  }

  bool _validateConfirm() {
    if (confirm.text.isEmpty) {
      setState(() {
        _isConfirmValid = false;
        _confirmError = 'Please confirm your password';
      });
      return false;
    } else if (confirm.text != password.text) {
      setState(() {
        _isConfirmValid = false;
        _confirmError = 'Passwords do not match';
      });
      return false;
    }
    setState(() {
      _isConfirmValid = true;
      _confirmError = '';
    });
    return true;
  }

  bool _validateArea() {
    if (selectedAreaId == null) {
      setState(() {
        _isAreaValid = false;
      });
      return false;
    }
    setState(() {
      _isAreaValid = true;
    });
    return true;
  }

  bool _validateAll() {
    bool isValid = true;

    isValid &= _validateName();
    isValid &= _validateEmail();
    isValid &= _validatePhone();
    isValid &= _validatePassword();
    isValid &= _validateConfirm();
    isValid &= _validateArea();

    return isValid;
  }

  void _clearValidationOnTap(String field) {
    switch(field) {
      case 'name':
        if (!_isNameValid) {
          setState(() {
            _isNameValid = true;
            _nameError = '';
          });
        }
        break;
      case 'email':
        if (!_isEmailValid) {
          setState(() {
            _isEmailValid = true;
            _emailError = '';
          });
        }
        break;
      case 'phone':
        if (!_isPhoneValid) {
          setState(() {
            _isPhoneValid = true;
            _phoneError = '';
          });
        }
        break;
      case 'password':
        if (!_isPasswordValid) {
          setState(() {
            _isPasswordValid = true;
            _passwordError = '';
          });
        }
        break;
      case 'confirm':
        if (!_isConfirmValid) {
          setState(() {
            _isConfirmValid = true;
            _confirmError = '';
          });
        }
        break;
    }
  }

  double getResponsiveFontSize(double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) return baseSize * 1.2;
    if (screenWidth > 600) return baseSize * 1.0;
    return baseSize * 0.9;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final bool isMobile = screenSize.width <= 600;
    final double maxFormWidth = isMobile ? 380 : 450;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F3460),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: ParticlePainter(animation: _animationController),
                ),
              ),

              Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(isMobile ? 16 : 24),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      constraints: BoxConstraints(maxWidth: maxFormWidth),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Animated Logo Section
                            SlideTransition(
                              position: _slideAnimation,
                              child: ScaleTransition(
                                scale: _scaleAnimation,
                                child: RotationTransition(
                                  turns: _rotateAnimation,
                                  child: Container(
                                    width: isMobile ? 90 : 110,
                                    height: isMobile ? 90 : 110,
                                    decoration: BoxDecoration(
                                      gradient: RadialGradient(
                                        colors: [
                                          Colors.amber.shade300,
                                          Colors.orange.shade700,
                                        ],
                                      ),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.amber.withOpacity(0.3),
                                          blurRadius: 20,
                                          spreadRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Icon(
                                          Icons.verified_rounded,
                                          size: isMobile ? 45 : 55,
                                          color: Colors.white,
                                        ),
                                        Positioned(
                                          bottom: 20,
                                          right: 20,
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: Colors.red.shade700,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              "!",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: isMobile ? 12 : 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: isMobile ? 15 : 20),

                            // App Name
                            ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: [Colors.amber.shade300, Colors.orange.shade500],
                              ).createShader(bounds),
                              child: Text(
                                "NO CAP NEWS",
                                style: TextStyle(
                                  fontSize: getResponsiveFontSize(32),
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 4,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 15,
                                      color: Colors.amber.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: isMobile ? 5 : 8),

                            Text(
                              "Truth Above All",
                              style: TextStyle(
                                fontSize: getResponsiveFontSize(14),
                                color: Colors.grey.shade400,
                                letterSpacing: 2,
                                fontStyle: FontStyle.italic,
                              ),
                            ),

                            SizedBox(height: isMobile ? 20 : 25),

                            // Verification Message
                            TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0.0, end: 1.0),
                              duration: Duration(seconds: 2),
                              builder: (context, value, child) {
                                return Opacity(
                                  opacity: value,
                                  child: child,
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 15 : 20,
                                  vertical: isMobile ? 12 : 15,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.amber.withOpacity(0.3),
                                    width: 1.5,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.shield_rounded,
                                      color: Colors.amber,
                                      size: getResponsiveFontSize(20),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Verify your identity",
                                      style: TextStyle(
                                        fontSize: getResponsiveFontSize(13),
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: isMobile ? 25 : 30),

                            // Registration Form Card
                            SlideTransition(
                              position: _slideAnimation,
                              child: Container(
                                padding: EdgeInsets.all(isMobile ? 18 : 22),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.15),
                                    width: 1.5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    // Name Field with Validation
                                    _buildAnimatedField(
                                      controller: name,
                                      label: "Full Name",
                                      icon: Icons.person_outline_rounded,
                                      index: 0,
                                      isValid: _isNameValid,
                                      errorText: _nameError,
                                      onTap: () => _clearValidationOnTap('name'),
                                      onChanged: (value) {
                                        if (!_isNameValid) _validateName();
                                      },
                                    ),

                                    SizedBox(height: isMobile ? 12 : 16),

                                    // Email Field with Validation
                                    _buildAnimatedField(
                                      controller: email,
                                      label: "Email Address",
                                      icon: Icons.email_outlined,
                                      index: 1,
                                      isValid: _isEmailValid,
                                      errorText: _emailError,
                                      onTap: () => _clearValidationOnTap('email'),
                                      onChanged: (value) {
                                        if (!_isEmailValid) _validateEmail();
                                      },
                                    ),

                                    SizedBox(height: isMobile ? 12 : 16),

                                    // Phone Field with Validation
                                    _buildAnimatedField(
                                      controller: phone,
                                      label: "Phone Number",
                                      icon: Icons.phone_outlined,
                                      index: 2,
                                      isPhone: true,
                                      isValid: _isPhoneValid,
                                      errorText: _phoneError,
                                      onTap: () => _clearValidationOnTap('phone'),
                                      onChanged: (value) {
                                        if (!_isPhoneValid) _validatePhone();
                                      },
                                    ),

                                    SizedBox(height: isMobile ? 12 : 16),

                                    // Password Field with Validation
                                    _buildAnimatedField(
                                      controller: password,
                                      label: "Password",
                                      icon: Icons.lock_outline_rounded,
                                      index: 3,
                                      isPassword: true,
                                      isValid: _isPasswordValid,
                                      errorText: _passwordError,
                                      onTap: () => _clearValidationOnTap('password'),
                                      onChanged: (value) {
                                        if (!_isPasswordValid) _validatePassword();
                                        // Also validate confirm if it's not empty
                                        if (confirm.text.isNotEmpty) {
                                          _validateConfirm();
                                        }
                                      },
                                    ),

                                    SizedBox(height: isMobile ? 12 : 16),

                                    // Confirm Password Field with Validation
                                    _buildAnimatedField(
                                      controller: confirm,
                                      label: "Confirm Password",
                                      icon: Icons.shield_outlined,
                                      index: 4,
                                      isPassword: true,
                                      isValid: _isConfirmValid,
                                      errorText: _confirmError,
                                      onTap: () => _clearValidationOnTap('confirm'),
                                      onChanged: (value) {
                                        if (!_isConfirmValid) _validateConfirm();
                                      },
                                    ),

                                    SizedBox(height: isMobile ? 12 : 16),

                                    // Area Dropdown with Validation
                                    TweenAnimationBuilder<double>(
                                      tween: Tween(begin: 0.0, end: 1.0),
                                      duration: Duration(milliseconds: 500 + (5 * 100)),
                                      builder: (context, value, child) {
                                        return Opacity(
                                          opacity: value,
                                          child: Transform.translate(
                                            offset: Offset(0, 20 * (1 - value)),
                                            child: child,
                                          ),
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.15),
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(
                                                color: _isAreaValid
                                                    ? Colors.white.withOpacity(0.1)
                                                    : Colors.red.shade300.withOpacity(0.5),
                                                width: _isAreaValid ? 1 : 2,
                                              ),
                                            ),
                                            child: DropdownButtonFormField<String>(
                                              value: selectedAreaId,
                                              hint: Text(
                                                "Select your area",
                                                style: TextStyle(
                                                  fontSize: getResponsiveFontSize(14),
                                                  color: Colors.grey.shade400,
                                                ),
                                              ),
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                prefixIcon: Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.amber.shade300,
                                                  size: getResponsiveFontSize(20),
                                                ),
                                                contentPadding: EdgeInsets.symmetric(
                                                  horizontal: isMobile ? 15 : 20,
                                                  vertical: isMobile ? 8 : 12,
                                                ),
                                              ),
                                              icon: Icon(
                                                Icons.keyboard_arrow_down_rounded,
                                                color: Colors.amber.shade300,
                                              ),
                                              dropdownColor: Color(0xFF1A1A2E),
                                              style: TextStyle(
                                                fontSize: getResponsiveFontSize(14),
                                                color: Colors.white,
                                              ),
                                              items: areaList.map((area) {
                                                return DropdownMenuItem<String>(
                                                  value: area['id'].toString(),
                                                  child: Text(
                                                    "${area['areas']} - ${area['district']}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedAreaId = value;
                                                  _isAreaValid = true;
                                                });
                                              },
                                            ),
                                          ),
                                          if (!_isAreaValid)
                                            Padding(
                                              padding: const EdgeInsets.only(left: 16, top: 4),
                                              child: Text(
                                                'Please select your area',
                                                style: TextStyle(
                                                  color: Colors.red.shade300,
                                                  fontSize: getResponsiveFontSize(12),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: isMobile ? 25 : 30),

                                    // Password Strength Indicator
                                    if (password.text.isNotEmpty)
                                      _buildPasswordStrengthIndicator(),

                                    // Register Button
                                    TweenAnimationBuilder<double>(
                                      tween: Tween(begin: 1.0, end: 1.1),
                                      duration: Duration(milliseconds: 800),
                                      curve: Curves.easeInOut,
                                      builder: (context, scale, child) {
                                        return Transform.scale(
                                          scale: scale,
                                          child: child,
                                        );
                                      },
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: isMobile ? 50 : 55,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            if (_validateAll()) {
                                              await _registerUser();
                                            } else {
                                              _showValidationErrorSnackBar();
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.amber.shade600,
                                            foregroundColor: Colors.black,
                                            elevation: 10,
                                            shadowColor: Colors.amber.withOpacity(0.5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "VERIFY & JOIN",
                                                style: TextStyle(
                                                  fontSize: getResponsiveFontSize(16),
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 2,
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Icon(Icons.verified_rounded),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: isMobile ? 15 : 20),

                                    // Login Link
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Already a truth seeker? ",
                                          style: TextStyle(
                                            fontSize: getResponsiveFontSize(13),
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => logsub(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Sign In",
                                            style: TextStyle(
                                              fontSize: getResponsiveFontSize(13),
                                              color: Colors.amber.shade300,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: isMobile ? 20 : 25),

                            // Footer with security message
                            TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0.0, end: 1.0),
                              duration: Duration(seconds: 3),
                              builder: (context, value, child) {
                                return Opacity(
                                  opacity: value,
                                  child: child,
                                );
                              },
                              child: Text(
                                "🔒 Your information is protected with encryption",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: getResponsiveFontSize(11),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required int index,
    bool isPassword = false,
    bool isPhone = false,
    required bool isValid,
    required String errorText,
    required VoidCallback onTap,
    required Function(String) onChanged,
  }) {
    final isMobile = MediaQuery.of(context).size.width <= 600;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 500 + (index * 100)),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(30 * (1 - value), 0),
            child: child,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isValid
                    ? Colors.white.withOpacity(0.1)
                    : Colors.red.shade300.withOpacity(0.5),
                width: isValid ? 1 : 2,
              ),
            ),
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
              style: TextStyle(
                fontSize: getResponsiveFontSize(14),
                color: Colors.white,
              ),
              onTap: onTap,
              onChanged: onChanged,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                  fontSize: getResponsiveFontSize(14),
                  color: isValid ? Colors.grey.shade400 : Colors.red.shade300,
                ),
                prefixIcon: Icon(
                  icon,
                  color: isValid ? Colors.amber.shade300 : Colors.red.shade300,
                  size: getResponsiveFontSize(20),
                ),
                suffixIcon: !isValid
                    ? Icon(
                  Icons.error_outline_rounded,
                  color: Colors.red.shade300,
                  size: getResponsiveFontSize(18),
                )
                    : (controller.text.isNotEmpty
                    ? Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.green.shade300,
                  size: getResponsiveFontSize(18),
                )
                    : null),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 15 : 20,
                  vertical: isMobile ? 12 : 15,
                ),
              ),
            ),
          ),
          if (!isValid && errorText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 4),
              child: Text(
                errorText,
                style: TextStyle(
                  color: Colors.red.shade300,
                  fontSize: getResponsiveFontSize(12),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPasswordStrengthIndicator() {
    int strength = 0;
    if (password.text.length >= 8) strength++;
    if (RegExp(r'[A-Z]').hasMatch(password.text)) strength++;
    if (RegExp(r'[0-9]').hasMatch(password.text)) strength++;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password.text)) strength++;

    Color getColor() {
      switch(strength) {
        case 0: return Colors.red;
        case 1: return Colors.orange;
        case 2: return Colors.yellow;
        case 3: return Colors.lightGreen;
        case 4: return Colors.green;
        default: return Colors.grey;
      }
    }

    String getMessage() {
      switch(strength) {
        case 0: return 'Very Weak';
        case 1: return 'Weak';
        case 2: return 'Fair';
        case 3: return 'Strong';
        case 4: return 'Very Strong';
        default: return '';
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: strength / 4,
                    backgroundColor: Colors.grey.shade800,
                    valueColor: AlwaysStoppedAnimation<Color>(getColor()),
                    minHeight: 4,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                getMessage(),
                style: TextStyle(
                  color: getColor(),
                  fontSize: getResponsiveFontSize(12),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _registerUser() async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    var response = await http.post(
      Uri.parse("${sh.getString("ip")}/register_users"),
      body: {
        "name": name.text,
        "email": email.text,
        "phone": phone.text,
        "area_id": selectedAreaId!,
        'password': password.text,
        'confirm': confirm.text
      },
    );

    var decodedData = json.decode(response.body);

    if (decodedData['status'] == 'ok') {
      _showSuccessDialog();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        _buildStyledSnackBar(
          decodedData['message'] ?? "Registration failed",
          isError: true,
        ),
      );
    }
  }

  void _showValidationErrorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline_rounded, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Please fix the errors before proceeding",
                style: TextStyle(fontSize: getResponsiveFontSize(14)),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red.shade800,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  SnackBar _buildStyledSnackBar(String message, {bool isError = false}) {
    return SnackBar(
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline_rounded : Icons.info_outline_rounded,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(fontSize: getResponsiveFontSize(14)),
            ),
          ),
        ],
      ),
      backgroundColor: isError ? Colors.red.shade800 : Colors.amber.shade800,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      duration: Duration(seconds: 2),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.amber.shade300, width: 2),
        ),
        title: Column(
          children: [
            Icon(Icons.verified_rounded, color: Colors.amber.shade300, size: 50),
            SizedBox(height: 10),
            Text(
              "Welcome Truth Seeker!",
              style: TextStyle(
                color: Colors.white,
                fontSize: getResponsiveFontSize(18),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Text(
          "Your account has been verified and created successfully. Together, we'll fight fake news and uphold the truth!",
          style: TextStyle(
            color: Colors.grey.shade300,
            fontSize: getResponsiveFontSize(14),
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => logsub(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.amber.shade600,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "PROCEED TO LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for animated particles
class ParticlePainter extends CustomPainter {
  final Animation<double> animation;

  ParticlePainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber.withOpacity(0.1 * animation.value)
      ..style = PaintingStyle.fill;

    final random = DateTime.now().millisecondsSinceEpoch;

    for (int i = 0; i < 20; i++) {
      double x = (i * 37 + random * animation.value) % size.width;
      double y = (i * 53 + random * (1 - animation.value)) % size.height;

      canvas.drawCircle(
        Offset(x, y),
        2.0 + (animation.value * 2),
        paint..color = Colors.amber.withOpacity(0.05 + (0.1 * animation.value)),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
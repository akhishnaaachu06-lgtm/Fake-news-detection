//
//
// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:eample/user_home.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// import 'login.dart';
//
// class change_password extends StatelessWidget {
//   const change_password({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home:change_passwordsub(),);
//   }
// }
// class change_passwordsub extends StatefulWidget {
//   const change_passwordsub({Key? key}) : super(key: key);
//
//   @override
//   State<change_passwordsub> createState() => _change_passwordsubState();
// }
//
// class _change_passwordsubState extends State<change_passwordsub> {
//   final current_password = TextEditingController();
//   final new_password=TextEditingController();
//   final confirm_password=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Column(children:
//     [TextField(controller: current_password,decoration:
//     InputDecoration(hintText:"current password",border: OutlineInputBorder()),
//     ),TextField(controller: new_password,decoration:
//     InputDecoration(hintText:"new password",border: OutlineInputBorder()),
//     ),TextField(controller: confirm_password,decoration:
//     InputDecoration(hintText:"confirm password",border: OutlineInputBorder()),
//     ),
//     ElevatedButton(onPressed: ()async{
//         SharedPreferences sh= await SharedPreferences.getInstance();
//         if(sh.getString('password').toString()!=current_password.text){
//           showDialog(context: context, builder: (context)=>AlertDialog(title:
//           Text("password"),content: Text("current password not correct"),actions: [
//             TextButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>change_password()));
//             }, child: Text("ok"))
//           ],));
//         }
//
//         if(new_password.text!=confirm_password.text){
//           showDialog(context: context, builder: (context)=>AlertDialog(title:
//           Text("password"),content: Text("new password and confirm password not same"),actions: [
//             TextButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>change_password()));
//             }, child: Text("ok"))
//           ],),);
//         }
//         var data=await http.post(Uri.parse("${sh.getString("ip")}/user_change_password"),
//         body: {
//           "confirm_password": confirm_password.text,
//           'uid':sh.getString('uid').toString()
//               }
//         );
//         var decoded=json.decode(data.body);
//
//         if(decoded['status']=="ok"){
//           showDialog(context: context, builder: (context)=>AlertDialog(title:
//           Text("password"),content: Text("password changed"),actions: [
//             TextButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
//             }, child: Text("ok"))
//           ],),);
//         }
//
//     }, child:Text("submit"))
//     ],),),);
//   }
// }
//
//
//
//
//
import 'dart:convert';
import 'dart:developer';

import 'package:eample/user_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as htt ;

import 'login.dart';

class change_password extends StatelessWidget {
  const change_password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: change_passwordsub(),
    );
  }
}

class change_passwordsub extends StatefulWidget {
  const change_passwordsub({Key? key}) : super(key: key);

  @override
  State<change_passwordsub> createState() => _change_passwordsubState();
}

class _change_passwordsubState extends State<change_passwordsub> {
  final current_password = TextEditingController();
  final new_password = TextEditingController();
  final confirm_password = TextEditingController();

  bool isLoading = false;
  bool obscureCurrent = true;
  bool obscureNew = true;
  bool obscureConfirm = true;

  // Validation flags
  bool isCurrentPasswordValid = true;
  bool isNewPasswordValid = true;
  bool isConfirmPasswordValid = true;
  bool isPasswordMatch = true;

  String? currentPasswordError;
  String? newPasswordError;
  String? confirmPasswordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade700, Colors.blue.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade700, Colors.blue.shade500],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.lock_reset,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Update Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Change your account password securely',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                // Password Change Form Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Current Password Field
                        _buildPasswordField(
                          controller: current_password,
                          label: 'Current Password',
                          hint: 'Enter your current password',
                          icon: Icons.lock_outline,
                          obscureText: obscureCurrent,
                          toggleObscure: () {
                            setState(() {
                              obscureCurrent = !obscureCurrent;
                            });
                          },
                          errorText: currentPasswordError,
                          isValid: isCurrentPasswordValid,
                          onChanged: (value) {
                            _validateCurrentPassword(value);
                          },
                        ),

                        SizedBox(height: 20),

                        // New Password Field
                        _buildPasswordField(
                          controller: new_password,
                          label: 'New Password',
                          hint: 'Enter new password',
                          icon: Icons.lock_open_outlined,
                          obscureText: obscureNew,
                          toggleObscure: () {
                            setState(() {
                              obscureNew = !obscureNew;
                            });
                          },
                          errorText: newPasswordError,
                          isValid: isNewPasswordValid,
                          onChanged: (value) {
                            _validateNewPassword(value);
                            if (confirm_password.text.isNotEmpty) {
                              _validateConfirmPassword(confirm_password.text);
                            }
                          },
                        ),

                        SizedBox(height: 20),

                        // Confirm Password Field
                        _buildPasswordField(
                          controller: confirm_password,
                          label: 'Confirm Password',
                          hint: 'Re-enter new password',
                          icon: Icons.lock_outline,
                          obscureText: obscureConfirm,
                          toggleObscure: () {
                            setState(() {
                              obscureConfirm = !obscureConfirm;
                            });
                          },
                          errorText: confirmPasswordError,
                          isValid: isConfirmPasswordValid,
                          onChanged: (value) {
                            _validateConfirmPassword(value);
                          },
                        ),

                        SizedBox(height: 20),

                        // Password Strength Requirements
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blue.shade200),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password Requirements:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900,
                                ),
                              ),
                              SizedBox(height: 12),
                              _buildRequirementItem(
                                'Minimum 8 characters',
                                new_password.text.length >= 8,
                              ),
                              _buildRequirementItem(
                                'Contains at least one uppercase letter',
                                RegExp(r'[A-Z]').hasMatch(new_password.text),
                              ),
                              _buildRequirementItem(
                                'Contains at least one number',
                                RegExp(r'[0-9]').hasMatch(new_password.text),
                              ),
                              _buildRequirementItem(
                                'Contains at least one special character',
                                RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(new_password.text),
                              ),
                              _buildRequirementItem(
                                'Passwords match',
                                new_password.text.isNotEmpty &&
                                    new_password.text == confirm_password.text,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 25),

                        // Submit Button
                        Container(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : _changePassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade700,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 5,
                            ),
                            child: isLoading
                                ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text('Updating...'),
                              ],
                            )
                                : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.update, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Update Password',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Security Tips Card
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.security,
                            color: Colors.orange.shade700,
                            size: 24,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Password Security Tips:',
                              style: TextStyle(
                                color: Colors.orange.shade900,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      _buildTipItem('Use a mix of letters, numbers, and symbols'),
                      _buildTipItem('Avoid using personal information'),
                      _buildTipItem('Don\'t reuse passwords from other accounts'),
                      _buildTipItem('Change password regularly for better security'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required bool obscureText,
    required VoidCallback toggleObscure,
    String? errorText,
    required bool isValid,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.blue.shade700,
                size: 16,
              ),
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
            if (!isValid && errorText != null)
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.error,
                  color: Colors.red.shade400,
                  size: 16,
                ),
              ),
          ],
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: !isValid
                  ? Colors.red.shade400
                  : Colors.grey.shade300,
            ),
            color: Colors.grey.shade50,
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                onPressed: toggleObscure,
              ),
              errorText: !isValid ? errorText : null,
              errorStyle: TextStyle(fontSize: 12, color: Colors.red.shade400),
            ),
          ),
        ),
        if (!isValid && errorText != null)
          Padding(
            padding: EdgeInsets.only(top: 4, left: 12),
            child: Text(
              errorText,
              style: TextStyle(
                fontSize: 12,
                color: Colors.red.shade400,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRequirementItem(String text, bool met) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            child: Icon(
              met ? Icons.check_circle : Icons.radio_button_unchecked,
              color: met ? Colors.green : Colors.grey.shade400,
              size: 18,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: met ? Colors.green.shade700 : Colors.grey.shade600,
                fontWeight: met ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem(String tip) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(
            Icons.sip,
            size: 14,
            color: Colors.orange.shade700,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(
                fontSize: 12,
                color: Colors.orange.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _validateCurrentPassword(String value) {
    setState(() {
      if (value.isEmpty) {
        isCurrentPasswordValid = false;
        currentPasswordError = 'Current password is required';
      } else if (value.length < 6) {
        isCurrentPasswordValid = false;
        currentPasswordError = 'Password must be at least 6 characters';
      } else {
        isCurrentPasswordValid = true;
        currentPasswordError = null;
      }
    });
  }

  void _validateNewPassword(String value) {
    setState(() {
      if (value.isEmpty) {
        isNewPasswordValid = false;
        newPasswordError = 'New password is required';
      } else if (value.length < 8) {
        isNewPasswordValid = false;
        newPasswordError = 'Password must be at least 8 characters';
      } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
        isNewPasswordValid = false;
        newPasswordError = 'Include at least one uppercase letter';
      } else if (!RegExp(r'[0-9]').hasMatch(value)) {
        isNewPasswordValid = false;
        newPasswordError = 'Include at least one number';
      } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
        isNewPasswordValid = false;
        newPasswordError = 'Include at least one special character';
      } else {
        isNewPasswordValid = true;
        newPasswordError = null;
      }
    });
  }

  void _validateConfirmPassword(String value) {
    setState(() {
      if (value.isEmpty) {
        isConfirmPasswordValid = false;
        confirmPasswordError = 'Please confirm your password';
      } else if (value != new_password.text) {
        isConfirmPasswordValid = false;
        confirmPasswordError = 'Passwords do not match';
      } else {
        isConfirmPasswordValid = true;
        confirmPasswordError = null;
      }
    });
  }

  bool _validateAllFields() {
    _validateCurrentPassword(current_password.text);
    _validateNewPassword(new_password.text);
    _validateConfirmPassword(confirm_password.text);

    return isCurrentPasswordValid &&
        isNewPasswordValid &&
        isConfirmPasswordValid;
  }

  Future<void> _changePassword() async {
    // Validate all fields first
    if (!_validateAllFields()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fix all validation errors'),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    SharedPreferences sh = await SharedPreferences.getInstance();

    // Check current password
    if (sh.getString('password').toString() != current_password.text) {
      setState(() {
        isLoading = false;
        isCurrentPasswordValid = false;
        currentPasswordError = 'Current password is incorrect';
      });

      _showDialog(
        title: "Incorrect Password",
        content: "Current password is not correct",
        isError: true,
      );
      return;
    }

    // Check if new password is same as current password
    if (current_password.text == new_password.text) {
      setState(() {
        isLoading = false;
        isNewPasswordValid = false;
        newPasswordError = 'New password must be different from current password';
      });

      _showDialog(
        title: "Invalid Password",
        content: "New password must be different from current password",
        isError: true,
      );
      return;
    }

    try {
      var data = await htt.post(
          Uri.parse("${sh.getString("ip")}/user_change_password"),
          body: {
            "confirm_password": confirm_password.text,
            'uid': sh.getString('uid').toString()
          }
      );

      var decoded = json.decode(data.body);

      if (decoded['status'] == "ok") {
        setState(() {
          isLoading = false;
        });

        // Clear fields
        current_password.clear();
        new_password.clear();
        confirm_password.clear();

        _showDialog(
          title: "Success!",
          content: "Password changed successfully",
          isSuccess: true,
        );
      } else {
        setState(() {
          isLoading = false;
        });
        _showErrorSnackBar('Failed to change password. Please try again.');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _showErrorSnackBar('Network error. Please check your connection.');
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _showDialog({
    required String title,
    required String content,
    bool isError = false,
    bool isSuccess = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: isSuccess ? Colors.green.shade50 : Colors.red.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSuccess ? Icons.check_circle : Icons.error,
                color: isSuccess ? Colors.green : Colors.red,
                size: 50,
              ),
            ),
            SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (isSuccess) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => home()),
                        (route) => false
                );
              } else {
                Navigator.pop(context);
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue.shade700,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "OK",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
// import 'package:eample/user_home.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class complaint extends StatelessWidget {
//   const  complaint({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: complaintsub(),);
//   }
// }
// class complaintsub extends StatefulWidget {
//   const complaintsub({Key? key}) : super(key: key);
//
//   @override
//   State<complaintsub> createState() => _complaintsubState();
// }
//
// class _complaintsubState extends State<complaintsub> {
//   TextEditingController complaint=TextEditingController();
//   TextEditingController complaintdate=TextEditingController();
//   TextEditingController replay=TextEditingController();
//   TextEditingController replaydate=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Column(children: [
//       TextField(controller:complaint ,decoration:
//         InputDecoration(hintText:"enter complaint",border: OutlineInputBorder()),
//     ),
//       ElevatedButton(onPressed: ()async {
//         SharedPreferences sh = await SharedPreferences.getInstance();
//         var data = await http.post(Uri.parse("${sh.getString("ip")}/send_complaints"),
//             body: {"complaint": complaint.text,
//
//               "uid":sh.getString("uid").toString()
//             }
//         );
//         showDialog(context: context, builder: (context)=>AlertDialog(title:
//         Text("complaint"),content: Text("complaint sended"),actions: [
//           TextButton(onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
//           }, child: Text("ok"))
//         ],),);
//
//       },child: Text("Send"))
//
//     ])));
//   }
// }


import 'package:eample/user_home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class complaint extends StatelessWidget {
  const complaint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: complaintsub(),
    );
  }
}

class complaintsub extends StatefulWidget {
  const complaintsub({Key? key}) : super(key: key);

  @override
  State<complaintsub> createState() => _complaintsubState();
}

class _complaintsubState extends State<complaintsub> {
  TextEditingController complaint = TextEditingController();
  TextEditingController complaintdate = TextEditingController();
  TextEditingController replay = TextEditingController();
  TextEditingController replaydate = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Send Complaint',
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
                          Icons.report_problem,
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
                              'Submit Your Complaint',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'We value your feedback and will address your concerns promptly',
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

                // Complaint Input Card
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Label with icon
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.edit_note,
                                color: Colors.blue.shade700,
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Your Complaint',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 15),

                        // Complaint TextField
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.grey.shade50,
                          ),
                          child: TextField(
                            controller: complaint,
                            maxLines: 6,
                            decoration: InputDecoration(
                              hintText: "Please describe your complaint in detail...",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                        ),

                        SizedBox(height: 10),

                        // Character count (optional enhancement)
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '${complaint.text.length}/500',
                            style: TextStyle(
                              color: complaint.text.length > 500
                                  ? Colors.red
                                  : Colors.grey.shade500,
                              fontSize: 12,
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        // Additional Fields (keeping original controllers)
                        if (complaintdate.text.isNotEmpty || replay.text.isNotEmpty || replaydate.text.isNotEmpty)
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (complaintdate.text.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.calendar_today, size: 16, color: Colors.grey.shade600),
                                        SizedBox(width: 8),
                                        Text('Date: ${complaintdate.text}'),
                                      ],
                                    ),
                                  ),
                                if (replay.text.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.reply, size: 16, color: Colors.grey.shade600),
                                        SizedBox(width: 8),
                                        Expanded(child: Text('Reply: ${replay.text}')),
                                      ],
                                    ),
                                  ),
                                if (replaydate.text.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.update, size: 16, color: Colors.grey.shade600),
                                        SizedBox(width: 8),
                                        Text('Reply Date: ${replaydate.text}'),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),

                        SizedBox(height: 10),

                        // Send Button
                        Container(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : () async {
                              if (complaint.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please enter your complaint'),
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

                              try {
                                SharedPreferences sh = await SharedPreferences.getInstance();
                                var data = await http.post(
                                    Uri.parse("${sh.getString("ip")}/send_complaints"),
                                    body: {
                                      "complaint": complaint.text,
                                      "uid": sh.getString("uid").toString()
                                    }
                                );

                                setState(() {
                                  isLoading = false;
                                });

                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    title: Column(
                                      children: [
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: 50,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Complaint Sent",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    content: Text(
                                      "Your complaint has been submitted successfully",
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: (){
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(builder: (context) => home()),
                                                  (route) => false
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.blue.shade700,
                                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

                                complaint.clear();
                              } catch (e) {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Error sending complaint. Please try again.'),
                                    backgroundColor: Colors.red,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            },
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
                                Text('Sending...'),
                              ],
                            )
                                : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.send, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Send Complaint',
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

                // Help Card
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.blue.shade700,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Your complaint will be reviewed by our team and you will receive a response within 24-48 hours.',
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 12,
                          ),
                        ),
                      ),
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
}
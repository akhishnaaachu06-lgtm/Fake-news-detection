//
//
// import 'package:eample/user_home.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// class feedback extends StatelessWidget {
//   const feedback({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home:feedbacksub(),);
//   }
// }
// class feedbacksub extends StatefulWidget {
//   const feedbacksub({Key? key}) : super(key: key);
//
//   @override
//   State<feedbacksub> createState() => _feedbacksubState();
// }
//
// class _feedbacksubState extends State<feedbacksub> {
//   TextEditingController feedback=TextEditingController();
//   TextEditingController date=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Column(children: [
//       TextField(controller: feedback,decoration:
//     InputDecoration(hintText:"feedback",border: OutlineInputBorder()) ,
//     ),TextField(controller:date ,decoration:
//     InputDecoration(hintText:"date",border: OutlineInputBorder()),),
//       ElevatedButton(onPressed: ()async {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       var data = await http.post(Uri.parse("${sh.getString("ip")}/send_feedbacks"),
//           body: {"feedback": feedback.text,
//             "uid":sh.getString("uid").toString()}
//       );
//       showDialog(context: context, builder: (context)=>AlertDialog(title:
//       Text("feedback"),content: Text("feedback sended"),actions: [
//         TextButton(onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
//         }, child: Text("ok"))
//       ],),);
//     },child: Text("Send"))
//
//   ])));
//   }
// }
//




import 'package:eample/user_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class feedback extends StatelessWidget {
  const feedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: feedbacksub());
  }
}

class feedbacksub extends StatefulWidget {
  const feedbacksub({Key? key}) : super(key: key);

  @override
  State<feedbacksub> createState() => _feedbacksubState();
}

class _feedbacksubState extends State<feedbacksub> {
  TextEditingController feedback = TextEditingController();
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "feedback",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.grey[100]!, Colors.grey[300]!],
          ),
        ),
        child: Center(
          child: Container(
            width: 400,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Icon(
                    Icons.feedback,
                    size: 60,
                    color: Colors.orange,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Provide Your feedback",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    controller: feedback,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "feedback",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: date,
                    decoration: InputDecoration(
                      hintText: "date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.all(15),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      SharedPreferences sh = await SharedPreferences.getInstance();
                      var data = await http.post(
                        Uri.parse("${sh.getString("ip")}/send_feedbacks"),
                        body: {
                          "feedback": feedback.text,
                          "uid": sh.getString("uid").toString()
                        },
                      );
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("feedback"),
                          content: Text("feedback sended"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => home()),
                                );
                              },
                              child: Text("ok"),
                            )
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                    ),
                    child: Text(
                      "Send",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Enter your feedback and date to submit",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
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
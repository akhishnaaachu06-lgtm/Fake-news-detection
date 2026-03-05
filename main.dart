//
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'login.dart';
//
// void main(){
//   runApp(myapp());
// }
// class myapp extends StatelessWidget {
//   const myapp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home:myappsub(),);
//   }
// }
// class myappsub extends StatefulWidget {
//   const myappsub({Key? key}) : super(key: key);
//
//   @override
//   State<myappsub> createState() => _myappsubState();
// }
//
// class _myappsubState extends State<myappsub> {
//   TextEditingController name= TextEditingController(text:"192.168.29.253");
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body:Center(child:Column(children:
//     [TextField(controller:name,decoration:
//     InputDecoration(border: OutlineInputBorder()),
//     ),ElevatedButton(onPressed: ()async{
//     SharedPreferences sh=await SharedPreferences.getInstance();
//     sh.setString('ip', "http://${name.text}:8989");
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>logsub())
//       );
//     }, child: Text("Submit"))
//     ],),),);
//   }
// }



import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: myappsub());
  }
}

class myappsub extends StatefulWidget {
  const myappsub({Key? key}) : super(key: key);

  @override
  State<myappsub> createState() => _myappsubState();
}

class _myappsubState extends State<myappsub> {
  TextEditingController name = TextEditingController(text:"192.168.20.6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "IP Configuration",
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
                    Icons.settings_ethernet,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Enter Server IP Address",
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
                    controller: name,
                    decoration: InputDecoration(
                      hintText: "Enter IP address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.all(15),
                      prefixIcon: Icon(Icons.computer),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      SharedPreferences sh = await SharedPreferences.getInstance();
                      sh.setString('ip', "http://${name.text}:8989");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => logsub()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue, size: 20),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Default IP: 192.168.29.253",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Full URL: http://${name.text}:8989",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontFamily: 'Monospace',
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
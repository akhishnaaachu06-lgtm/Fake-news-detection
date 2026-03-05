// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class fake_news extends StatelessWidget {
//   const fake_news({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: fake_news_sub());
//   }
// }
//
// class fake_news_sub extends StatefulWidget {
//   const fake_news_sub({Key? key}) : super(key: key);
//
//   @override
//   State<fake_news_sub> createState() => _fake_news_subState();
// }
//
// class _fake_news_subState extends State<fake_news_sub> {
//   TextEditingController news = TextEditingController();
//
//   String prediction = "";
//   List newsList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     loadNews();
//   }
//
//   Future<void> loadNews() async {
//     SharedPreferences sh = await SharedPreferences.getInstance();
//
//     var response = await http.get(
//       Uri.parse("${sh.getString("ip")}/view_news?uid=${sh.getString("uid")}"),
//     );
//
//     var jsonData = json.decode(response.body);
//
//     setState(() {
//       newsList = jsonData["data"];
//     });
//   }
//
//   Future<void> sendNews() async {
//     SharedPreferences sh = await SharedPreferences.getInstance();
//
//     var response = await http.post(
//       Uri.parse("${sh.getString("ip")}/send_newss"),
//       body: {
//         "news": news.text,
//         "uid": sh.getString("uid").toString(),
//       },
//     );
//
//     var jsonData = json.decode(response.body);
//
//     setState(() {
//       prediction = jsonData["prediction"];
//       news.clear();
//     });
//
//     loadNews(); // refresh list
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Fake News Detection')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(15),
//               child: TextField(
//                 controller: news,
//                 maxLines: 4,
//                 decoration: InputDecoration(
//                   hintText: "Enter News",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//
//             ElevatedButton(
//               onPressed: sendNews,
//               child: Text("Send"),
//             ),
//
//             SizedBox(height: 10),
//
//             Text(
//               prediction == "" ? "" : "Result: $prediction",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//
//             Divider(),
//
//             Text(
//               "Your News History",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: newsList.length,
//               itemBuilder: (context, index) {
//                 var item = newsList[index];
//
//                 return Card(
//                   margin: EdgeInsets.all(10),
//                   child: ListTile(
//                     title: Text(item["news"]),
//                     subtitle: Text(item["date"]),
//                     trailing: Text(
//                       item["status"],
//                       style: TextStyle(
//                         color: item["status"] == "fake"
//                             ? Colors.red
//                             : Colors.green,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class fake_news extends StatelessWidget {
  const fake_news({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: fake_news_sub(),
    );
  }
}

class fake_news_sub extends StatefulWidget {
  const fake_news_sub({Key? key}) : super(key: key);

  @override
  State<fake_news_sub> createState() => _fake_news_subState();
}

class _fake_news_subState extends State<fake_news_sub> {
  TextEditingController news = TextEditingController();

  String prediction = "";
  List newsList = [];

  @override
  void initState() {
    super.initState();
    loadNews();
  }

  Future<void> loadNews() async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    var response = await http.get(
      Uri.parse("${sh.getString("ip")}/view_news?uid=${sh.getString("uid")}"),
    );

    var jsonData = json.decode(response.body);

    setState(() {
      newsList = jsonData["data"];
    });
  }

  Future<void> sendNews() async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    var response = await http.post(
      Uri.parse("${sh.getString("ip")}/send_newss"),
      body: {
        "news": news.text,
        "uid": sh.getString("uid").toString(),
      },
    );

    var jsonData = json.decode(response.body);

    setState(() {
      prediction = jsonData["prediction"];
      news.clear();
    });

    loadNews(); // refresh list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fake News Detection',
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade700, Colors.blue.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Input Card
                Card(
                  elevation: 8,
                  shadowColor: Colors.blue.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.newspaper, color: Colors.blue.shade700),
                            SizedBox(width: 8),
                            Text(
                              "Enter News Article",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: TextField(
                            controller: news,
                            maxLines: 6,
                            decoration: InputDecoration(
                              hintText: "Paste or type news content here...",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: sendNews,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade700,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.send, size: 20),
                              SizedBox(width: 8),
                              Text(
                                "Send",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Prediction Result
                if (prediction != "")
                  Card(
                    elevation: 4,
                    color: prediction == "fake"
                        ? Colors.red.shade50
                        : Colors.green.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: prediction == "fake"
                            ? Colors.red.shade200
                            : Colors.green.shade200,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(
                            prediction == "fake"
                                ? Icons.warning_amber_rounded
                                : Icons.check_circle,
                            color: prediction == "fake"
                                ? Colors.red.shade700
                                : Colors.green.shade700,
                            size: 28,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Detection Result:",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                Text(
                                  prediction == "fake"
                                      ? "This appears to be fake news"
                                      : "This appears to be real news",
                                  style: TextStyle(
                                    fontSize: 18,
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
                      ),
                    ),
                  ),

                if (prediction != "") SizedBox(height: 20),

                // History Header
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Row(
                    children: [
                      Icon(Icons.history, color: Colors.blue.shade700),
                      SizedBox(width: 8),
                      Text(
                        "Your News History",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),

                // News List
                if (newsList.isEmpty)
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Icon(
                          Icons.history_toggle_off,
                          size: 80,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "No news history yet",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          "Submit your first news article above",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      var item = newsList[index];

                      return Card(
                        margin: EdgeInsets.only(bottom: 12),
                        elevation: 3,
                        shadowColor: (item["status"] == "fake"
                            ? Colors.red
                            : Colors.green)
                            .withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: (item["status"] == "fake"
                                ? Colors.red
                                : Colors.green)
                                .withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                (item["status"] == "fake"
                                    ? Colors.red
                                    : Colors.green)
                                    .withOpacity(0.02),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(16),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (item["status"] == "fake"
                                    ? Colors.red
                                    : Colors.green)
                                    .withOpacity(0.1),
                              ),
                              child: Icon(
                                item["status"] == "fake"
                                    ? Icons.warning
                                    : Icons.verified,
                                color: item["status"] == "fake"
                                    ? Colors.red.shade700
                                    : Colors.green.shade700,
                                size: 28,
                              ),
                            ),
                            title: Text(
                              item["news"],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 14,
                                    color: Colors.grey.shade500,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    item["date"],
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: (item["status"] == "fake"
                                    ? Colors.red
                                    : Colors.green)
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: (item["status"] == "fake"
                                      ? Colors.red
                                      : Colors.green)
                                      .withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                item["status"].toUpperCase(),
                                style: TextStyle(
                                  color: item["status"] == "fake"
                                      ? Colors.red.shade700
                                      : Colors.green.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
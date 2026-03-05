import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class url extends StatelessWidget {
  const url({Key? key}) : super(key: key);

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
      home: url_sub(),
    );
  }
}

class url_sub extends StatefulWidget {
  const url_sub({Key? key}) : super(key: key);

  @override
  State<url_sub> createState() => _url_subState();
}

class _url_subState extends State<url_sub> {
  TextEditingController news = TextEditingController();

  String prediction = "";
  // history removed: no local news list maintained in this screen
  String reason = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  // news history loading removed

  Future<void> sendNews() async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    // Basic URL normalization: if scheme missing, add http://
    String urlText = news.text.trim();
    if (urlText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter a URL')));
      return;
    }
    if (!urlText.startsWith('http://') && !urlText.startsWith('https://')) {
      urlText = 'http://' + urlText;
    }

    setState(() {
      isLoading = true;
      reason = "";
    });

    try {
      var response = await http.post(
        Uri.parse("${sh.getString("ip")}/check_news_url"),
        body: {
          "news_url": urlText,
          "uid": sh.getString("uid").toString(),
        },
      );

      var jsonData = json.decode(response.body);

      if (jsonData["status"] == "ok") {
        setState(() {
          prediction = jsonData["prediction"] ?? "";

          // Try to extract a concise reason from the raw model output if available
          String raw = jsonData["raw"] ?? "";
          RegExp re = RegExp(r"Reason:\s*(.*)", multiLine: true, caseSensitive: false);
          var m = re.firstMatch(raw);
          if (m != null) {
            reason = m.group(1)!.trim();
          } else {
            reason = "";
          }

          news.clear();
        });
      } else {
        String msg = jsonData["message"] ?? "Server returned an error";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
      }
    } catch (e) {
      print('sendNews error: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Network or parsing error')));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
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
                            Icon(Icons.link, color: Colors.blue.shade700),
                            SizedBox(width: 8),
                            Text(
                              "Enter URL to Check",
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
                            keyboardType: TextInputType.url,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: "Paste or type URL here...",
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
                          onPressed: isLoading ? null : sendNews,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade700,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 5,
                          ),
                          child: isLoading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Row(
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
                                  "Analysis:",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                Text(
                                  prediction == "fake"
                                      ? "This URL appears to be fake"
                                      : "This URL appears to be real",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: prediction == "fake"
                                        ? Colors.red.shade700
                                        : Colors.green.shade700,
                                  ),
                                ),
                                if (reason != "") SizedBox(height: 8),
                                if (reason != "")
                                  Text(
                                    reason,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade700,
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

                // News history removed from this screen.
              ],
            ),
          ),
        ),
      ),
    );
  }
}



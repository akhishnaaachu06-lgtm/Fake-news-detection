
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class view_all_news extends StatelessWidget {
//   const view_all_news({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: view_all_newssub());
//   }
// }
//
// class view_all_newssub extends StatefulWidget {
//   const view_all_newssub({Key? key}) : super(key: key);
//
//   @override
//   State<view_all_newssub> createState() => _view_all_newssubState();
// }
//
// class _view_all_newssubState extends State<view_all_newssub> {
//
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//
//     var data = await http.post(
//       Uri.parse(prefs.getString("ip").toString() + "/view_newss"),
//       body: {"id": b},
//     );
//
//     var jsonData = json.decode(data.body);
//     List<Joke> jokes = [];
//
//     for (var joke in jsonData["data"]) {
//       Joke newJoke = Joke(
//         joke["id"].toString(),
//         joke["title"].toString(),
//         joke["newss"].toString(),
//         joke["image"].toString(),
//         joke["video"].toString(),
//         joke["date"].toString(),
//         joke["status"].toString(),
//       );
//       jokes.add(newJoke);
//     }
//     return jokes;
//   }
//
//   Future<void> _launchVideo(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("news"),
//       ),
//       body: FutureBuilder(
//         future: _getJokes(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: Text("Loading..."));
//           }
//
//           return ListView.builder(
//             itemCount: snapshot.data.length,
//             itemBuilder: (BuildContext context, int index) {
//               var i = snapshot.data[index];
//
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Card(
//                   elevation: 3,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     side: BorderSide(color: Colors.grey.shade300),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//
//                         _buildRow("Title:", i.title),
//                         _buildRow("News:", i.newss),
//
//                         // IMAGE
//                         if (i.image.isNotEmpty)
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.network(
//                                 i.image,
//                                 height: 180,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Text("Image not available");
//                                 },
//                               ),
//                             ),
//                           ),
//
//                         // VIDEO
//                         if (i.video.isNotEmpty)
//                           TextButton.icon(
//                             onPressed: () {
//                               _launchVideo(i.video);
//                             },
//                             icon: Icon(Icons.play_circle_fill),
//                             label: Text("Watch Video"),
//                           ),
//
//                         _buildRow("Date:", i.date),
//                         _buildRow("Status:", i.status),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => view_all_news()),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(width: 5),
//           Expanded(
//             child: Text(
//               value,
//               style: TextStyle(color: Colors.grey.shade800),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Joke {
//   final String id;
//   final String title;
//   final String newss;
//   final String image;
//   final String video;
//   final String date;
//   final String status;
//
//   Joke(
//       this.id,
//       this.title,
//       this.newss,
//       this.image,
//       this.video,
//       this.date,
//       this.status,
//       );
// }

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class view_all_news extends StatelessWidget {
  const view_all_news({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: view_all_newssub(),
    );
  }
}

class view_all_newssub extends StatefulWidget {
  const view_all_newssub({Key? key}) : super(key: key);

  @override
  State<view_all_newssub> createState() => _view_all_newssubState();
}

class _view_all_newssubState extends State<view_all_newssub> {

  // Fixed: Changed from Joke to News for better naming
  Future<List<News>> _getNews() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String b = prefs.getString("lid").toString();

      var data = await http.post(
        Uri.parse(prefs.getString("ip").toString() + "/view_newss"),
        body: {"id": b},
      ).timeout(Duration(seconds: 10));

      var jsonData = json.decode(data.body);
      List<News> newsList = [];

      for (var news in jsonData["data"]) {
        News newNews = News(
          news["id"].toString(),
          news["title"].toString(),
          news["newss"].toString(),
          prefs.getString('ip').toString()+news["image"].toString(),
          news["video"].toString(),
          news["date"].toString(),
          news["status"].toString(),
        );
        newsList.add(newNews);
      }
      return newsList;
    } catch (e) {
      // Fixed: Added error handling
      throw Exception('Failed to load news: $e');
    }
  }

  // Fixed: Updated to use the new launchUrl method
  Future<void> _launchVideo(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // Fixed: Show error if can't launch
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch video'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error launching video'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All News",
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
        child: FutureBuilder(
          future: _getNews(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade700),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Loading news...",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 60,
                      color: Colors.red.shade400,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Error loading news",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Please try again later",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {}); // Refresh
                      },
                      child: Text("Retry"),
                    ),
                  ],
                ),
              );
            }

            if (!snapshot.hasData || snapshot.data.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.newspaper,
                      size: 80,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "No News Available",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Check back later for updates",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var news = snapshot.data[index];

                // Determine status color
                Color statusColor = news.status.toLowerCase() == "fake"
                    ? Colors.red
                    : news.status.toLowerCase() == "real"
                    ? Colors.green
                    : Colors.orange;

                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Card(
                    elevation: 4,
                    shadowColor: statusColor.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Colors.white, statusColor.withOpacity(0.02)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header with ID and Status
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    "#${news.id}",
                                    style: TextStyle(
                                      color: Colors.blue.shade800,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: statusColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: statusColor.withOpacity(0.3),
                                    ),
                                  ),
                                  child: Text(
                                    news.status.toUpperCase(),
                                    style: TextStyle(
                                      color: statusColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 15),

                            // Title
                            _buildInfoRow(
                              icon: Icons.title,
                              label: "Title:",
                              value: news.title,
                              isTitle: true,
                            ),

                            SizedBox(height: 12),

                            // News Content
                            _buildInfoRow(
                              icon: Icons.description,
                              label: "News:",
                              value: news.newss,
                              isMultiline: true,
                            ),

                            // IMAGE
                            if (news.image.isNotEmpty) ...[
                              SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    news.image,
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        height: 200,
                                        color: Colors.grey.shade200,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 200,
                                        color: Colors.grey.shade200,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.broken_image,
                                              size: 50,
                                              color: Colors.grey.shade400,
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              "Image not available",
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],

                            // VIDEO
                            if (news.video.isNotEmpty) ...[
                              SizedBox(height: 15),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () => _launchVideo(news.video),
                                  icon: Icon(Icons.play_circle_fill, color: Colors.white),
                                  label: Text(
                                    "Watch Video",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red.shade700,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ],

                            SizedBox(height: 15),

                            // Date
                            _buildInfoRow(
                              icon: Icons.calendar_today,
                              label: "Date:",
                              value: news.date,
                            ),

                            SizedBox(height: 4),

                            // Divider
                            Divider(
                              height: 20,
                              thickness: 1,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      // Fixed: Changed floating action button to navigate back properly
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => view_all_newssub()),
          );
        },
        icon: Icon(Icons.refresh),
        label: Text("Refresh"),
        backgroundColor: Colors.blue.shade700,
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    bool isTitle = false,
    bool isMultiline = false,
  }) {
    return Row(
      crossAxisAlignment: isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Container(
          width: 30,
          child: Icon(
            icon,
            size: 18,
            color: Colors.blue.shade700,
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 70,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: isTitle ? 16 : 14,
              fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
              color: isTitle ? Colors.blue.shade900 : Colors.grey.shade800,
              height: isMultiline ? 1.4 : null,
            ),
            maxLines: isMultiline ? 5 : 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// Fixed: Renamed from Joke to News for better clarity
class News {
  final String id;
  final String title;
  final String newss;
  final String image;
  final String video;
  final String date;
  final String status;

  News(
      this.id,
      this.title,
      this.newss,
      this.image,
      this.video,
      this.date,
      this.status,
      );
}
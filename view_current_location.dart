// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// class view_current_location extends StatelessWidget {
//   const view_current_location({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: view_current_locationsub(),);
//   }
// }
// class view_current_locationsub extends StatefulWidget {
//   const view_current_locationsub ({Key? key}) : super(key: key);
//
//   @override
//   State<view_current_locationsub> createState() => _view_current_locationsubState();
// }
//
// class _view_current_locationsubState extends State<view_current_locationsub> {
//   Future<List<Joke>> _getJokes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String b = prefs.getString("lid").toString();
//     String foodimage = "";
//     var data =
//     await http.post(
//         Uri.parse(prefs.getString("ip").toString() + "/view_areasss"),
//         body: {"id": b}
//     );
//
//     var jsonData = json.decode(data.body);
// //    print(jsonData);
//     List<Joke> jokes = [];
//     for (var joke in jsonData["message"]) {
//       print(joke);
//       Joke newJoke = Joke(
//           joke["id"].toString(),
//           joke["district"],
//           joke["areas"].toString(),
//           joke["latitude"].toString(),
//           joke["longitude"].toString()
//
//       );
//       jokes.add(newJoke);
//     }
//     return jokes;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//         title: Text("location"),
//       ),
//       body:
//
//
//       Container(
//
//         child:
//         FutureBuilder(
//           future: _getJokes(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
// //              print("snapshot"+snapshot.toString());
//             if (snapshot.data == null) {
//               return Container(
//                 child: Center(
//                   child: Text("Loading..."),
//                 ),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   var i = snapshot.data![index];
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       elevation: 3,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         side: BorderSide(color: Colors.grey.shade300),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//
//                             SizedBox(height: 10),
//                             _buildRow("District:", i.district.toString()),
//                             _buildRow("Area:", i.areas.toString()),
//                             _buildRow("Latitude:", i.latitude.toString()),
//                             _buildRow("Longitude:", i.longitude.toString()),
//
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//
//
//         ),
//
//
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(
//               builder: (context) =>
//                   view_current_location(
//                   )));
//         },
//
//       ),
//     );
//   }
//
//   Widget _buildRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 100,
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(width: 5),
//           Flexible(
//             child: Text(
//               value,
//               style: TextStyle(
//                 color: Colors.grey.shade800,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class Joke {
//   final String id;
//   final String district;
//
//   final String areas;
//   final String latitude;
//   final String longitude;
//
//
//
//
//   Joke(this.id, this.district, this.areas, this.latitude,
//       this.longitude);
//   //  print("hiiiii");
// }
//



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class view_current_location extends StatelessWidget {
  const view_current_location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: view_current_locationsub(),
    );
  }
}

class view_current_locationsub extends StatefulWidget {
  const view_current_locationsub({Key? key}) : super(key: key);

  @override
  State<view_current_locationsub> createState() => _view_current_locationsubState();
}

class _view_current_locationsubState extends State<view_current_locationsub> {
  // Fixed: Renamed for better clarity
  Future<List<Location>> _getLocations() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String b = prefs.getString("lid").toString();

      var data = await http.post(
          Uri.parse(prefs.getString("ip").toString() + "/view_areasss"),
          body: {"id": b}
      ).timeout(Duration(seconds: 10));

      var jsonData = json.decode(data.body);
      List<Location> locations = [];

      for (var location in jsonData["message"]) {
        Location newLocation = Location(
            location["id"].toString(),
            location["district"],
            location["areas"].toString(),
            location["latitude"].toString(),
            location["longitude"].toString()
        );
        locations.add(newLocation);
      }
      return locations;
    } catch (e) {
      throw Exception('Failed to load locations: $e');
    }
  }

  // Added: Function to open location in maps
  Future<void> _openInMaps(String latitude, String longitude, String area) async {
    try {
      final Uri googleMapsUri = Uri.parse(
          "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude"
      );

      if (await canLaunchUrl(googleMapsUri)) {
        await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not open maps'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error opening maps'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Current Location",
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
          future: _getLocations(),
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
                      "Loading locations...",
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
                      "Error loading locations",
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
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
                      Icons.location_off,
                      size: 80,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "No Locations Found",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "No location data available",
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
              padding: EdgeInsets.all(16),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var location = snapshot.data[index];

                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.blue.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.blue.shade50],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header with ID
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
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 14,
                                        color: Colors.blue.shade800,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "ID: ${location.id}",
                                        style: TextStyle(
                                          color: Colors.blue.shade800,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.location_city,
                                    color: Colors.blue.shade700,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 20),

                            // Location Details
                            _buildInfoRow(
                              icon: Icons.map,
                              label: "District:",
                              value: location.district.toString(),
                            ),

                            SizedBox(height: 12),

                            _buildInfoRow(
                              icon: Icons.place,
                              label: "Area:",
                              value: location.areas.toString(),
                            ),

                            SizedBox(height: 12),

                            _buildInfoRow(
                              icon: Icons.pin_drop,
                              label: "Latitude:",
                              value: location.latitude.toString(),
                            ),

                            SizedBox(height: 12),

                            _buildInfoRow(
                              icon: Icons.pin_drop,
                              label: "Longitude:",
                              value: location.longitude.toString(),
                            ),

                            SizedBox(height: 20),

                            // Map Preview (visual representation)
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue.shade100,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://maps.googleapis.com/maps/api/staticmap?center=${location.latitude},${location.longitude}&zoom=14&size=400x150&markers=color:red%7C${location.latitude},${location.longitude}&key=YOUR_API_KEY"
                                  ),
                                  fit: BoxFit.cover,
                                  onError: (exception, stackTrace) {
                                    // Fallback if image fails
                                  },
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    "📍 ${location.areas}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 16),

                            // Action Buttons
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () => _openInMaps(
                                      location.latitude,
                                      location.longitude,
                                      location.areas,
                                    ),
                                    icon: Icon(Icons.map, size: 18),
                                    label: Text("View in Maps"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue.shade700,
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 8),

                            // Coordinates Display
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "LAT",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      Text(
                                        location.latitude,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade800,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 20,
                                    width: 1,
                                    color: Colors.grey.shade400,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "LNG",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      Text(
                                        location.longitude,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade800,
                                        ),
                                      ),
                                    ],
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
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {}); // Refresh instead of navigating to same page
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
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          width: 80,
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
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade900,
            ),
          ),
        ),
      ],
    );
  }
}

// Fixed: Renamed from Joke to Location for better clarity
class Location {
  final String id;
  final String district;
  final String areas;
  final String latitude;
  final String longitude;

  Location(this.id, this.district, this.areas, this.latitude, this.longitude);
}
import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/flutter_earth_globe_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late FlutterEarthGlobeController _controller;
  bool _isLoading = false;
  final _searchCountry = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = FlutterEarthGlobeController(
        rotationSpeed: 0.05,
        isBackgroundFollowingSphereRotation: true,
        surface: Image.asset('assets/images/earth2.jpg').image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Travel Assistant",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.close_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.white,
                    controller: _searchCountry,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        prefixIcon: Container(
                          margin: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        hintText: "search...",
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 195, 194, 194),
                            fontWeight: FontWeight.normal),
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                        fillColor: const Color.fromARGB(255, 34, 36, 46),
                        filled: true),
                  ),
                  const SizedBox(height: 50,),
                  const Text("Where are you travelling to?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const Text("Project your spending with our AI assistant.",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(100)),
                    child: FlutterEarthGlobe(
                      controller: _controller,
                      radius: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            )),
                        child: const Text(
                          "Continue",
                          style: TextStyle(fontSize: 16),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget getInsights(String country) {
  //   _isLoading = true;

  //   if (country == "Japan") {
  //     return Center(
  //       child: SizedBox(
  //         child: Container(
  //           height: MediaQuery.of(context).size.height * 0.13,
  //           decoration: const BoxDecoration(
  //               color: Color.fromARGB(255, 34, 36, 46),
  //               borderRadius: BorderRadius.all(Radius.circular(15.0))),
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //             child: Center(
  //               child: Column(
  //                 children: [
  //                   Align(
  //                     alignment: Alignment.centerLeft,
  //                     child: Text(
  //                       titleText,
  //                       style: const TextStyle(
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                   Text(descriptionText,
  //                       style: const TextStyle(
  //                         color: Colors.white,
  //                       ))
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }

  Widget howItWorks(String titleText, String descriptionText) {
    return Center(
      child: SizedBox(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.13,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 34, 36, 46),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      titleText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(descriptionText,
                      style: const TextStyle(
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

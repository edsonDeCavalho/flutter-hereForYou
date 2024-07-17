// ignore_for_file: must_be_immutable

//import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:here_for_u/style/all_style.dart';
import '../../style/components/all_components.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class SafePlacesScreen extends StatefulWidget {
  const SafePlacesScreen({super.key});

  @override
  State<SafePlacesScreen> createState() => _SafePlacesScreenState();
}

class _SafePlacesScreenState extends State<SafePlacesScreen> {
  late GoogleMapController mapController;
  late LatLng _currentPosition;
  bool _isLoading = true;
  //final LatLng _initialcameraposition = const LatLng(48.89592772198654, 2.459616030934039);

  @override
  void initState() {
    super.initState();
    // Safe Places
    filteredSafePlaces = safePlaces;

    // GOOGLE MAPS
    getLocation();
  }

  getLocation() async {
    // LocationPermission permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    if (kDebugMode) {
      print("location: $location");
      print("locationLongitude: $long");
    }
    setState(() {
      _currentPosition = location;
      _isLoading = false;
      isLocationEnabled = true;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    // _location.onLocationChanged.listen((l) {
    //   mapController.animateCamera(
    //     CameraUpdate.newCameraPosition(
    //       CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 15),
    //       ),
    //   );
    // });
  }

  List<SafePlace> safePlaces = [
    SafePlace(
      image: "images/safePlaces/Ellipse3.png",
      name: "Médiathèque Pierre",
      distance: "570",
      minute: "5",
    ),
    SafePlace(
      image: "images/safePlaces/Ellipse1.png",
      name: "Ministère de l'Intérieur",
      distance: "570",
      minute: "5",
    ),
    SafePlace(
      image: "images/safePlaces/Ellipse2.png",
      name: "Hôpital Max Fourestier",
      distance: "570",
      minute: "5",
    ),
    SafePlace(
      image: "images/safePlaces/Ellipse3.png",
      name: "Pharmacie de la Préfecture",
      distance: "570",
      minute: "5",
    ),
    SafePlace(
      image: "images/safePlaces/Ellipse1.png",
      name: "Préfecture des Hauts-de-Seine",
      distance: "570",
      minute: "5",
    ),
    SafePlace(
      image: "images/safePlaces/Ellipse2.png",
      name: "Police Nationale",
      distance: "570",
      minute: "5",
    ),
    SafePlace(
      image: "images/safePlaces/Ellipse3.png",
      name: "Gendarmerie",
      distance: "570",
      minute: "5",
    ),
    SafePlace(
      image: "images/safePlaces/Ellipse1.png",
      name: "Pompiers",
      distance: "570",
      minute: "5",
    ),
    SafePlace(
      image: "images/safePlaces/Ellipse2.png",
      name: "Médiathèque Pierre",
      distance: "570",
      minute: "5",
    ),
    SafePlace(
      image: "images/safePlaces/Ellipse3.png",
      name: "Ministère de l'Intérieur",
      distance: "40",
      minute: "15",
    ),
    SafePlace(
      image: "images/safePlaces/Ellipse1.png",
      name: "Hôpital Max Fourestier",
      distance: "490",
      minute: "5",
    ),
    SafePlace(
      image: "images/safePlaces/Ellipse2.png",
      name: "Pharmacie de la Préfecture",
      distance: "320",
      minute: "7",
    ),
  ];
  // ignore: unused_field
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );
  List<SafePlace> filteredSafePlaces = [];
  bool showSafePlaces = false;

  bool isLocationEnabled = false;
  // @override
  // void initState() {
  //   super.initState();
  //   filteredSafePlaces = safePlaces;
  // }

  void filtersafePlaces(String query) {
    setState(() {
      filteredSafePlaces = safePlaces
          .where((safePlace) =>
              safePlace.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (kDebugMode) {
    //   print("Current Location --------> ${currentLatLng.latitude} ${currentLatLng.longitude}");
    // }
    return Scaffold(
      appBar: TopPage(
        pageName: "Safe Places",
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: Column(children: [
                    MySearchBar(
                      hintText: "Rechercher",
                      onChanged: (query) {
                        filtersafePlaces(query);
                      },
                      minHeight: 40,
                    ),
                  ])),
              //       Text(
              //   "LAT: ${currentLatLng.latitude}, LNG: $currentLatLng.longitude}"
              // ),
              const SizedBox(height: 20),
              SizedBox(
                height: 460,
                child:
                    //currentLatLng == null ? const Center(child:CircularProgressIndicator()) :

                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : GoogleMap(
                            initialCameraPosition: CameraPosition(
                              //target: _initialcameraposition,
                              target: _currentPosition,
                              zoom: 15.0,
                            ),

                            mapType: MapType.normal,
                            onMapCreated: _onMapCreated,
                            //myLocationEnabled: true,
                            mapToolbarEnabled: false,
                            myLocationEnabled: isLocationEnabled,
                            myLocationButtonEnabled: true,
                            markers: {
                              Marker(
                                markerId: const MarkerId("marker1"),
                                position: const LatLng(37.422131, -122.084801),
                                draggable: true,
                                onDragEnd: (value) {
                                  // value is the new position
                                },
                                // To do: custom marker icon
                              ),
                              const Marker(
                                markerId: MarkerId("marker2"),
                                position: LatLng(
                                    37.415768808487435, -122.08440050482749),
                              ),
                            },
                          ),
              ),
            ],
          )),
          Positioned.fill(
            //bottom: 0,
            child: _getDraggableScrollableSheet(),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  _getDraggableScrollableSheet() {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        minChildSize: filteredSafePlaces.isEmpty ? 0.15 : 0.18,
        maxChildSize: filteredSafePlaces.isEmpty ? 0.16 : 0.75,
        //maxChildSize: 0.9,
        initialChildSize: filteredSafePlaces.isEmpty ? 0.15 : 0.25,
        expand: false,
        builder: (context, scrollController) {
          // return Container(
          //     width: double.infinity,
          //     padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          //     decoration: const BoxDecoration(
          //       borderRadius: BorderRadius.only(
          //         topRight: Radius.circular(30.0),
          //         topLeft: Radius.circular(30.0),
          //       ),
          //       color: AppColor.backgroundBlue,
          //     ),
          //     child: Column(
          //       children: [
          //         const SizedBox(height: 20),
          //         Row(
          //           children: [
          //             const Spacer(),
          //             Container(
          //               height: 5,
          //               width: 70,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(15.0),
          //                 color: AppColor.gray,
          //               ),
          //             ),
          //             const Spacer(),
          //           ],
          //         ),
          //         const SizedBox(height: 20),
          //         Expanded(
          //             child:
          //                 //DaysList(controller: scrollController),
          //                 filteredSafePlaces.isEmpty
          //                     ? ListView.builder(
          //                         controller:
          //                             scrollController, // assign controller here
          //                         itemCount: 1,
          //                         itemBuilder: (context, index) {
          //                           return const Center(
          //                               child: Text("Aucun résultat"));
          //                         }
          //                         //=> ListTile(title: Text("Item $index")),
          //                         )
          //                     //const Center(child: Text("Aucun résultat"))
          //                     : ListView.builder(
          //                         controller:
          //                             scrollController, // assign controller here
          //                         itemCount: filteredSafePlaces.length,
          //                         itemBuilder: (context, index) {
          //                           return GestureDetector(
          //                             onTap: () {},
          //                             child:
          //                                 // filtersafePlaces == null
          //                                 // ? const Text("Veuillez modifier votre recherche")
          //                                 // filteredSafePlaces.isEmpty
          //                                 //     ? const Center(child: Text("Aucun résultat"))
          //                                 // :
          //                                 SafePlaceBlock(
          //                                     safePlace:
          //                                         filteredSafePlaces[index])
          //                             // SafePlaceBlock( safePlace: filteredSafePlaces[index])
          //                             ,
          //                           );
          //                         }
          //                         //=> ListTile(title: Text("Item $index")),
          //                         ))
          //       ],
          //     ));

          // SingleChildScrollView(
          //   controller: scrollController,
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: filteredSafePlaces.length,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         onTap: () {},
          //         child: SafePlaceBlock(
          //             safePlace: filteredSafePlaces[index]),
          //       );
          //     },
          //   ),
          // )

          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
                color: AppColor.backgroundBlue,
                //color: Color.fromARGB(255, 12, 175, 229),
                //color: AppColor.backgroundBlue,
              ),
              child: Column(children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      height: 5,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColor.gray,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 8),
                filteredSafePlaces.isEmpty
                    ? ConstrainedBox(
                        constraints: const BoxConstraints(minHeight: 70),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return const Expanded(
                                  child: Center(child: Text("Aucun résultat")));
                              //const Center(child: Text("Aucun résultat"));
                            }),
                      )

                    // ListView.builder(
                    //     shrinkWrap: true,
                    //     itemCount: 1,
                    //     itemBuilder: (context, index) {
                    //       return Column(
                    //         children: const [
                    //           Spacer(),
                    //           Center(child: Text("Aucun résultat")),
                    //           Spacer(),
                    //         ],
                    //       );
                    //       //const Center(child: Text("Aucun résultat"));
                    //     })

                    // ListView.builder(
                    //     shrinkWrap: true,
                    //     itemCount: 1,
                    //     itemBuilder: (context, index) {
                    //       return const Expanded(
                    //           child: Center(child: Text("Aucun résultat")));
                    //       //const Center(child: Text("Aucun résultat"));
                    //     })
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredSafePlaces.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: SafePlaceBlock(
                                safePlace: filteredSafePlaces[index]),
                          );
                        },
                      ),
              ]),
            ),
          );
        },
      ),
    );
  }
}

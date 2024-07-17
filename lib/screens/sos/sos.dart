import 'package:flutter/material.dart';
//import 'package:here_for_u/style/all_style.dart';
//import '../../style/all_style.dart';
import '../../style/all_style.dart';
import '../../style/components/all_components.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SosScreen extends StatefulWidget {
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => SosScreenState();
}

class SosScreenState extends State<SosScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopPage(
        pageName: "Urgence",
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      //color: const Color.fromARGB(255, 184, 16, 16),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Vous êtes en direction vers un safe place",
                              style: TextStyle(
                                color: AppColor.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: GoButton(
                                text: "Je suis en sécurité",
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                minHeight: 40,
                                elevation: 0.0,
                                foreground: AppColor.white,
                                background: AppColor.primary3,
                                borderSide: 0,
                                colorSide: AppColor.primary3,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}

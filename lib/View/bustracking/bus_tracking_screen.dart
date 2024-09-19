import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/common_appbar.dart';
import 'package:caringio_student/hooks/commonWidgets/shadow_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusTrackingScreen extends StatefulWidget {
  const BusTrackingScreen({super.key});
  static String routeName = "/bus_tracking";
  @override
  State<BusTrackingScreen> createState() => _BusTrackingScreenState();
}

class _BusTrackingScreenState extends State<BusTrackingScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();
  Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(37.4219999, -122.0840575),
      infoWindow: InfoWindow(
        title: 'Marker 1',
        snippet: 'This is marker 1',
      ),
    ),
    // Add more markers as needed
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: gradientAppBar(
          leadingWidget: const Icon(
            Icons.arrow_back,
            color: kTextWhite,
          ),
          leadingonpress: () {
            Navigator.pop(context);
          },
          text: "Bus Tracking",
          // leadingWidget: const Icon(
          //   Icons.menu,
          //   color: kTextWhite,
          //   size: 24,
          // ),
          // leadingonpress: () {
          //   scaffoldKey.currentState!.openDrawer();
          // },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadowContainer2(
                    margin: EdgeInsets.all(10.w),
                    borderRadius: 20,
                    childwidget: GoogleMap(
                      zoomControlsEnabled: true,
                      markers: _markers,
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(
                            37.4219999, -122.0840575), // Set initial position
                        zoom: 14, // Set initial zoom level
                      ),
                    ),
                    width: double.infinity,
                    height: 0.6.sw),
                kheight20,
                Center(child: Image.asset("assets/png/Bus tracking.png"))
              ],
            ),
          ),
        ));
  }
}

List<Step> steps = [
  const Step(
    title: Text('Step 1'),
    content: Text('Hello!'),
    isActive: true,
  ),
  const Step(
    title: Text('Step 2'),
    content: Text('World!'),
    isActive: true,
  ),
  const Step(
    title: Text('Step 3'),
    content: Text('Hello World!'),
    state: StepState.complete,
    isActive: false,
  ),
];

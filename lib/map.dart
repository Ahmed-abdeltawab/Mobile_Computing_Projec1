import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _myController = MapController(initMapWithUserPosition: true);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OSMFlutter(
        controller: _myController,
        mapIsLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        trackMyPosition: true,
        initZoom: 12,
        minZoomLevel: 9,
        maxZoomLevel: 18,
        stepZoom: 1.0,
        roadConfiguration: const RoadOption(
          roadColor: Colors.grey,
        ),
        userLocationMarker: UserLocationMaker(
          personMarker: const MarkerIcon(
            icon: Icon(
              Icons.location_pin,
              color: Colors.green,
              size: 90,
            ),
          ),
          directionArrowMarker: const MarkerIcon(
            icon: Icon(
              Icons.person,
              size: 60,
            ),
          ),
        ),
        onMapIsReady: (isReady) async {
          if (isReady) {
            await _myController.enableTracking(enableStopFollow: false);
          }
        },
      ),
    );
  }
}

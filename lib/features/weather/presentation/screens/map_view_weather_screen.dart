import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/core/services/location_service.dart';
import '../../../../main_container_injection.dart';
import '../cubit/map_weather_cubit.dart';
import '../cubit/map_weather_state.dart';
import '../widget/map_weather_details_widget.dart';

class MapViewWeatherScreen extends StatefulWidget {
  const MapViewWeatherScreen({super.key});

  @override
  State<MapViewWeatherScreen> createState() => _MapViewWeatherScreenState();
}

class _MapViewWeatherScreenState extends State<MapViewWeatherScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentLatLng;
  Marker? _marker;

  Future<void> _getCurrentLocation() async {
    Position position = await sl.get<LocationService>().getCurrentPosition();
    setState(() {
      _currentLatLng = LatLng(position.latitude, position.longitude);
      _marker = Marker(
        markerId: const MarkerId("selectedLocation"),
        position: _currentLatLng!,
        draggable: false,
        onTap: () => _showWeatherDetailsSheet(_currentLatLng!),
      );
    });

    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(_currentLatLng!, 16),
    );
  }

  void _onMapTapped(LatLng latLng) {
    setState(() {
      _marker = Marker(
        markerId: const MarkerId("selectedLocation"),
        position: latLng,
        draggable: false,
        onTap: () => _showWeatherDetailsSheet(latLng),
      );
    });
    print(latLng);
    _mapController?.animateCamera(CameraUpdate.newLatLngZoom(latLng, 16));

    Future.delayed(const Duration(seconds: 1), () {
      _showWeatherDetailsSheet(latLng);
    });
  }

  void _showWeatherDetailsSheet(LatLng input) {
    BlocProvider.of<MapWeatherCubit>(context).getMapWeather(input);
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (context) => BlocBuilder<MapWeatherCubit, MapWeatherState>(
        builder: (context, state) {
          if (state is MapWeatherDataLoaded) {
            return MapWeatherDetailsWidget(weatherEntity: state.data);
          }
          if (state is MapWeatherDataError) {
            return Center(child: Text(state.message));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentLatLng == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentLatLng!,
                zoom: 16,
              ),
              myLocationEnabled: true,
              markers: _marker != null ? {_marker!} : {},
              onTap: _onMapTapped,
              onMapCreated: (controller) => _mapController = controller,
            ),
    );
  }
}

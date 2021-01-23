import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyDRx_O-xD77lymelHKRv4BOo7hGceSq410';

class LocationHelper {
  static String generateLocationPreviewImage({double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude, $longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY';
    final responce = await http.get(url);
    print(responce.body);
    return json.decode(responce.body)['results'][0]['formatted_address'];
  }
}
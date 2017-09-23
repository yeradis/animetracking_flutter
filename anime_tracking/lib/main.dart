import 'package:flutter/material.dart';
import 'app.dart';
import 'data/anime_data_injection.dart';

void main() {
  AnimeListInjector.configure(Origin.MOCK);
  runApp(new AnimeTrackingApp());
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'overview.dart'; // Import the new overview file
import 'dashboard.dart'; // Import the new dashboard file

// ----- main.dart -----
// This file contains the app's entry point, theme, and routes.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CDM Academic Portal',
      debugShowCheckedModeBanner: false,
      
      // ----- Skeleton Theme -----
      // All styling has been removed to provide a default "skeleton"
      // for the design team to build upon.
      theme: ThemeData(),
      
      // ----- Routes -----
      initialRoute: '/',
      routes: {
        '/': (context) => const OverviewScreen(), // Renamed from AuthScreen
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
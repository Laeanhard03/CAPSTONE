// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'studentdash.dart'; // Import Student Dashboard
import 'facultydash.dart'; // Import Faculty Dashboard
import 'admindash.dart'; // Import Admin Dashboard
import 'guestdash.dart'; // Import Guest Dashboard

// -------------------------------------------
// ----- dashboard.dart -----
// -------------------------------------------
// This screen shows the correct dashboard based on the user's role.

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _logout(BuildContext context) {
    // Show a notification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You have been logged out.'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
    // Navigate back to AuthScreen
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the role argument
    final role =
        ModalRoute.of(context)!.settings.arguments as String? ?? 'Guest';

    return Scaffold(
      appBar: AppBar(
        title: Text('$role Dashboard'),
        actions: [
          // Show "Logout" for Student, Faculty, Admin
          if (role != 'Guest')
            PopupMenuButton(
              onSelected: (value) {
                if (value == 'logout') {
                  _logout(context);
                }
                // Add placeholders for other actions
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'profile',
                  child: Text('Profile'),
                ),
                PopupMenuItem(
                  value: 'settings',
                  child: Text('Settings'),
                ),
                PopupMenuItem(
                  value: 'help',
                  child: Text('Help & Support'),
                ),
                PopupMenuItem(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ],
            ),
          // Show "Back" for Guest
          if (role == 'Guest')
            IconButton(
              // --- FIX ---
              // Re-added the 'X' icon for the Guest view only
              icon: const Icon(Icons.close),
              // -----------
              onPressed: () {
                // Guests just go back to the Auth screen
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        // Use a switch statement to show the correct dashboard view
        child: switch (role) {
          'Admin' => const AdminDashboardView(),
          'Faculty' => const FacultyDashboardView(),
          'Student' => const StudentDashboardView(),
          _ => const GuestDashboardView(), // Default to Guest
        },
      ),
    );
  }
}
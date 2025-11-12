// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'login_register.dart'; // Import the new views
import 'shared_widgets.dart'; // Import the shared widgets

// -------------------------------------------
// ----- overview.dart -----
// -------------------------------------------
// This screen handles Overview, Login, and Register views.

enum AuthView { overview, login, register }

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  AuthView currentView = AuthView.overview;

  // --- Helper Functions ---
  void _showNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _navigateToDashboard(String role) {
    Navigator.of(context).pushReplacementNamed(
      '/dashboard',
      arguments: role,
    );
  }

  // --- View Switching ---
  void _setView(AuthView view) {
    setState(() {
      currentView = view;
    });
  }

  // --- Main Build Method ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use AnimatedSwitcher for a smooth fade between views
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // Use a key to help AnimatedSwitcher differentiate the views
          child: switch (currentView) {
            AuthView.overview => _OverviewView(
                key: ValueKey('overview'),
                onNavigate: () => _setView(AuthView.login),
              ),
            AuthView.login => LoginView( // Changed from _LoginView
                key: ValueKey('login'),
                onNavigateToRegister: () => _setView(AuthView.register),
                onLogin: (role) {
                  _showNotification('Login Successful ($role)');
                  _navigateToDashboard(role);
                },
                onGuestLogin: () => _navigateToDashboard('Guest'),
              ),
            AuthView.register => RegisterView( // Changed from _RegisterView
                key: ValueKey('register'),
                onNavigateToLogin: () => _setView(AuthView.login),
                onRegister: () {
                  _showNotification('Registration Successful!');
                  _navigateToDashboard('Student'); // Default to Student
                },
              ),
          },
        ),
      ),
    );
  }
}

// ----- View 1: Overview (Expanded) -----
class _OverviewView extends StatelessWidget {
  final VoidCallback onNavigate;
  const _OverviewView({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 60),
        Text(
          '[LOGO/ICON HERE]',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text(
          'Welcome to the',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          'CDM Academic Portal',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 24),
        Text(
          'Evaluating Student\'s Academic Performance at Colegio de Montalban.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 48),
        CustomButton(
          text: 'Login or Register',
          onPressed: onNavigate,
        ),
        SizedBox(height: 48),
        Text(
          'Features',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 16),
        FeatureCard(
          title: 'Track Your Grades',
          description: 'Students can monitor academic progress in real-time.',
        ),
        FeatureCard(
          title: 'Faculty Tools',
          description: 'Faculty can easily manage classes and submit grades.',
        ),
        FeatureCard(
          title: 'Performance Analytics',
          description: 'Administration can view detailed academic statistics.',
        ),
        // --- Expanded Content ---
        FeatureCard(
          title: 'Parent Portal',
          description: 'Parents can view attendance and grade summaries.',
        ),
        FeatureCard(
          title: 'Alumni Network',
          description: 'Connect with graduates and find opportunities.',
        ),
        FeatureCard(
          title: 'Library Access',
          description: 'Access the digital library and resource catalog.',
        ),
        FeatureCard(
          title: 'Event Calendar',
          description: 'Stay updated on all campus events and holidays.',
        ),
        FeatureCard(
          title: 'Support Center',
          description: 'Get help from IT, an registrar, or counseling.',
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
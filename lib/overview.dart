// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
            AuthView.login => _LoginView(
                key: ValueKey('login'),
                onNavigateToRegister: () => _setView(AuthView.register),
                onLogin: (role) {
                  _showNotification('Login Successful ($role)');
                  _navigateToDashboard(role);
                },
                onGuestLogin: () => _navigateToDashboard('Guest'),
              ),
            AuthView.register => _RegisterView(
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
        _FeatureCard(
          title: 'Track Your Grades',
          description: 'Students can monitor academic progress in real-time.',
        ),
        _FeatureCard(
          title: 'Faculty Tools',
          description: 'Faculty can easily manage classes and submit grades.',
        ),
        _FeatureCard(
          title: 'Performance Analytics',
          description: 'Administration can view detailed academic statistics.',
        ),
        // --- Expanded Content ---
        _FeatureCard(
          title: 'Parent Portal',
          description: 'Parents can view attendance and grade summaries.',
        ),
        _FeatureCard(
          title: 'Alumni Network',
          description: 'Connect with graduates and find opportunities.',
        ),
        _FeatureCard(
          title: 'Library Access',
          description: 'Access the digital library and resource catalog.',
        ),
        _FeatureCard(
          title: 'Event Calendar',
          description: 'Stay updated on all campus events and holidays.',
        ),
        _FeatureCard(
          title: 'Support Center',
          description: 'Get help from IT, an registrar, or counseling.',
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String description;

  const _FeatureCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 4),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

// ----- View 2: Login -----
class _LoginView extends StatelessWidget {
  final VoidCallback onNavigateToRegister;
  final VoidCallback onGuestLogin;
  final Function(String) onLogin;

  const _LoginView({
    super.key,
    required this.onNavigateToRegister,
    required this.onLogin,
    required this.onGuestLogin,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 80),
          Text(
            'Portal Login',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 40),
          CustomTextField(
            hintText: 'Email Address',
          ),
          SizedBox(height: 16),
          CustomTextField(
            hintText: 'Password',
            isPassword: true,
          ),
          SizedBox(height: 32),
          CustomButton(
            text: 'Student Login',
            onPressed: () => onLogin('Student'),
          ),
          SizedBox(height: 16),
          CustomButton(
            text: 'Faculty Login',
            onPressed: () => onLogin('Faculty'),
          ),
          SizedBox(height: 16),
          CustomButton(
            text: 'Admin Login',
            onPressed: () => onLogin('Admin'),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Need an account?'),
              TextButton(
                onPressed: onNavigateToRegister,
                child: Text('Register'),
              ),
            ],
          ),
          TextButton(
            onPressed: onGuestLogin,
            child: Text('Continue as Guest'),
          ),
        ],
      ),
    );
  }
}

// ----- View 3: Register -----
class _RegisterView extends StatelessWidget {
  final VoidCallback onNavigateToLogin;
  final VoidCallback onRegister;

  const _RegisterView({
    super.key,
    required this.onNavigateToLogin,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 60),
          Text(
            'Create Account',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 40),
          CustomTextField(
            hintText: 'Full Name',
          ),
          SizedBox(height: 16),
          CustomTextField(
            hintText: 'Email Address',
          ),
          SizedBox(height: 16),
          CustomTextField(
            hintText: 'Password',
            isPassword: true,
          ),
          SizedBox(height: 16),
          CustomTextField(
            hintText: 'Confirm Password',
            isPassword: true,
          ),
          SizedBox(height: 32),
          CustomButton(
            text: 'Register',
            onPressed: onRegister,
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?'),
              TextButton(
                onPressed: onNavigateToLogin,
                child: Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------
// ----- widgets/custom_button.dart -----
// -------------------------------------------
// A reusable, styled button for our app. (Styling removed)

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 18),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// -------------------------------------------
// ----- widgets/custom_textfield.dart -----
// -------------------------------------------
// A reusable, styled text field. (Styling removed)

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'shared_widgets.dart'; // Import the shared widgets

// ----- View 2: Login -----
class LoginView extends StatelessWidget {
  final VoidCallback onNavigateToRegister;
  final VoidCallback onGuestLogin;
  final Function(String) onLogin;

  const LoginView({
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
class RegisterView extends StatelessWidget {
  final VoidCallback onNavigateToLogin;
  final VoidCallback onRegister;

  const RegisterView({
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
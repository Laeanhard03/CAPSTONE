// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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

// --- Helper Card for Dashboards ---
class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(20),
        title: Text(title, style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
        onTap: () {
          // Placeholder action
        },
      ),
    );
  }
}

// --- Helper Card for Overview ---
class FeatureCard extends StatelessWidget {
  final String title;
  final String description;

  const FeatureCard({
    super.key,
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
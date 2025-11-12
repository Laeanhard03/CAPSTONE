// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'shared_widgets.dart'; // Import the DashboardCard

// ----- Guest Dashboard -----
class GuestDashboardView extends StatelessWidget {
  const GuestDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16),
      children: [
        Text('Welcome, Guest!',
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: 20),
        DashboardCard(
          title: 'About Colegio de Montalban',
          subtitle: 'Learn about our mission and vision',
        ),
        DashboardCard(
          title: 'Public News & Events',
          subtitle: 'See what\'s happening on campus',
        ),
        DashboardCard(
          title: 'Contact Information',
          subtitle: 'Get in touch with our departments',
        ),
        DashboardCard(
          title: 'Admissions',
          subtitle: 'Learn how to apply and see requirements',
        ),
        DashboardCard(
          title: 'Programs Offered',
          subtitle: 'Explore our undergraduate and graduate degrees',
        ),
        DashboardCard(
          title: 'Campus Tour',
          subtitle: 'View our campus map and facilities',
        ),
        DashboardCard(
          title: 'Academic Calendar',
          subtitle: 'View key dates for the public',
        ),
        DashboardCard(
          title: 'Faculty Directory',
          subtitle: 'Browse our world-class faculty',
        ),
        DashboardCard(
          title: 'Accreditation',
          subtitle: 'View our institutional accreditations',
        ),
        DashboardCard(
          title: 'Tuition & Aid',
          subtitle: 'General information on costs and scholarships',
        ),
        DashboardCard(
          title: 'Alumni Association',
          subtitle: 'See information for our graduates',
        ),
        DashboardCard(
          title: 'Library',
          subtitle: 'Information on public access to the library',
        ),
        DashboardCard(
          title: 'FAQ',
          subtitle: 'Find answers to common questions',
        ),
        DashboardCard(
          title: 'Careers',
          subtitle: 'View open positions at the college',
        ),
        DashboardCard(
          title: 'Give to CDM',
          subtitle: 'Learn about supporting our institution',
        ),
      ],
    );
  }
}
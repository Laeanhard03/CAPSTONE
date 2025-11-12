// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'shared_widgets.dart'; // Import the DashboardCard

// ----- Admin Dashboard -----
class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16),
      children: [
        Text('Welcome, Admin!',
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: 20),
        DashboardCard(
          title: 'Student Records',
          subtitle: 'Search and manage all students',
        ),
        DashboardCard(
          title: 'Faculty Management',
          subtitle: 'Manage faculty accounts and roles',
        ),
        DashboardCard(
          title: 'Course Catalog',
          subtitle: 'Add or edit available courses',
        ),
        DashboardCard(
          title: 'System Analytics',
          subtitle: 'View overall performance metrics',
        ),
        DashboardCard(
          title: 'Registrar Tools',
          subtitle: 'Process transcripts and enrollment verifications',
        ),
        DashboardCard(
          title: 'Admissions',
          subtitle: 'Review and process new applications',
        ),
        DashboardCard(
          title: 'Financial Aid',
          subtitle: 'Manage scholarships and aid packages',
        ),
        DashboardCard(
          title: 'Bursar\'s Office',
          subtitle: 'Oversee tuition billing and payments',
        ),
        DashboardCard(
          title: 'Broadcast Message',
          subtitle: 'Send campus-wide announcements',
        ),
        DashboardCard(
          title: 'User Management',
          subtitle: 'Create, edit, or disable user accounts',
        ),
        DashboardCard(
          title: 'System Settings',
          subtitle: 'Configure portal settings and permissions',
        ),
        DashboardCard(
          title: 'Academic Calendar',
          subtitle: 'Set key dates for the semester',
        ),
        DashboardCard(
          title: 'Room Management',
          subtitle: 'Manage classroom and building data',
        ),
        DashboardCard(
          title: 'Run Reports',
          subtitle: 'Generate custom reports on enrollment, grades',
        ),
        DashboardCard(
          title: 'Audit Logs',
          subtitle: 'Review system access and changes',
        ),
      ],
    );
  }
}
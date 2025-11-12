// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'shared_widgets.dart'; // Import the DashboardCard

// ----- Student Dashboard -----
class StudentDashboardView extends StatelessWidget {
  const StudentDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16),
      children: [
        Text('Welcome, Student!',
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: 20),
        DashboardCard(
          title: 'My Grades',
          subtitle: 'View your current grades and GPA',
        ),
        DashboardCard(
          title: 'Class Schedule',
          subtitle: 'See your weekly class schedule',
        ),
        DashboardCard(
          title: 'Upcoming Assignments',
          subtitle: 'Check deadlines and submissions',
        ),
        DashboardCard(
          title: 'Announcements',
          subtitle: 'Read updates from the college',
        ),
        DashboardCard(
          title: 'Tuition & Fees',
          subtitle: 'View your account balance and make payments',
        ),
        DashboardCard(
          title: 'My Profile',
          subtitle: 'Update your personal information',
        ),
        DashboardCard(
          title: 'Course Registration',
          subtitle: 'Enroll in classes for the next semester',
        ),
        DashboardCard(
          title: 'Library',
          subtitle: 'Access digital resources and check due dates',
        ),
        DashboardCard(
          title: 'Faculty Directory',
          subtitle: 'Find contact information for your professors',
        ),
        DashboardCard(
          title: 'Attendance',
          subtitle: 'Check your attendance records',
        ),
        DashboardCard(
          title: 'Advising',
          subtitle: 'Contact your academic advisor',
        ),
        DashboardCard(
          title: 'Transcript Request',
          subtitle: 'Order an official or unofficial transcript',
        ),
        DashboardCard(
          title: 'Campus Map',
          subtitle: 'Find your way around campus',
        ),
        DashboardCard(
          title: 'Student Handbook',
          subtitle: 'Review college policies and procedures',
        ),
        DashboardCard(
          title: 'Help Center',
          subtitle: 'Get support for IT or other issues',
        ),
      ],
    );
  }
}
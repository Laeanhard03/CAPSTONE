// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'shared_widgets.dart'; // Import the DashboardCard

// ----- Faculty Dashboard -----
class FacultyDashboardView extends StatelessWidget {
  const FacultyDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16),
      children: [
        Text('Welcome, Faculty!',
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: 20),
        DashboardCard(
          title: 'My Classes',
          subtitle: 'Manage your assigned classes',
        ),
        DashboardCard(
          title: 'Grade Submission',
          subtitle: 'Enter and update student grades',
        ),
        DashboardCard(
          title: 'Student Queries',
          subtitle: 'View and respond to questions',
        ),
        DashboardCard(
          title: 'Manage Schedule',
          subtitle: 'Set office hours and availability',
        ),
        DashboardCard(
          title: 'Class Rosters',
          subtitle: 'View students enrolled in your courses',
        ),
        DashboardCard(
          title: 'Post Announcements',
          subtitle: 'Send updates to your students',
        ),
        DashboardCard(
          title: 'My Profile',
          subtitle: 'Update your faculty bio and contact info',
        ),
        DashboardCard(
          title: 'Faculty Handbook',
          subtitle: 'Review policies and academic guidelines',
        ),
        DashboardCard(
          title: 'Advising List',
          subtitle: 'View and manage your student advisees',
        ),
        DashboardCard(
          title: 'Attendance Tracking',
          subtitle: 'Submit attendance for your classes',
        ),
        DashboardCard(
          title: 'Room Booking',
          subtitle: 'Reserve a classroom or meeting space',
        ),
        DashboardCard(
          title: 'Submit Book Orders',
          subtitle: 'Request textbooks for your courses',
        ),
        DashboardCard(
          title: 'IT Support',
          subtitle: 'Create a support ticket for technical issues',
        ),
        DashboardCard(
          title: 'Department Memos',
          subtitle: 'Read internal communications',
        ),
        DashboardCard(
          title: 'Leave Request',
          subtitle: 'Submit a request for time off',
        ),
      ],
    );
  }
}
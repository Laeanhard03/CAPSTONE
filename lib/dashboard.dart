// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

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
          'Admin' => const _AdminDashboardView(),
          'Faculty' => const _FacultyDashboardView(),
          'Student' => const _StudentDashboardView(),
          _ => const _GuestDashboardView(), // Default to Guest
        },
      ),
    );
  }
}

// ----- Dashboard Views (Content-Rich) -----

// --- Helper Card for Dashboards ---
class _DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _DashboardCard({
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

// ----- Student Dashboard -----
class _StudentDashboardView extends StatelessWidget {
  const _StudentDashboardView();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16),
      children: [
        Text('Welcome, Student!',
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: 20),
        _DashboardCard(
          title: 'My Grades',
          subtitle: 'View your current grades and GPA',
        ),
        _DashboardCard(
          title: 'Class Schedule',
          subtitle: 'See your weekly class schedule',
        ),
        _DashboardCard(
          title: 'Upcoming Assignments',
          subtitle: 'Check deadlines and submissions',
        ),
        _DashboardCard(
          title: 'Announcements',
          subtitle: 'Read updates from the college',
        ),
        _DashboardCard(
          title: 'Tuition & Fees',
          subtitle: 'View your account balance and make payments',
        ),
        _DashboardCard(
          title: 'My Profile',
          subtitle: 'Update your personal information',
        ),
        _DashboardCard(
          title: 'Course Registration',
          subtitle: 'Enroll in classes for the next semester',
        ),
        _DashboardCard(
          title: 'Library',
          subtitle: 'Access digital resources and check due dates',
        ),
        _DashboardCard(
          title: 'Faculty Directory',
          subtitle: 'Find contact information for your professors',
        ),
        _DashboardCard(
          title: 'Attendance',
          subtitle: 'Check your attendance records',
        ),
        _DashboardCard(
          title: 'Advising',
          subtitle: 'Contact your academic advisor',
        ),
        _DashboardCard(
          title: 'Transcript Request',
          subtitle: 'Order an official or unofficial transcript',
        ),
        _DashboardCard(
          title: 'Campus Map',
          subtitle: 'Find your way around campus',
        ),
        _DashboardCard(
          title: 'Student Handbook',
          subtitle: 'Review college policies and procedures',
        ),
        _DashboardCard(
          title: 'Help Center',
          subtitle: 'Get support for IT or other issues',
        ),
      ],
    );
  }
}

// ----- Faculty Dashboard -----
class _FacultyDashboardView extends StatelessWidget {
  const _FacultyDashboardView();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16),
      children: [
        Text('Welcome, Faculty!',
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: 20),
        _DashboardCard(
          title: 'My Classes',
          subtitle: 'Manage your assigned classes',
        ),
        _DashboardCard(
          title: 'Grade Submission',
          subtitle: 'Enter and update student grades',
        ),
        _DashboardCard(
          title: 'Student Queries',
          subtitle: 'View and respond to questions',
        ),
        _DashboardCard(
          title: 'Manage Schedule',
          subtitle: 'Set office hours and availability',
        ),
        _DashboardCard(
          title: 'Class Rosters',
          subtitle: 'View students enrolled in your courses',
        ),
        _DashboardCard(
          title: 'Post Announcements',
          subtitle: 'Send updates to your students',
        ),
        _DashboardCard(
          title: 'My Profile',
          subtitle: 'Update your faculty bio and contact info',
        ),
        _DashboardCard(
          title: 'Faculty Handbook',
          subtitle: 'Review policies and academic guidelines',
        ),
        _DashboardCard(
          title: 'Advising List',
          subtitle: 'View and manage your student advisees',
        ),
        _DashboardCard(
          title: 'Attendance Tracking',
          subtitle: 'Submit attendance for your classes',
        ),
        _DashboardCard(
          title: 'Room Booking',
          subtitle: 'Reserve a classroom or meeting space',
        ),
        _DashboardCard(
          title: 'Submit Book Orders',
          subtitle: 'Request textbooks for your courses',
        ),
        _DashboardCard(
          title: 'IT Support',
          subtitle: 'Create a support ticket for technical issues',
        ),
        _DashboardCard(
          title: 'Department Memos',
          subtitle: 'Read internal communications',
        ),
        _DashboardCard(
          title: 'Leave Request',
          subtitle: 'Submit a request for time off',
        ),
      ],
    );
  }
}

// ----- Admin Dashboard -----
class _AdminDashboardView extends StatelessWidget {
  const _AdminDashboardView();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16),
      children: [
        Text('Welcome, Admin!',
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: 20),
        _DashboardCard(
          title: 'Student Records',
          subtitle: 'Search and manage all students',
        ),
        _DashboardCard(
          title: 'Faculty Management',
          subtitle: 'Manage faculty accounts and roles',
        ),
        _DashboardCard(
          title: 'Course Catalog',
          subtitle: 'Add or edit available courses',
        ),
        _DashboardCard(
          title: 'System Analytics',
          subtitle: 'View overall performance metrics',
        ),
        _DashboardCard(
          title: 'Registrar Tools',
          subtitle: 'Process transcripts and enrollment verifications',
        ),
        _DashboardCard(
          title: 'Admissions',
          subtitle: 'Review and process new applications',
        ),
        _DashboardCard(
          title: 'Financial Aid',
          subtitle: 'Manage scholarships and aid packages',
        ),
        _DashboardCard(
          title: 'Bursar\'s Office',
          subtitle: 'Oversee tuition billing and payments',
        ),
        _DashboardCard(
          title: 'Broadcast Message',
          subtitle: 'Send campus-wide announcements',
        ),
        _DashboardCard(
          title: 'User Management',
          subtitle: 'Create, edit, or disable user accounts',
        ),
        _DashboardCard(
          title: 'System Settings',
          subtitle: 'Configure portal settings and permissions',
        ),
        _DashboardCard(
          title: 'Academic Calendar',
          subtitle: 'Set key dates for the semester',
        ),
        _DashboardCard(
          title: 'Room Management',
          subtitle: 'Manage classroom and building data',
        ),
        _DashboardCard(
          title: 'Run Reports',
          subtitle: 'Generate custom reports on enrollment, grades',
        ),
        _DashboardCard(
          title: 'Audit Logs',
          subtitle: 'Review system access and changes',
        ),
      ],
    );
  }
}

// ----- Guest Dashboard -----
class _GuestDashboardView extends StatelessWidget {
  const _GuestDashboardView();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16),
      children: [
        Text('Welcome, Guest!',
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(height: 20),
        _DashboardCard(
          title: 'About Colegio de Montalban',
          subtitle: 'Learn about our mission and vision',
        ),
        _DashboardCard(
          title: 'Public News & Events',
          subtitle: 'See what\'s happening on campus',
        ),
        _DashboardCard(
          title: 'Contact Information',
          subtitle: 'Get in touch with our departments',
        ),
        _DashboardCard(
          title: 'Admissions',
          subtitle: 'Learn how to apply and see requirements',
        ),
        _DashboardCard(
          title: 'Programs Offered',
          subtitle: 'Explore our undergraduate and graduate degrees',
        ),
        _DashboardCard(
          title: 'Campus Tour',
          subtitle: 'View our campus map and facilities',
        ),
        _DashboardCard(
          title: 'Academic Calendar',
          subtitle: 'View key dates for the public',
        ),
        _DashboardCard(
          title: 'Faculty Directory',
          subtitle: 'Browse our world-class faculty',
        ),
        _DashboardCard(
          title: 'Accreditation',
          subtitle: 'View our institutional accreditations',
        ),
        _DashboardCard(
          title: 'Tuition & Aid',
          subtitle: 'General information on costs and scholarships',
        ),
        _DashboardCard(
          title: 'Alumni Association',
          subtitle: 'See information for our graduates',
        ),
        _DashboardCard(
          title: 'Library',
          subtitle: 'Information on public access to the library',
        ),
        _DashboardCard(
          title: 'FAQ',
          subtitle: 'Find answers to common questions',
        ),
        _DashboardCard(
          title: 'Careers',
          subtitle: 'View open positions at the college',
        ),
        _DashboardCard(
          title: 'Give to CDM',
          subtitle: 'Learn about supporting our institution',
        ),
      ],
    );
  }
}
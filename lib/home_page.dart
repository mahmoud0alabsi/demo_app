import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitFlow Explanation'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Center(
              child: Text(
                'Understanding GitFlow',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003366),
                    ),
              ),
            ),
            SizedBox(height: 16),

            // Introduction
            Text(
              'GitFlow is a branching model for Git, popularized by Vincent Driessen. It provides a robust framework for managing feature development, releases, and hotfixes in projects.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 20),

            // Diagram
            Center(
              child: Image.network(
                'https://leanpub.com/site_images/git-flow/git-workflow-release-cycle-4maintenance.png',
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            SizedBox(height: 20),

            // Explanation Sections
            _buildSection(
              context,
              'Main Branch',
              'The `main` branch contains stable and production-ready code. It is the base for releases.',
              icon: Icons.stars,
            ),
            SizedBox(height: 10),
            _buildSection(
              context,
              'Development Branch',
              'The `development` branch contains the latest in-progress code. It integrates features before releases.',
              icon: Icons.code,
            ),
            SizedBox(height: 10),
            _buildSection(
              context,
              'Feature Branches',
              'Feature branches are used to work on new features. They are merged into the `development` branch when complete.',
              icon: Icons.build,
            ),
            SizedBox(height: 10),
            _buildSection(
              context,
              'Release Branches',
              'Release branches prepare a new version for production. They allow bug fixes and final changes before merging to `main`.',
              icon: Icons.upload,
            ),
            SizedBox(height: 10),
            _buildSection(
              context,
              'Hotfix Branches',
              'Hotfix branches fix critical issues in production. They are created from `main` and merged back into `main` and `development`.',
              icon: Icons.bug_report,
            ),

            SizedBox(height: 20),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Learn More About Git'),
                ),
                // ElevatedButton(
                //   onPressed: () => Navigator.pushNamed(context, '/settings'),
                //   child: Text('Settings'),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper Method for Sections
  Widget _buildSection(BuildContext context, String title, String description,
      {required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Color(0xFF003366)),
            SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

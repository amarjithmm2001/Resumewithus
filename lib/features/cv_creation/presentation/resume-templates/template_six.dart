import 'package:flutter/material.dart';

class InfographicResume extends StatelessWidget {
  final String name;
  final String title;
  final String email;
  final String? github;
  final String disc;
  final String phone;
  final List<String>? experience;
  final List<String>? education;
  final List<String> skills;
  final List<String>? projects;

  const InfographicResume({
    super.key,
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.skills,
    required this.disc,
    this.experience,
    this.education,
    this.projects,
    this.github,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with Circular Progress Bars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircularProgress('Profile', 0.8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                _buildCircularProgress('Skills', 0.7),
              ],
            ),
            const SizedBox(height: 20),
            // About Section
            _buildSection(
              title: 'About Me',
              content: disc,
            ),
            const SizedBox(height: 20),
            // Experience Section
            if (experience != null && experience!.isNotEmpty)
              _buildSection(
                title: 'Experience',
                content: experience!.join('\n'),
              ),
            const SizedBox(height: 20),
            // Education Section
            if (education != null && education!.isNotEmpty)
              _buildSection(
                title: 'Education',
                content: education!.join('\n'),
              ),
            const SizedBox(height: 20),
            // Skills Section
            _buildSection(
              title: 'Skills',
              content: skills.join('\n'),
            ),
            const SizedBox(height: 20),
            // Projects Section
            if (projects != null && projects!.isNotEmpty)
              _buildSection(
                title: 'Projects',
                content: projects!.join('\n'),
              ),
            const SizedBox(height: 20),
            // Contact Section
            _buildSection(
              title: 'Contact',
              content: [
                'Email: $email',
                'Phone: $phone',
                if (github != null && github!.isNotEmpty) 'GitHub: $github',
              ].join('\n'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularProgress(String label, double progress) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              color: Colors.blueAccent,
              strokeWidth: 8,
            ),
            Text(
              '${(progress * 100).toInt()}%',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

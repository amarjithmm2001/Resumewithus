import 'package:flutter/material.dart';

class CreativeResumeTemplate extends StatelessWidget {
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

  const CreativeResumeTemplate({
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
            // Header Section
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blueGrey,
                  child: Text(
                    name[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // About Section
            _buildSection(
              icon: Icons.info_outline,
              title: 'About Me',
              content: disc,
            ),
            const SizedBox(height: 16),
            // Experience Section
            if (experience != null)
              _buildSection(
                icon: Icons.work_outline,
                title: 'Experience',
                content: experience!.join('\n'),
              ),
            const SizedBox(height: 16),
            // Education Section
            if (education != null)
              _buildSection(
                icon: Icons.school_outlined,
                title: 'Education',
                content: education!.join('\n'),
              ),
            const SizedBox(height: 16),
            // Skills Section
            _buildSection(
              icon: Icons.star_outline,
              title: 'Skills',
              content: skills.join('\n'),
            ),
            const SizedBox(height: 16),
            // Projects Section
            if (projects != null)
              _buildSection(
                icon: Icons.folder_open_outlined,
                title: 'Projects',
                content: projects!.join('\n'),
              ),
            const SizedBox(height: 16),
            // Contact Section
            _buildSection(
              icon: Icons.contact_mail_outlined,
              title: 'Contact',
              content: [
                'Email: $email',
                'Phone: $phone',
                if (github != null) 'GitHub: $github',
              ].join('\n'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 30,
          color: Colors.blueGrey,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

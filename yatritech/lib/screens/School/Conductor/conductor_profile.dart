import 'package:flutter/material.dart';

class ConductorProfile extends StatelessWidget {
  const ConductorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(child: Column(children: [])),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      color: Colors.indigo,
      padding: const EdgeInsets.only(bottom: 30, top: 20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 60, color: Colors.indigo),
          ),
          const SizedBox(height: 16),
          const Text(
            "Pujan Dhakal",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Conductor ID: CND-84920',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            ListTile(leading: const Icon(Icons.settings, color: Colors.indigo)),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo, size: 28),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 13,
          height: 1.5,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

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
        ],
      ),
    );
  }
}

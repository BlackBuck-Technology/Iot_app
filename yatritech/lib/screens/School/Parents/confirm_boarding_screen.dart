import 'package:flutter/material.dart';

class ConfirmBoardingScreen extends StatelessWidget {
  final String busData;

  const ConfirmBoardingScreen({super.key, required this.busData});

  @override
  Widget build(BuildContext context) {
    // Parsing the busData if it was real JSON, here we just show mock data.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Boarding'),
        backgroundColor: Colors.green.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/150',
              ), // Mock Student Photo
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 16),
            const Text(
              'Aarav Sharma',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Grade 5 - Section A',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Divider(height: 40, thickness: 1),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.directions_bus,
                  color: Colors.green,
                  size: 40,
                ),
                title: const Text(
                  'Bus #12',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Scanned Data: $busData\nDriver: Ram Bahadur'),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Log attendance here via backend API
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Boarding confirmed successfully!'),
                    ),
                  );
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text(
                  'Confirm Boarding',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel & Rescan',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'confirm_boarding_screen.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final MobileScannerController _scannerController = MobileScannerController();
  bool _isScanned = false; // Prevent multiple navigations

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Bus QR'),
        backgroundColor: Colors.amber.shade700,
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: () => _scannerController.toggleTorch(),
          ),
          IconButton(
            icon: const Icon(Icons.cameraswitch),
            onPressed: () => _scannerController.switchCamera(),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _scannerController,
            onDetect: (capture) {
              if (_isScanned) return;

              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                final rawData = barcode.rawValue ?? '';
                if (rawData.isNotEmpty) {
                  _validateAndProceed(rawData);
                  break;
                }
              }
            },
          ),
          // Viewfinder Overlay
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber, width: 4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.qr_code_scanner,
                size: 80,
                color: Colors.white54,
              ),
            ),
          ),
          const Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Text(
              'Align the bus door QR code within the frame',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                backgroundColor: Colors.black45,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _validateAndProceed(String data) {
    // Basic structural validation - mock example
    if (data.startsWith('yatribus_') || data.length > 5) {
      setState(() {
        _isScanned = true;
      });
      // Valid bus QR
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmBoardingScreen(busData: data),
        ),
      );
    } else {
      // Invalid state / Error
      _showErrorDialog(
        'Invalid QR Code. Please scan a valid YatriTECH Bus QR.',
      );
    }
  }

  void _showErrorDialog(String message) {
    setState(() {
      _isScanned = true; // Block scanning temporarily
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Access Denied', style: TextStyle(color: Colors.red)),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() {
                _isScanned = false; // Allow rescanning
              });
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}

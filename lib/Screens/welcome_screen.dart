import 'package:flutter/material.dart';
import 'package:montugo/Mechanic/UI/NavigationBar/bottom_nav_bar.dart';
import 'package:montugo/Screens/models/pdf_viewer_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _hasReadTerms = false;

  void _navigateToPdfViewer() async {
    final String assetPath = 'assets/pdf/terms.pdf';
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/temp_terms.pdf");

    if (!await file.exists()) {
      final data = await rootBundle.load(assetPath);
      final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await file.writeAsBytes(bytes, flush: true);
    }

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerScreen(
          pdfPath: file.path,
        ),
      ),
    );

    if (result == true) {
      setState(() {
        _hasReadTerms = true;
      });
    }
  }

  void _acceptAndContinue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('accepted_terms', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomNavBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png', height: 150),
              SizedBox(height: 100),
              
              _hasReadTerms
                ? Container(
                    height: 50, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.check_circle, color: Color(0xFF36454F)),
                        SizedBox(width: 12),
                        Text(
                          'Syarat & Ketentuan dibaca',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ],
                    ),
                  )
                : ElevatedButton(
                    onPressed: _navigateToPdfViewer,
                    child: Text('Baca Syarat & Ketentuan'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50), 
                    ),
                  ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _hasReadTerms ? _acceptAndContinue : null,
                child: Text('Setuju & Lanjutkan'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), 
                  backgroundColor: _hasReadTerms ? Theme.of(context).colorScheme.primary : Colors.grey,
                  foregroundColor: Colors.white, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

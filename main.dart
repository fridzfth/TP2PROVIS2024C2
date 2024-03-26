import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'NextPage.dart'; // Import the NextPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set debug banner to false
      home: HomeScreen(), // Use HomeScreen widget as home
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
          ),
          ClipPath(
            clipper: OvalTopClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: Color(0xFF0B8FAC), // Warna oval
              child: Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double fontSize = constraints.maxWidth *
                        0.05; // Menggunakan persentase lebar layar untuk menentukan ukuran font
                    return Text(
                      'Pilih Pasien',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize, // Mengatur font menjadi Poppins
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 8.0,
            child: IconButton(
              icon: Icon(Icons.close),
              color: Colors.white,
              onPressed: () {
                // Tindakan ketika tombol X ditekan
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height *
                0.1, // Adjusted to accommodate the button
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                Text(
                  'MYSELF',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                ContentBox(
                  name: 'Marvel R- My Self',
                  date: '24 December 2023',
                  phoneNumber: '+62-8123456789',
                ),
                SizedBox(height: 10),
                Text(
                  'OTHERS',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                ContentBox(
                  name: 'Mohammad Faridz',
                  date: '21 September 2021',
                  phoneNumber: '+62-8123456789',
                ),
                SizedBox(height: 10),
                ContentBox(
                  name: 'Fikri Idham',
                  date: '29 February 2003',
                  phoneNumber: '+62-8123456789',
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: ElevatedButton(
                onPressed: () {
                  // Handle next button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NextPage()), // Navigate to NextPage
                  );
                },
                child: Text(
                  'Next',
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContentBox extends StatefulWidget {
  final String name;
  final String date;
  final String phoneNumber;

  const ContentBox({
    Key? key,
    required this.name,
    required this.date,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  _ContentBoxState createState() => _ContentBoxState();
}

class _ContentBoxState extends State<ContentBox> {
  static int? _selectedIndex; // Maintain selected index globally

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Reset previously selected index if exists
          if (_selectedIndex != null) {
            _ContentBoxState._selectedIndex = null;
          }
          // Set the selected index
          _ContentBoxState._selectedIndex = widget.hashCode;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _ContentBoxState._selectedIndex == widget.hashCode
              ? Colors.blue[100]
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(widget.date),
                  SizedBox(height: 8),
                  Text(widget.phoneNumber),
                ],
              ),
            ),
            Radio(
              value: widget.hashCode,
              groupValue: _ContentBoxState._selectedIndex,
              onChanged: (int? value) {
                setState(() {
                  _ContentBoxState._selectedIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OvalTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

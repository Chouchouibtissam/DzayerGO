import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Circuit extends StatefulWidget {
  const Circuit({Key? key}) : super(key: key);

  @override
  State<Circuit> createState() => _CircuitState();
}

class _CircuitState extends State<Circuit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => {},
              iconSize: 40,
              icon: const Icon(Icons.arrow_back_ios),
              color: const Color(0xff461A3E),
            ),
            const SizedBox(width: 10),
            Text(
              'Circuits de randonnées',
              style: TextStyle(
                color: const Color(0xff461A3E),
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xfff4d6a4),
      ),
      body:  Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfff4d6a4),
        ),
      ),
    );
  }
}


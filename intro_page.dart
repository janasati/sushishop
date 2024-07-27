import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/theme/colors.dart';

import '../components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          const SizedBox(height: 25),

          //shop name
          Text(
            "SUSHI MAN",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 28,
              color: Colors.white,
            ),
          ),

           const SizedBox(height: 25),

          //icon
          Container(
            height: 300.0,
            width:1200,// Set the desired height
            child: Image.asset(
              'lib/images/sushi.png',
              fit: BoxFit.contain, // Choose a fit option that suits your needs
            ),
          ),

          const SizedBox(height: 25),

          //title
          Text(
              "THE TASTE OF JAPANESE FOOD",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 44,
              color: Colors.white,
          ),
          ),

          const SizedBox(height: 25),

          //button
          MyButton(text: "Get Started",
            onTap: () {
            Navigator.pushNamed(context, '/menupage');
          },
          )
      ],

      ),
    ),
    );
  }
}
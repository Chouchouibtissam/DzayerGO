import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String label;
  final bool  hasBeenPressed;
  final Function() ? onTap;
  final double height;
  final double width;
  final double size;
  const MyButton( {Key? key, required this.label,required this.height,required this.width,required this.size,required this.hasBeenPressed, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.4),
          color: hasBeenPressed ? Color(0xffffffff): Color(0xffff5243),
        ),
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            color: hasBeenPressed ?Color(0xffff5243): Color(0xffffffff) ,
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

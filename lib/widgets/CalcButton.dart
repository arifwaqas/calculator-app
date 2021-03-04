import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CalcButton extends StatelessWidget{

  final int fillColor;
  final int textColor;
  final double textSize;
  final String text;
  final Function callback;

  const CalcButton({Key key,
    this.textSize = 24,
    this.text,
    this.fillColor,
    this.callback,
    this.textColor = 0xFF6C807F}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 65,
        width: 65,
        child: FlatButton(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: () {
              callback(text);
            },

            color: fillColor != null ? Color(fillColor) : null ,
            textColor: Color(textColor),// To create a fill color const
            child: Text(text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.w400,
              ),
            ),))
      ),
    );
  }
}
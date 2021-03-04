import 'package:flutter/material.dart';
import './widgets/CalcButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

/* Colors List */
final int accentLNavy = 0xFF6C807F;
final int accentAqua = 0xFF65BDAC;
final int accentDNavy = 0xFF283637;
final int accentWhite = 0xFFFFFFFF;
final int accentPink = 0xFFFA5858;
/* End of List */

void main() => runApp(MaterialApp(
  home: HomeClass(),
));


class HomeClass extends StatefulWidget{

  @override
  _HomeClassState createState() => _HomeClassState();
}

class _HomeClassState extends State<HomeClass> {

  bool _freshState = true;
  String _history = '';
  String _expression = '';

  void evaluate( String text ){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double res = exp.evaluate(EvaluationType.REAL, cm);
    _freshState = true;
    setState(() {
      _history = _expression;
      _expression = res.toString();
    });
  }

  void clear(String text){
    setState(() {
      _expression = '';
    });
  }
  void allClear(String text){
    setState(() {
      _expression = '';
      _history = '';
    });
  }
  //func to append the exp to _expressions
  void numClick(String text){
    setState(() {
      !_freshState ? _expression += text : _expression = text;
    });
    _freshState = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold (

        backgroundColor: Color(0xFFEDEDED),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                alignment: Alignment.centerRight,
                child: Text(
                  _history,
                  style: GoogleFonts.rubik(
                      fontSize: 24,
                      color: Colors.grey,
                      letterSpacing: 2.5
                  ),)
            ),

            SizedBox(
              height: 12,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                alignment: Alignment.centerRight,
                child: Text(
                  _expression,
                  style: GoogleFonts.rubik(
                      fontSize: 48,
                      color: Color(accentLNavy),
                      letterSpacing: 2.5
                  ),)
            ),
            SizedBox(
              height: 12,
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                text: 'AC',
                textSize: 20,
                fillColor: 0xFF6C807F,
                callback: allClear,
                textColor: accentWhite,
              ),
                CalcButton(
                  text: 'C',
                  textSize: 28,
                  callback: clear,
                  fillColor: accentLNavy,
                  textColor: accentWhite,
                ),
                CalcButton(
                  text: '%',
                  textSize: 26,
                  //fillColor: accentWhite,
                  textColor: accentPink,
                  callback: numClick,
                ),
                CalcButton(
                  callback: numClick,
                  text: '/',
                  textSize: 26,
                  textColor: accentPink,
                ),
              ],
            ),
// SECOND ROW
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  callback: numClick,
                  text: '7',
                  textSize: 28,
                  textColor: accentLNavy,
                  //fillColor: 0xFF6C807F,
                ),
                CalcButton(
                  textColor: accentLNavy,
                  callback: numClick,
                  text: '8',
                  textSize: 28,
                  //fillColor: 0xFF6C807F,
                ),
                CalcButton(
                  callback: numClick,
                  text: '9',
                  textSize: 28,
                  //fillColor: 0xFF6C807F,
                ),
                CalcButton(
                  callback: numClick,
                  text: '*',
                  textSize: 30,
                  textColor: accentPink,
                  //fillColor: accentWhite,
                ),
              ],
            ),
// THIRD ROW
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  callback: numClick,
                  text: '4',
                  textSize: 28,
                  //fillColor: 0xFF6C807F,
                ),
                CalcButton(
                  callback: numClick,
                  text: '5',
                  textSize: 28,
                  //fillColor: 0xFF6C807F,
                ),
                CalcButton(
                  callback: numClick,
                  text: '6',
                  textSize: 28,
                  //fillColor: 0xFF6C807F,
                ),
                CalcButton(
                  callback: numClick,
                  text: '-',
                  textSize: 30,
                  textColor: accentPink,
                  //fillColor: accentWhite,
                ),
              ],
            ),
// 4th ROW
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  callback: numClick,
                  text: '1',
                  textSize: 28,
                  //fillColor: 0xFF6C807F,
                ),
                CalcButton(
                  callback: numClick,
                  text: '2',
                  textSize: 28,
                ),
                CalcButton(
                  callback: numClick,
                  text: '3',
                  textSize: 28,
                  //fillColor: 0xFF6C807F,
                ),
                CalcButton(
                  callback: numClick,
                  text: '+',
                  textSize: 30,
                  textColor: accentPink,
                  //fillColor: accentWhite,
                ),
              ],
            ),
// 5th ROW
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  callback: numClick,
                  text: '.',
                  textSize: 32,
                ),
                CalcButton(
                  callback: numClick,
                  text: '0',
                  textSize: 28,
                ),
                CalcButton(
                  callback: numClick,
                  text: '00',
                  textSize: 26,
                ),
                CalcButton(
                  callback: evaluate,
                  text: '=',
                  textSize: 30,
                  textColor: accentWhite,
                  fillColor: accentPink,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class BillCalculator extends StatefulWidget {
  @override
  _BillCalculatorState createState() => _BillCalculatorState();
}

class _BillCalculatorState extends State<BillCalculator> {
  int tipPercent=10;
  int people=1;
  double amount=0.0;
  double billPerPerson=0.00;
  double tipPerPerson=0.00;
  double totalPerPerson=0.00;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal:height*0.02,vertical: height*0.06),
              alignment: Alignment.center,
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text('Tip Calculator',
                    style: kLabelTextStyle.copyWith(
                      fontSize: height*0.05,
                    ),),
                  ),
                  SizedBox(
                    height: height*0.05,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                      borderRadius: BorderRadius.all(Radius.circular(height*0.02)
                    ),
                    ),
                    width: width*0.98,
                    height: height*0.2,
                    padding: EdgeInsets.all(1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('PER PERSON',
                              style: kLabelTextStyle.copyWith(
                                fontSize: height*0.03,
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                              ),),
                              Row(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('₹',
                                        style: kLabelTextStyle.copyWith(
                                          fontSize: height*0.04
                                        ),),
                                      SizedBox(
                                        height: height*0.01,
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: <Widget>[
                                      Text(totalPerPerson.toString().substring(0,totalPerPerson.toString().indexOf('.')),
                                      style: kLabelTextStyle.copyWith(
                                        fontSize: height*0.07
                                      ),),
                                      Text(totalPerPerson.toString().substring(totalPerPerson.toString().indexOf('.')),
                                      style: kLabelTextStyle.copyWith(
                                        fontSize: height*0.03
                                      ),),
                                    ],
                                  ),
                                ],
                              )
                          ],
                        ),
                        SizedBox(
                          height: height*0.15,
                          width: 20.0,
                          child: VerticalDivider(
                            color: Colors.grey,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('SUBTOTAL',
                                style: kLabelTextStyle.copyWith(
                                  fontSize: height*0.02,
                                ),),
                                Text('₹ $billPerPerson',
                                style: kLabelTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height*0.03,
                                ),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('TIP',
                                style: kLabelTextStyle.copyWith(
                                  fontSize: height*0.02,
                                ),),
                                Text('₹  $tipPerPerson',
                                style: kLabelTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height*0.03,
                                ),)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height*0.03,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    style:kLabelTextStyle.copyWith(
                        fontSize: height*0.03,
                    ),
                    cursorColor: Colors.white,
                    onChanged: (value){
                      amount=double.parse(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Total Amount',
                      labelStyle: kLabelTextStyle.copyWith(
                        fontSize: height*0.03,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.pink
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pink
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                      ),
                      prefixText:'  ₹  ',
                      prefixStyle: kLabelTextStyle.copyWith(
                        fontSize: height*0.04
                      ),
                      hintText: '0.00',
                      hintStyle: kLabelTextStyle.copyWith(
                        fontSize: height*0.03,
                        color: Colors.grey
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: height*0.02,
                      right: height*0.02,
                      bottom: height*0.02,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          child: Text(
                            'TIP',
                            style: kLabelTextStyle.copyWith(
                                fontSize: height*0.03,
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tipPercent--;
                                });
                              },
                              child: CircleAvatar(
                                child: Icon(Icons.arrow_back_ios,
                                color: Colors.pink,),
                                backgroundColor: Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                    tipPercent.toString(),
                                    style: kLabelTextStyle.copyWith(
                                      fontSize: height*0.04,
                                    )
                                ),
                                Text(
                                  '%',
                                  style: kLabelTextStyle,
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tipPercent++;
                                });
                              },
                              child: CircleAvatar(
                                  child: Icon(Icons.arrow_forward_ios,
                                  color: Colors.pink,),
                                  backgroundColor: Colors.black
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height*0.02,
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 20.0,
                            ),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Colors.pink,
                            overlayColor: Color(0x29EB1555),
                          ),
                          child: Slider(
                            value: tipPercent.toDouble(),
                            min: 0.0,
                            max: 100.0,
                            onChanged: (double newValue) {
                              setState(() {
                                tipPercent = newValue.round();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: height*0.03,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text('SPLIT',
                                style: kLabelTextStyle.copyWith(
                                  fontSize: height*0.03,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if(people-1<1){
                                            _showSnackBar('Can\'t be less than 1');
                                            return;
                                          }
                                          people--;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.pink),
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        child: Icon(Icons.arrow_left,
                                          color: Colors.pink,)
                                      ),
                                    ),
                                    Text(people.toString(),
                                    style: kLabelTextStyle.copyWith(
                                      fontSize: height*0.03,
                                    ),),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          people++;
                                        });
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(2.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.pink),
                                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                                          ),
                                          child: Icon(Icons.arrow_right,
                                            color: Colors.pink,)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _calculateBill,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: height*0.025),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.pink,
                    child: Text('CALCULATE',
                      textAlign: TextAlign.center,
                      style: kLabelTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: height*0.035,
                      ),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  _showSnackBar(String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.pink,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: kLabelTextStyle.copyWith(
          color: Colors.white,
        ),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  _calculateBill(){
    setState(() {
      double totalTip=(amount*tipPercent)/100;
      tipPerPerson=_roundOff(totalTip/people);
      billPerPerson=_roundOff(amount/people);
      totalPerPerson=_roundOff((totalTip+amount)/people);
    });
  }

  double _roundOff(double value){
    String floatingValue=value.toString().substring(value.toString().indexOf('.'));
    String integer=value.toString().substring(0,value.toString().indexOf('.'));
    String floating=floatingValue.substring(0,2);
    double rounded=double.parse(integer+floating);
    return rounded;
  }
}

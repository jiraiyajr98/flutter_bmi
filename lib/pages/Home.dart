import 'package:flutter/material.dart';
import 'package:flutterbmi/constants/constant.dart';
import 'package:flutterbmi/model/bmi_model.dart';
import 'package:flutterbmi/pages/calculation.dart';
import 'package:flutterbmi/widgets/box_ui.dart';
import 'package:flutterbmi/widgets/icon_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color maleCardColor = kDefaultNotSelected;
  Color femaleCardColor = kDefaultNotSelected;
  int height = 130;
  int userWeight = 60;
  int userAge = 24;

  void updateUI(Gender gender) {
    if (gender == Gender.Male) {
      if (maleCardColor == kDefaultNotSelected) {
        maleCardColor = kDefaultSelected;
        femaleCardColor = kDefaultNotSelected;
      } else
        maleCardColor = kDefaultNotSelected;
    } else {
      if (femaleCardColor == kDefaultNotSelected) {
        femaleCardColor = kDefaultSelected;
        maleCardColor = kDefaultNotSelected;
      } else
        femaleCardColor = kDefaultNotSelected;
    }
  }

  void updateWeight(Weight weight) {
    weight == Weight.addWeight ? userWeight++ : userWeight--;
  }

  void updateAge(Age age) {
    age == Age.addAge ? userAge++ : userAge--;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GetBoxUI(
                        function: () {
                          setState(() {
                            updateUI(Gender.Male);
                          });
                        },
                        color: maleCardColor,
                        widget: IconAndText(
                          iconData: FontAwesomeIcons.mars,
                          text: "MALE",
                        )),
                  ),
                  Expanded(
                    child: GetBoxUI(
                        function: () {
                          setState(() {
                            updateUI(Gender.Female);
                          });
                        },
                        color: femaleCardColor,
                        widget: IconAndText(
                          iconData: FontAwesomeIcons.venus,
                          text: "FEMALE",
                        )),
                  ),
                ],
              ),
            )),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.all(7.0),
                  child: GetBoxUI(
                    color: kDefaultNotSelected,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HEIGHT",
                          style: kTextStyle,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberStyle,
                            ),
                            Text(
                              " cm",
                              style: kTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbColor: kAccentColor,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: kInActiveColor,
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0,
                                  disabledThumbRadius: 14.0),
                              overlayColor: kAccentColor.withAlpha(60)),
                          child: Slider(
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            value: height.toDouble(),
                            min: kMinHeight,
                            max: kMaxHeight,
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GetBoxUI(
                      color: kDefaultNotSelected,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: kTextStyle,
                          ),
                          Text(
                            userWeight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                function: () {
                                  setState(() {
                                    updateWeight(Weight.subWeight);
                                  });
                                },
                                iconData: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                function: () {
                                  setState(() {
                                    updateWeight(Weight.addWeight);
                                  });
                                },
                                iconData: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GetBoxUI(
                      color: kDefaultNotSelected,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: kTextStyle,
                          ),
                          Text(
                            userAge.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                function: () {
                                  setState(() {
                                    updateAge(Age.subAge);
                                  });
                                },
                                iconData: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                function: () {
                                  setState(() {
                                    updateAge(Age.addAge);
                                  });
                                },
                                iconData: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
            InkWell(
              onTap: (){

                BMIModel bmi = BMIModel(height: height,weight: userWeight);

                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text("Your Result"),
                      centerTitle: true,
                    ),
                    body: Calculation(bmiResult: bmi.calculateBmi(),
                    feedBack: bmi.feedBack(),
                    result: bmi.result(),),
                  )
                ));
              },
              child: Container(
                alignment: Alignment.center,
                color: Color(0xFFEA1556),
                width: double.infinity,
                height: kButtonHeight,
                child: Text("CALCULATE  YOUR  BMI", style: kCalculateText,),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Function function;
  final IconData iconData;

  RoundIconButton({@required this.function, @required this.iconData});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: function,
      elevation: 9.0,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
    );
  }
}

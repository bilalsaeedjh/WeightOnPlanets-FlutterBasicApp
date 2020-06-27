import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();

  bool checkboxValueA = false;
  bool checkboxValueB = false;
  bool checkboxValueC;
  int radioValue = 0;
  bool switchValue = false;
  double _finalResult = 0.0;
  String _planetName = "";

  void handleRadioValueChanged(int value) {
    /*
    Source: https://www.livescience.com/33356-weight-on-planets-mars-moon.html
      Mercury: 0.38
Venus: 0.91
Earth: 1.00
Mars: 0.38
Jupiter: 2.34
Saturn: 1.06
Uranus: 0.92
Neptune: 1.19
Pluto: 0.06
     */
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _planetName = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _planetName = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";

          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _planetName = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";

          break;
        default:
          print("Nothing selected!");
      }

//      print("Value is ${radioValue.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Different Planets"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),

      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            SizedBox(height: 30),
            new Image.asset(
              'images/earth2.png',
              height: 100.0,
              width: 100.0,
              /*fit: BoxFit.cover,*/
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.topCenter,
              child: new Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: 'Your Weight on Earth',
                          hintText: 'In pounds',
                          icon: new Icon(Icons.person_outline)),
                    ),
                  ),

                  new Padding(padding: new EdgeInsets.all(5.0)),
                  //three toggle buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radiobuttons go here
                      Flexible(
                        flex: 1,
                        child: new Radio<int>(
                            activeColor: Colors.brown,
                            value: 0,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged),
                      ),
                      new Text(
                        "Pluto",
                        style: new TextStyle(color: Colors.black),
                      ),
                      Flexible(
                        flex: 1,
                        child: new Radio<int>(
                            activeColor: Colors.red,
                            value: 1,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged),
                      ),
                      new Text(
                        "Mars",
                        style: new TextStyle(color: Colors.black),
                      ),
                      Flexible(
                        flex: 1,
                        child: new Radio<int>(
                            activeColor: Colors.orangeAccent,
                            value: 2,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged),
                      ),
                      new Text(
                        "Venus",
                        style: new TextStyle(color: Colors.black),
                      ),
                    ],
                  ),

                  //Result text
                  new Padding(padding: new EdgeInsets.all(15.0)),

                  new Text(
                    _weightController.text.isEmpty ? "Please enter weight" : _planetName +" lbs",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 130,),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: _textAnimationKit[1],
                  ),
                  Center(
                    child: _textAnimationKit[0],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.github),
            title: Text('Github'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.youtube),
            title: Text('Youtube'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
  int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      if(index==0){
        launch('https://github.com/bilalsaeedjh');
        _selectedIndex = index;
      }
      if(index==1){
        launch('https://www.youtube.com/channel/UCZSgQGG74K2yuEDnbG4U1tQ?view_as=subscriber');
        _selectedIndex = index;
      }

    });

  }
  List<Widget> _textAnimationKit=[
    TyperAnimatedTextKit(onTap: () {
        print("Tap Event");
      },
      text: [
        "See our other Flutter Examples on:",
        "Github,",
        "Youtube",
        "- Bilal Jh (Flutter Developer)",
      ],
      textStyle: TextStyle(fontSize: 20.0, fontFamily: "Bobbers",color:Colors.black),


      pause: Duration(seconds:  3),
      // speed: Duration(milliseconds:  1000),
    ),Align(
      alignment: Alignment.bottomRight,
      child: TextLiquidFill(
        text: 'Bilal Saeed Jh',
        waveColor: Colors.blue,
        waveDuration: Duration(milliseconds:700),
        loadDuration: Duration(seconds:20),
        boxBackgroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        boxHeight: 30,
      ),
    ), SizedBox(
      width: 250.0,
      child: TypewriterAnimatedTextKit(
        onTap: () {
          print("Tap Event");
        },
        text: [
          "Discipline is the best tool",
          "Design first, then code",
          "Do not patch bugs out, rewrite them",
          "Do not test bugs out, design them out",
        ],
        textStyle: TextStyle(fontSize: 30.0, fontFamily: "Agne"),
      ),
    ),];
  double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty &&  int.parse(weight) > 0){
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong!");
      return int.parse("180") * 0.38; // give a default weight! Be creative!
    }

  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'icons.dart';
import 'cards.dart';
import 'results.dart';
import 'calculation.dart';
import 'history.dart';

const ConbgColor = Color(0xff1D1E33);
const ConbgColor1 = Color(0xff111328);
const CalcBtColor = Colors.green;
int height = 150;
int weight = 40;
int age = 10;

enum Gender { male, female, none }

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Gender selectedgender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculator')),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!mounted) return;
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // ✅ Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // ✅ Overlay for readability
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              children: [
                // ✅ History Button
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HistoryScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.history),
                        label: const Text('History'),
                      ),
                    ],
                  ),
                ),
                // ✅ Gender Selection
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedgender = Gender.male;
                            });
                          },
                          child: Conbg(
                            colour: selectedgender == Gender.male
                                ? ConbgColor1
                                : ConbgColor,
                            childCard: IconCon(
                              gen: FontAwesomeIcons.mars,
                              text: 'MALE',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedgender = Gender.female;
                            });
                          },
                          child: Conbg(
                            colour: selectedgender == Gender.female
                                ? ConbgColor1
                                : ConbgColor,
                            childCard: IconCon(
                              gen: FontAwesomeIcons.venus,
                              text: 'FEMALE',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // ✅ Height Slider
                Expanded(
                  child: Conbg(
                    colour: ConbgColor,
                    childCard: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Text(
                            'HEIGHT',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xff8D8E98),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 50.0,
                              ),
                            ),
                            const Text('cm'),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 250.0,
                            onChanged: (double newvalue) {
                              setState(() {
                                height = newvalue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ✅ Weight and Age
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Conbg(
                          colour: ConbgColor,
                          childCard: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'WEIGHT',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(0xff8D8E98),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    weight.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 50.0,
                                    ),
                                  ),
                                  const Text('kg'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Buttons(
                                    icon: FontAwesomeIcons.minus,
                                    pressed: () {
                                      setState(() {
                                        weight = weight > 1 ? weight - 1 : 1;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10.0),
                                  Buttons(
                                    icon: FontAwesomeIcons.plus,
                                    pressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Conbg(
                          colour: ConbgColor,
                          childCard: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'AGE',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(0xff8D8E98),
                                ),
                              ),
                              Text(
                                age.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 50.0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Buttons(
                                    icon: FontAwesomeIcons.minus,
                                    pressed: () {
                                      setState(() {
                                        age = age > 1 ? age - 1 : 1;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10.0),
                                  Buttons(
                                    icon: FontAwesomeIcons.plus,
                                    pressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // ✅ Calculate Button
                GestureDetector(
                  onTap: () {
                    CalculatorBrain calc =
                        CalculatorBrain(height: height, weight: weight);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Results(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      );
                    }));
                  },
                  child: Container(
                    height: 55.0,
                    margin: const EdgeInsets.only(top: 15.0),
                    padding: const EdgeInsets.only(bottom: 20.0),
                    width: double.infinity,
                    color: CalcBtColor,
                    child: const Center(
                      child: Text(
                        'CALCULATE',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.icon, required this.pressed});

  final IconData icon;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}

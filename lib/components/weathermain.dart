import 'package:flutter/material.dart';

class WeatherMainContainer extends StatefulWidget {
  const WeatherMainContainer({super.key});

  @override
  State<WeatherMainContainer> createState() => _WeatherMainContainerState();
}

class _WeatherMainContainerState extends State<WeatherMainContainer> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height * 0.4;
    print(screenheight / 0.4);
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: screenheight),
          child: Row(
            children: <Widget>[
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 65),
                    child: Icon(
                      Icons.sunny,
                      size: 35.0,
                      semanticLabel: 'Weather icon',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Sunny and warm'),
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: '26',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 75.0)),
                      TextSpan(
                        text: '\u1d52',
                        style: TextStyle(
                          fontSize: 75.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

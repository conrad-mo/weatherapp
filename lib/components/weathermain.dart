import 'package:flutter/material.dart';
import '../main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherMainContainer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final description = ref.watch(descriptionProvider);
    final temperature = ref.watch(weathertempProvider);
    double screenheight = MediaQuery.of(context).size.height * 0.4;
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: screenheight),
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Icon(
                    Icons.sunny,
                    size: 35.0,
                    semanticLabel: 'Weather icon',
                  ),
                  Text(description),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: temperature.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 75.0)),
                      const TextSpan(
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
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ));
  }
}

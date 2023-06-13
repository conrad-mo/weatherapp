import 'package:flutter/material.dart';
import '../main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherMainContainer extends ConsumerWidget {
  const WeatherMainContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final description = ref.watch(descriptionProvider);
    final temperature = ref.watch(weathertempProvider);
    final fourofour = ref.watch(fourofourProvider);
    final iconindex = ref.watch(iconindexProvider);
    final iconlist = ref.watch(iconProvider);
    double screenheight = MediaQuery.of(context).size.height * 0.4;
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
          padding: EdgeInsets.only(bottom: screenheight),
          child: fourofour
              ? RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: '404',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 75.0)),
                    ],
                  ),
                )
              : Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        iconindex == 0
                            ? const Icon(
                                Icons.sunny,
                                size: 35.0,
                                semanticLabel: 'Weather icon',
                              )
                            : (iconindex == 1)
                                ? const Icon(
                                    Icons.cloud,
                                    size: 35.0,
                                    semanticLabel: 'Weather icon',
                                  )
                                : (iconindex == 2)
                                    ? const Icon(
                                        Icons.thunderstorm,
                                        size: 35.0,
                                        semanticLabel: 'Weather icon',
                                      )
                                    : const Icon(
                                        Icons.cloudy_snowing,
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 75.0)),
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
                )),
    );
  }
}

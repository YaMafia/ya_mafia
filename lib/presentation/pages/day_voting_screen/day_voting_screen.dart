import 'package:flutter/material.dart';
import 'package:ya_mafia/core/constants.dart';
import 'package:ya_mafia/core/navigation/delegate.dart';
import 'package:ya_mafia/core/theme/tailor_theme/my_theme.dart';
import 'package:ya_mafia/presentation/common/flip_clock.dart';
import 'package:ya_mafia/zgen/i18n/strings.g.dart';

import '../../common/seemless_appbar.dart';

class DayVotingScreen extends StatelessWidget {
  const DayVotingScreen({super.key, required this.seconds});

  final int? seconds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SeemlessAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODO change to sun picture
            Image.asset(
              'assets/images/sun.webp',
              width: 250,
            ),
            const SizedBox(
              height: appPadding * 2,
            ),
            Text(
              context.t.day,
              style: context.headline1Yellow,
            ),
            const SizedBox(
              height: appPadding * 2,
            ),
            if (seconds != null)
              CustomFlipClock(
                //TODO: add bloc here
                duration: Duration(seconds: seconds ?? 0),
                onDoneFunction: () {},
              ),
            const SizedBox(
              height: appPadding * 2,
            ),
            ElevatedButton(
                onPressed: () {
                  Nav.goCandidatesScreen();
                },
                child: Text(context.t.buttonText.weAreReady))
          ],
        ),
      ),
    );
  }
}

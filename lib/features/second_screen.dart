import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:for_lily/core/app_router.dart';
import 'package:lottie/lottie.dart';


@RoutePage()
class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = min(constraints.maxWidth, 300);
        final double height = constraints.maxHeight;
        final TextTheme textTheme = Theme.of(context).textTheme;
        return Material(
          color: Colors.white,
          child: Container(
            height: height,
            width: width,
            color: Colors.white,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, height * 0.4),
                    child: Text(
                      "Curhatanmu di Tumblr, Story Instagrammu yang lagi ngidam croissant 7.a.m, foto tercantikmu di Ranu Kumbolo, semuanya selalu menghiasi hari-hariku, Lily 🥰. Jadi please... cerialah lagi seperti sebelumnya. Cerialah demi orang-orang yang mencintaimu, keluargamu, sahabat-sahabatmu, teman-temanmu, dan juga penggemarmu 🥹.",
                      style: textTheme.titleSmall,
                      textAlign: TextAlign.center,
                      maxLines: 10,
                    )
                  )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Lottie.asset(
                    "assets/lovely_cats.json",
                    height: width * 1.2,
                    width: width * 1.2,
                    fit: BoxFit.contain
                  )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        context.router.push(ThirdRoute());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        elevation: 5,
                        shadowColor: Colors.black.withOpacity(0.3),
                        overlayColor: Colors.white
                      ),
                      child: Text(
                        "Next",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)
                      )
                    ),
                  )
                )
              ],
            )
          )
        );
      }
    );
  }
}
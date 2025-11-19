import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


@RoutePage()
class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
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
                Align(
                  alignment: Alignment.topCenter,
                  child: Lottie.asset(
                    "assets/hot_smiling_coffe.json",
                    height: width * 0.5,
                    width: width * 0.5,
                    fit: BoxFit.contain,
                  )
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, height * 0.1),
                    child: Text(
                      "Lily, meskipun sederhana, aku berharap surat digital ini bisa menghiburmu 💝. Jangan pernah lupa Lily, kamu berhak mendapatkan seluruh kebahagiaan Dunia 🫰.",
                      style: textTheme.titleMedium,
                      textAlign: TextAlign.center,
                      maxLines: 10,
                    )
                  )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Lottie.asset(
                      "assets/kitty_cat_error_404.json",
                      height: width * 0.7,
                      width: width * 0.7,
                      fit: BoxFit.contain
                    )
                  )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      " - Penggemar Rahasiamu \nyang ingin kamu selalu bahagia"
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
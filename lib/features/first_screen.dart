import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';


@RoutePage()
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Material(
          color: Colors.white,
          child: LayoutBuilder(
            builder: (context, contraints) {
              return Container(
                height: constraints.maxHeight,
                width: min(constraints.maxWidth, 300),
                color: Colors.white,
                child: Stack(
                  children: [

                  ],
                )
              );
            }
          ),
        );
      }
    );
  }
}
import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _doLoading();
  }

  Future<void> _doLoading() async {
    await Future.delayed(const Duration(seconds: 10));
    
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = min(constraints.maxWidth, 300);
        return Material(
          color: Colors.white,
            child: Container(
            height: constraints.maxHeight,
            width: width,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Lottie.asset(
                      "assets/lurking_cat.json",
                      height: width * 0.6,
                      width: width * 0.6,
                      fit: BoxFit.contain
                    ),
                  ),
                  Text(
                    "Loading", 
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Color(0xFF6062AC))
                  )
                ],
              )
            )
          ),
        );
      }
    );
  }
}
import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:for_lily/core/app_router.dart';
import 'package:lottie/lottie.dart';


@RoutePage()
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool loading = false;

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
                  alignment: Alignment.topRight,
                  child: Lottie.asset(
                    "assets/happy_bird.json",
                    height: width * 0.6,
                    width: width * 0.6,
                    fit: BoxFit.contain,
                  )
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Lily, aku tau kamu sedang patah hati 🥺. Tetapi, sama seperti si dia yang sebelumnya selalu menghiasi hari-harimu, kamu juga selalu menghiasi hari-hari seseorang yang menyukaimu. Contohnya, aku, penggemar rahasiamu 💌.",
                      style: textTheme.titleMedium,
                      textAlign: TextAlign.center,
                      maxLines: 10,
                    )
                  )
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Lottie.asset(
                      "assets/goldfish.json",
                      height: width * 0.4,
                      width: width * 0.4,
                      fit: BoxFit.contain
                    )
                  )
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Lottie.asset(
                    "assets/no_activity_cat.json",
                    height: width * 0.65,
                    width: width * 0.65,
                    fit: BoxFit.contain
                  )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        final databaseRef = FirebaseDatabase.instanceFor(
                          databaseURL: "https://for-lily-project-default-rtdb.asia-southeast1.firebasedatabase.app/",
                          app: Firebase.app()
                        ).ref();
                        final path = 'messages'; 
                        final messageData = {
                          'text': 'Moving to SecondScreen',
                          'timestamp': DateTime.now().millisecondsSinceEpoch,
                          'senderId': 'app',
                        };
                        await databaseRef.child(path).push().set(messageData).catchError((error) {
                          debugPrint('Failed to connect: $error');
                        });
                        setState(() {
                          loading = false;
                        });
                        if(!context.mounted) return;
                        context.router.push(SecondRoute());
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
                      child: loading 
                      ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.transparent,
                        )
                      ) 
                      : Text(
                        "Next",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)
                      )
                    )
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
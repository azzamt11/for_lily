import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:for_lily/core/app_router.dart';
import 'package:lottie/lottie.dart';


@RoutePage()
class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
                  alignment: Alignment.topCenter,
                  child: Lottie.asset(
                    "assets/cat_in_a_rocket.json",
                    height: width * 0.7,
                    width: width * 0.7,
                    fit: BoxFit.contain
                  )
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, height * 0.15, 20, 0),
                    child: Text(
                      "Aku tau patah hati memang sakit, dan mungkin aku nggak akan bisa ngerti rasa sakit yang kamu alami 🥺. Akupun waktu patah hati membutuhkan waktu yang cukup lama untuk pulih. Tapi kamu nggak boleh lupa, Lily, orang-orang yang mencintaimu akan selalu menantikan senyuman manismu 🥰.",
                      style: textTheme.titleSmall,
                      textAlign: TextAlign.center,
                      maxLines: 10,
                    )
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
                          'text': 'Moving to FourthScreen',
                          'timestamp': DateTime.now().millisecondsSinceEpoch,
                          'senderId': 'app',
                        };
                        await databaseRef.child(path).push().set(messageData).catchError((error) {
                          debugPrint('Failed to connect: $error');
                        });
                        if(!context.mounted) return;
                        context.router.push(FourthRoute());
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
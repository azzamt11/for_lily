import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';


@RoutePage()
class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Lottie.asset(
                      "assets/hot_smiling_coffe.json",
                      height: width * 0.5,
                      width: width * 0.5,
                      fit: BoxFit.contain,
                    ),
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
                          'text': 'Opening More',
                          'timestamp': DateTime.now().millisecondsSinceEpoch,
                          'senderId': 'app',
                        };
                        await databaseRef.child(path).push().set(messageData).catchError((error) {
                          debugPrint('Failed to connect: $error');
                        });
                        if(!context.mounted) return;
                        await showDialog(
                          context: context, 
                          builder: (context) {
                            return Container(
                              width: min(constraints.maxWidth * 0.7, 200),
                              decoration: BoxDecoration(
                                border: Border.all(color:  Color(0xFF6062AC), width: 1),
                                borderRadius: BorderRadius.circular(17),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                spacing: 10,
                                children: [
                                  Text(
                                    "Lily, in case that you need this information, Aplikasi web ini aku buat dengan menggunakan Flutter dan juga Firebase realtime database. Kodingannya bisa lihat di sini",
                                    textAlign: TextAlign.center,
                                    style: textTheme.bodyMedium,
                                    maxLines: 5,
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      final Uri url = Uri.parse("https://github.com/azzamt11/for_lily");
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      }
                                    }, 
                                    child: Text(
                                      "https://github.com/azzamt11/for_lily"
                                    )
                                  ),
                                  Text(
                                    "Untuk hasil build web nya bisa kamu lihat di sini",
                                    textAlign: TextAlign.center,
                                    style: textTheme.bodyMedium,
                                    maxLines: 5,
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      final Uri url = Uri.parse("https://github.com/azzamt11/for_lily_web");
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      }
                                    }, 
                                    child: Text(
                                      "https://github.com/azzamt11/for_lily_web"
                                    )
                                  ),
                                  Text(
                                    "Eh.. Lily, punya pasangan anak IT ada banyak keuntungannya lho. Soalnya anak IT bisa mengerjakan banyak hal. Termasuk ini... hehe",
                                    textAlign: TextAlign.center,
                                    style: textTheme.bodyMedium,
                                    maxLines: 5,
                                  ),
                                ],
                              )
                            );
                          }
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        side: const BorderSide(
                          width: 1, 
                          color: Color(0xFF6062AC), // border color
                        ),
                        elevation: 5,
                        shadowColor: Colors.black.withOpacity(0.3),
                        overlayColor: Colors.white,
                      ),
                      child: loading 
                      ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Color(0xFF6062AC),
                          backgroundColor: Colors.transparent,
                        )
                      ) 
                      : Text(
                        "More",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Color(0xFF6062AC))
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
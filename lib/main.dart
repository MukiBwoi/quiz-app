import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/mediaquery.dart';
import 'package:quiz_app/provider/quiz_page.dart';
import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<QuizConfig>(
          create: (context) => QuizConfig(),
        ),
        ChangeNotifierProvider<MediaResponsive>(
          create: (context) => MediaResponsive(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'quiz app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlatformDetect(),
      ),
    );
  }
}

class PlatformDetect extends StatelessWidget {
  const PlatformDetect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaResponsive>(
      builder: (context, myType, child) {
        return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.minWidth > 600) {
            myType.isDesktop = true;
          } else {
            myType.isDesktop = false;
          }
          return const Home();
        });
      },
    );
  }
}

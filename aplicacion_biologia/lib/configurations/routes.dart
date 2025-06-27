import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/register_screen.dart';
import '../screens/questions_screen.dart';
import '../screens/comments_screen.dart';
import '../screens/results_screen.dart';

class Routes {
  static const String home = '/';
  static const String register = '/register';
  static const String questions = '/questions';
  static const String comments = '/comments';
  static const String results = '/results';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case questions:
        return MaterialPageRoute(builder: (_) => const QuestionsScreen());
      case comments:
        return MaterialPageRoute(builder: (_) => const CommentsScreen());
      case results:
        return MaterialPageRoute(builder: (_) => const ResultsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

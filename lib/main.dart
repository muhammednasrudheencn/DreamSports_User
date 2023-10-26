import 'package:dream_sports_user/blocs/bloc/splashbloc_bloc.dart';
import 'package:dream_sports_user/screens/screen_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DreamSports());
}

class DreamSports extends StatefulWidget {
  const DreamSports({super.key});

  @override
  State<DreamSports> createState() => _DreamSportsState();
}

class _DreamSportsState extends State<DreamSports> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashblocBloc()..add(InitialEvent()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Play'),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}

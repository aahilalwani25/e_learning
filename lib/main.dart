import 'package:e_learning_app/Views/Onboard%20Screen/bloc/onboard_bloc.dart';
import 'package:e_learning_app/Views/Onboard%20Screen/onboard_screen.dart';
import 'package:e_learning_app/Views/Signin%20Screen/bloc/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //from flutter_screenutil package
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();

  //set screen orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //set status bar
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //initialize screen orientation
    ScreenUtil.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (create)=>OnboardBloc()),
        BlocProvider(create: (create)=>SigninBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: OnboardScreen(),
      ),
    );
  }
}

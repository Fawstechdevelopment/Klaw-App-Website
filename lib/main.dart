import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klawapp/Bloc/AddSubject%20Bloc/add_subject_bloc.dart';
import 'package:klawapp/Bloc/DeleteSubject_Bloc/delete_bloc.dart';
import 'package:klawapp/Bloc/DraftSubjectBloc/draft_subject_bloc.dart';
import 'package:klawapp/Bloc/LoginBloc/login_bloc.dart';
import 'package:klawapp/Bloc/Published%20Subject%20Bloc/published_subject_bloc.dart';
import 'package:klawapp/Bloc/ToggleSubject%20Bloc/toggle_suject_bloc.dart';
import 'UI/Authentication/Login.dart';
import 'dart:html' as html;

import 'UI/Home.dart';
bool draftpage = false;
bool addSubjectpage = false;

void main() {
  runApp(
   MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 833), // Design size for the layout
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginBloc(),
            ),
            BlocProvider(
              create: (context) => AddSubjectBloc(),
            ),
            BlocProvider(
              create: (context) => PublishedSubjectBloc(),
            ),
            BlocProvider(
              create: (context) => DraftSubjectBloc(),
            ),
            BlocProvider(
              create: (context) => DeleteBloc(),
            ),

            BlocProvider(
              create: (context) => ToggleSujectBloc(),
            ),
          ],
          child: MaterialApp(
            title: 'Klaw App',
          home: Login(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),

          ),
        );
      },
    );
  }
}

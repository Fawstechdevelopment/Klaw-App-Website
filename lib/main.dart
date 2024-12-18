import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:klawapp/Bloc/AddSubject%20Bloc/add_subject_bloc.dart';
import 'package:klawapp/Bloc/Contact%20Bloc/contact_bloc.dart';
import 'package:klawapp/Bloc/Editing%20Subject%20Bloc/editing_subject_bloc.dart';
import 'package:klawapp/Bloc/LoginBloc/login_bloc.dart';
import 'package:klawapp/Bloc/Pulished%20Subject%20Bloc/published_bloc.dart';
import 'package:klawapp/UI/Interface/DashBoard.dart';
import 'Bloc/DeleteSubject_Bloc/delete_bloc.dart';
import 'Bloc/DraftSubjectBloc/draft_subject_bloc.dart';
import 'Bloc/ToggleSubject Bloc/toggle_suject_bloc.dart';
import 'UI/Authentication/Login.dart';
import 'UI/Admin_Adding_Pages/Home.dart';


void main() {
  runApp(
    MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 833), // Design size for the layout
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            //Contact
            BlocProvider(
              create: (context) => ContactBloc(),
            ),




            BlocProvider(
              create: (context) => LoginBloc(),
            ),


            BlocProvider(
              create: (context) => PublishedBloc(),
            ),
            BlocProvider(
              create: (context) => AddSubjectBloc(),
            ),
            BlocProvider(
              create: (context) => DraftSubjectBloc(),
            ),
            BlocProvider(
              create: (context) => DeleteBloc(),
            ),
            //
            BlocProvider(
              create: (context) => ToggleSujectBloc(),
            ),

            BlocProvider(
              create: (context) => EditingSubjectBloc(),
            ),

          ],
          child: MaterialApp.router(
            theme: ThemeData( primarySwatch: Colors.blue,),
            debugShowCheckedModeBanner: false,
            routerDelegate: _router.routerDelegate,
            routeInformationParser: _router.routeInformationParser,
            routeInformationProvider: _router.routeInformationProvider,
          ),
        );
      },

    );
  }
  final GoRouter _router = GoRouter(
    initialLocation: '/KlawWebsite/Home', // Start with the Intro Page
    routes: [
      GoRoute(
        path: '/KlawWebsite/:Home',
        builder: (context, state) {
          final KLawroute = state.pathParameters['Home'] ?? 'Home';
          return KlawDashBoard(selectedPage: KLawroute,);
        },
      ),

      // Introductory Page
      GoRoute(
        path: '/Login',
        builder: (context, state) => const Login(),
      ),

      // Parent Page with dynamic routes for headings
      GoRoute(
        path: '/parent/:Usage',
        builder: (context, state) {
          final heading = state.pathParameters['Usage'] ?? 'Usage';
          return DashBord(selectedHeading: heading);
        },
      ),
    ],
  );
}

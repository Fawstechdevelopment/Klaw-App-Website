import 'dart:html' as html;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klawapp/UI/AddSubject.dart';
import 'package:klawapp/UI/BlogCreation.dart';
import 'package:klawapp/UI/DraftPage.dart';
import 'package:klawapp/UI/Showing%20subject.dart';
import 'package:klawapp/UI/Usage.dart';
import 'package:klawapp/UI/UserManagement.dart';

import '../main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  String selectedPage = 'usage_details';
  final List<String> pageStack = [];

  @override
  void initState() {
    super.initState();
    // Initialize the browser history with the initial page
    html.window.history.replaceState(null, 'Flutter Web', '/usage_details');

    // Add event listener to handle browser back button (popstate)
    html.window.onPopState.listen((event) {
      _handleBrowserBack();
    });
  }

  void _navigateTo(String page) {
    if (selectedPage != page) {
      setState(() {
        selectedPage = page;
        if (pageStack.isEmpty || pageStack.last != page) {
          pageStack.add(page);
          print(' page number '+ pageStack.toString());
          html.window.history.pushState(null, 'Flutter Web', '/$page');
        }
      });
    }
  }

  void _navigateToAddSubject() => _navigateTo('addsubject');

  void _navigateToDraftPage() => _navigateTo('draftpage');

  void _navigateBack() {
    if (pageStack.length > 1) {
      setState(() {
        pageStack.removeLast();
        selectedPage = pageStack.last;
        html.window.history.replaceState(null, 'Flutter Web', '/$selectedPage');
      });
    }
  }

  void _handleBrowserBack() {
    if (pageStack.length > 1) {
      setState(() {
        pageStack.removeLast();
        print(' back number '+ pageStack.toString());
        selectedPage = pageStack.last;
      });
    } else {
      // Prevent the stack from becoming empty
      html.window.history.pushState(null, 'Flutter Web', '/$selectedPage');
    }
  }

  Widget _buildDynamicContent() {
    switch (selectedPage) {
      case 'usage_details':
        return Usage(onBack: _navigateBack);
      case 'blogcreation_deatils':
        return Blogcreation(onBack: _navigateBack);
      case 'showing_subject_deatils':
        return ShowingSubject(
          onBack: _navigateBack,
          onNavigate: _navigateToAddSubject,
          onNavigateDraft: _navigateToDraftPage,
        );
      case 'user_management_details':
        return Usermanagement(onBack: _navigateBack);
      case 'addsubject':
        return Addsubject(onBack: _navigateBack);
      case 'draftpage':
        return Draftpage(onBack: _navigateBack, onNavigate: _navigateToDraftPage);
      default:
        return Usage(onBack: _navigateBack);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Static Section: Master List of Items
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blueGrey.shade50,
              child: ListView(
                children: [

                  ListTile(

                    title:  Text(
                        'Usage',
                        textAlign: TextAlign.center,
                        style:GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: const Color(0xFF006039), // Default text color
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),)),

                        onTap: () {
                      _navigateTo('usage_details');
                    },
                  ),
                  Divider(color:  Colors.green[300],),

                  ListTile(

                    title: Text(
                        'Blog Creation',
                        textAlign: TextAlign.center,
                        style:GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color:const Color(0xFF006039),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),)
                    ),
                    onTap: () {
                      _navigateTo('blogcreation_deatils');
                    },
                  ),
                  Divider(color:  Colors.green[300],),

                  ListTile(

                    title: Text(
                        'Add Subject',
                        textAlign: TextAlign.center,
                        style:GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color:  const Color(0xFF006039),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),)
                    ),

                    onTap: () {
                      _navigateTo('showing_subject_deatils');
                    },
                  ),
                  Divider(color:  Colors.green[300],),

                  ListTile(

                    title:   Text(
                      'Management',
                      textAlign: TextAlign.center,
                      style:GoogleFonts.notoSans(
                        textStyle: TextStyle(
                          color:  const Color(0xFF006039),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),),
                    ),
                    onTap: () {
                      _navigateTo('user_management_details');
                    },
                  ),
                  Divider(color:  Colors.green[300],),

                ],
              ),
            ),
          ),Container(width: 2.w,color: Colors.green,),
          // Dynamic Section: Handling right panel content
          Expanded(
            flex: 5,
            child: _buildDynamicContent(),
          ),
        ],
      ),
    );
  }
}



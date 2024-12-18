import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klawapp/UI/Admin_Adding_Pages/AddSubject.dart';
import 'package:klawapp/UI/Admin_Adding_Pages/BlogCreation.dart';
import 'package:klawapp/UI/Admin_Adding_Pages/DraftPage.dart';
import 'package:klawapp/UI/Admin_Adding_Pages/EditSubject.dart';
import 'package:klawapp/UI/Admin_Adding_Pages/Showing%20subject.dart';
import 'package:klawapp/UI/Admin_Adding_Pages/UserManagement.dart';

import '../Authentication/Login.dart';
import 'Usage.dart';

class DashBord extends StatelessWidget {
  final String selectedHeading;
  const DashBord({
    required this.selectedHeading
  });
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text(
            "DASH BOARD",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                )),
          )),actions: [GestureDetector(
        onTap: ()=>   GoRouter.of(context).go('/KlawWebsite/Home'),
        child: Row(
          children: [ Text(
            'LOGOUT  ',
            style:GoogleFonts.notoSans(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),),
            Icon(Icons.logout_outlined,color: Colors.white,size: 30.sp,),SizedBox(width: 10.w,)
          ],
        ),
      )],
        backgroundColor: const Color(0xFF006039),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.white,
width: 250.w
            ,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () => context.go('/parent/Usage'), // Navigate to Heading 1
                  child: Text(
                    'Usage',
                    style:GoogleFonts.notoSans(
                      textStyle:  TextStyle(
                      color: selectedHeading == 'Usage' ? Colors.green :const Color(0xFF006039),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),),
                ),
                Divider(color:Color(0xFF006039),thickness: 1.sp,),

                TextButton(
                  onPressed: () => context.go('/parent/Blog Creation'), // Navigate to Heading 2
                  child: Text(
                    'Blog Creation',
                      style:GoogleFonts.notoSans(
                        textStyle:  TextStyle(
                          color: selectedHeading == 'Blog Creation' ? Colors.green :const Color(0xFF006039),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                  ),
                ),
                Divider(color: Color(0xFF006039),thickness: 1.sp,),

                TextButton(
                  onPressed: () => context.go('/parent/Add Subject'), // Navigate to Heading 3
                  child: Text(
                    'Add Subject',
                      style:GoogleFonts.notoSans(
                        textStyle:  TextStyle(
                          color: selectedHeading == 'Add Subject' ? Colors.green :const Color(0xFF006039),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                  ),
                ),
                Divider(color:Color(0xFF006039),thickness: 1.sp,),

                TextButton(
                  onPressed: () => context.go('/parent/User Management'), // Navigate to Heading 3
                  child: Text(
                    'User Management',
                      style:GoogleFonts.notoSans(
                        textStyle:  TextStyle(
                          color: selectedHeading == 'User Management' ? Colors.green :const Color(0xFF006039),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                  ),
                ),
                Divider(color:Color(0xFF006039),thickness: 1.sp,),

              ],
            ),
          ),

          Container(width: 4.w,color: Colors.green,),
          SizedBox(width: 1170.w,
            child: Center(
              child: _getContentForHeading(selectedHeading),
            ),
          ),
        ],
      ),
    );
  }

  // Function to determine the widget for the selected heading
  Widget _getContentForHeading(String heading) {
    switch (heading) {
      case 'Usage':
        return  Usage( );
      case 'Blog Creation':
        return Blogcreation();
      case 'Add Subject':
        return ShowingSubject();
      case 'User Management':
        return Usermanagement();
      case 'Draftpage':
        return Draftpage();
      case 'Addsubject':
        return Addsubject();
      case 'subject editing':
        return Editsubject(subjectid: '',);
      default:
        return Usage();
    }
  }
}

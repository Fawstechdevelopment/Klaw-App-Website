import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klawapp/UI/Interface/About.dart';
import 'package:klawapp/UI/Interface/Contact.dart';
import 'package:klawapp/UI/Interface/Home.dart';

class KlawDashBoard extends StatelessWidget {
  final String selectedPage;

  const KlawDashBoard({required this.selectedPage});
  // Function to determine the widget for the selected heading

  @override
  Widget build(BuildContext context) {
    print("hello"+selectedPage);
    return Scaffold(
      appBar:
      AppBar(automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF006039),
        toolbarHeight: 92.h,
        title: Row(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 119.w,
              height: 127.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/klawlogo.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(top: 60.h),
              child: SizedBox(
                width: 307.w,
                height: 127.h,
                child: Text(
                  'KLAW APP',textAlign: TextAlign.start,
                  style:GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: const Color(0xFFFBFFFD),
                      fontSize: 45.sp,
                      fontWeight: FontWeight.w900,
                    ),),
                ),
              ),
            ),

            SizedBox(width: 485.w),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => context.go('/KlawWebsite/Home'),
                    child: Text('Home',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color:   selectedPage == 'Home'?  Colors.white :  Colors.black, // Default text color
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 46.w,
                  ),
                  InkWell(
                      onTap: () => context.go('/KlawWebsite/About'),

                    child: Text('About',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: selectedPage == 'About'
                                ?Colors.white:  Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 46.w,
                  ),
                  InkWell(
                    onTap: () => context.go('/KlawWebsite/Contact'),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Contact',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.notoSans(
                            textStyle: TextStyle(
                              color:    selectedPage == 'Contact'
                                  ? Colors.white:Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),



                ],
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(width: 1440.w,
        child: Center(
          child: _getContentForHeading(selectedPage),
        ),
      ),
    );
  }
  Widget _getContentForHeading(String heading) {
    switch (heading) {
      case 'Home':
        print("hello1"+heading);
        return  Home();
      case 'About':
        return About();
      case 'Contact':
        return Contact();
      default:
        return Container(width: 200,height:100,color: Colors.red);
    }
  }

}

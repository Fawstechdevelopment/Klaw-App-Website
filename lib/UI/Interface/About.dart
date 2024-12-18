import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Footer.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 80.w,top: 95.h,right: 40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 525.w,
                  height: 159.h,
                  child: Text(
                    'ABOUT US',
                    style:GoogleFonts.alexandria(
                      textStyle: TextStyle(
                        color:Color(0xFF006039),
                        fontSize: 86.sp,
                        fontWeight: FontWeight.w700,),
                    ),),
                ),
                SizedBox(
                  width: 786.w,
                  height: 316.h,
                  child: Text(
                      'Lorem ipsum dolor sit amet consectetur. Consectetur suspendisse amet nibh dis a ac tempor integer. Netus sed sed tortor urna. Sit amet placerat purus ut eu aliquet neque et ultricies. Lacus sed ultrices eu eu neque. Et ultricies eget facilisis quis nibh et odio convallis diam. Laoreet aliquam nec tellus dictumst. Sodales nunc feugiat turpis commodo nec amet cursus.\nSit nunc ac odio scelerisque nam scelerisque. Egestas semper odio arcu mauris eu. Vitae et felis hendrerit nec.',
                      textAlign: TextAlign.justify,
                      style:GoogleFonts.assistant(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                        ),)
                  ),
                ),

              ],
            ),),
SizedBox(height: 200.h,),
      Container(
        width: 1539.w,
        height: 755.h,
        decoration: ShapeDecoration(
          color: Color(0xFF03B96F),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 5.w, color: Color(0xFF07C377)),
          ),
        ),child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
            width: 747.w,
            height: 449.h,
            child: Text(
              'Lorem ipsum dolor sit amet consectetur. Consectetur suspendisse amet nibh dis a ac tempor integer. Netus sed sed tortor urna. Sit amet placerat purus ut eu aliquet neque et ultricies. Lacus sed ultrices eu eu neque. Et ultricies eget facilisis quis nibh et odio convallis diam. Laoreet aliquam nec tellus dictumst. Sodales nunc feugiat turpis commodo nec amet cursus.\nSit nunc ac odio scelerisque nam scelerisque. Egestas semper odio arcu mauris eu. Vitae et felis hendrerit nec.',
              textAlign: TextAlign.justify,
              style:GoogleFonts.assistant(
                textStyle: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontFamily: 'Assistant',
                fontWeight: FontWeight.w400,
                ),
              ),
            ),
                  ),

SizedBox(width: 80.w,),
            SizedBox(
              width: 415.w,
              height: 268.h,
              child: Text(
                'OUR\nMISSION',
                style:GoogleFonts.assistant(
                  textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 85.sp,
                  fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
          SizedBox(height: 112.h,),
          Footer()
        ],),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klawapp/UI/Authentication/Login.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return     Container(
      width: 1440.w,
      height: 286.h,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color:const Color(0xFF006039),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
      ),child: Padding(
        padding:  EdgeInsets.only(top:53.h),
        child: Row(
             // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(width: 57.w,),
          Container(
            width: 154.w,
            height: 164.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/klawlogo.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),


          SizedBox(width: 200.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 90.w,
                  height: 22.h,
                  child: Text(
                    'OUR PRODUCT',
                    style:GoogleFonts.assistant(
                      textStyle: TextStyle(
                        color: Color(0xFF191919),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )),
              SizedBox(height: 7.h,),
              SizedBox(
                width: 50.w,
                height: 22.h,
                child: Text(
                  'HELP',
                  style:GoogleFonts.assistant(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),

              SizedBox(height: 7.h,),
              SizedBox(
                width: 100.w,
                height: 22.h,
                child: Text(
                  'PRICING',
                  style:GoogleFonts.assistant(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      )                    ),
                ),
              ),
              SizedBox(height: 7.h,),
              SizedBox(
                width: 100.w,
                height: 22.h,
                child: Text(
                  'PRIVACY POLICY',
                  style:GoogleFonts.assistant(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      )                    ),
                ),
              )
            ],
          ),
          SizedBox(width: 45.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [  SizedBox(
                width: 90.w,
                height: 22.h,
                child: Text(
                  'COMPANY',
                  style:GoogleFonts.assistant(
                    textStyle: TextStyle(
                      color: const Color(0xFF191919),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),




              SizedBox(height: 7.h,),
              InkWell(
                onTap:() => context.go('/KlawWebsite/Home'),
                child: SizedBox(
                  width: 100.w,
                  height: 22.h,
                  child: Text(
                    'Home',
                    style:GoogleFonts.assistant(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        )                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.h,),
              InkWell(
                onTap: ()=> context.go('/KlawWebsite/About'),
                child: SizedBox(
                  width: 100.w,
                  height: 22.h,
                  child: Text(
                    'ABOUT US',
                    style:GoogleFonts.assistant(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        )                    ),
                  ),
                ),
              ),

              SizedBox(height: 7.h,),
              InkWell(
                onTap:() => context.go('/KlawWebsite/Contact'),

                child: SizedBox(
                  width: 100.w,
                  height: 22.h,
                  child: Text(
                    'CONTACT US',
                    style:GoogleFonts.assistant(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        )                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.h,),

              InkWell(onTap: ()  => context.go('/Login'),
                child: SizedBox(
                  width: 100.w,
                  height: 22.h,
                  child: Text(
                    'Login',
                    style:GoogleFonts.assistant(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                    ),
                  ),
                ),
              ),
            ],),

// SizedBox(width: 181.w,),
//           Opacity(
//             opacity: 0.70,
//             child: Text(
//               'Social Media',
//               style:GoogleFonts.assistant(
//                 textStyle:  TextStyle(
//                 color: Colors.white,
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),),
//           ),

        ],
            ),
      ),
    );
  }
}

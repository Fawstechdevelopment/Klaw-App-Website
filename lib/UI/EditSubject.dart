import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Editsubject extends StatefulWidget {
  final VoidCallback onBack;
  const Editsubject({super.key, required this.onBack});

  @override
  State<Editsubject> createState() => _EditsubjectState();
}

class _EditsubjectState extends State<Editsubject> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController coursecodecontroller = TextEditingController();
  TextEditingController universitycontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [ MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap:(){
              widget.onBack();
            } ,
            child: SizedBox(
              width: 177.w,
              height: 48.h,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 30.sp,
                    color: const Color(0xFF009357),
                  ),
                  Text(
                    'CANCEL',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: const Color(0xFF009357),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),],),
      body:  Padding(
          padding: EdgeInsets.only(left: 38.sp, top: 20.h),
          child: SingleChildScrollView(
            child: Form(key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Title / Course name :  ',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 27.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 438.w,
                        height: 60.h,
                        child: TextFormField(
                          controller: titlecontroller,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white, fontSize: 20.sp),
                          decoration: InputDecoration(
                            hintText: 'COMPUTER SCIENCE',
                            hintStyle: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xFF0ABC74),
                            // Green background color
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(15.r)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ),
                          ),
                          validator: (title) {
                            if (title!.isEmpty) {
                              return 'Enter a valid Username';
                            }

                            return null;
                          },
                          maxLines: 1, // No text wrapping
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 27.h),
                  Row(
                    children: [
                      Text(
                        'Course Code             :  ',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 27.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 438.w,
                        height: 60.h,
                        child: TextFormField(
                          controller: coursecodecontroller,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white, fontSize: 20.sp),
                          decoration: InputDecoration(
                            hintText: 'CS 014 ',
                            hintStyle: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xFF0ABC74),
                            // Green background color
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(15.r)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.circular(15.r)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ),
                          ),
                          validator: (cousecode) {
                            if (cousecode!.isEmpty) {
                              return 'Enter a valid Username';
                            }

                            return null;
                          },
                          maxLines: 1, // No text wrapping
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 27.h),
                  Row(
                    children: [
                      Text(
                        'University                  :  ',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 27.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 438.w,
                        height: 60.h,
                        child: TextFormField(
                          controller: universitycontroller,
                          cursorColor: Colors.white,
                          style: TextStyle(
                              color: Colors.white, fontSize: 20.sp),
                          decoration: InputDecoration(
                              hintText: 'KTU ',
                              hintStyle: GoogleFonts.notoSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xFF0ABC74),
                              // Green background color
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(15.r)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                  BorderRadius.circular(15.r)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                  BorderRadius.circular(15.r))),
                          maxLines: 1,
                          // No text wrapping
                          validator: (university) {
                            if (university!.isEmpty) {
                              return 'Enter a valid Username';
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 27.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discription                :  ',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 27.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 438.w,
                        height: 150.h,
                        child: TextFormField(
                          controller: descriptioncontroller,
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                          decoration: InputDecoration(
                            hintText:
                            'Lorem ipsum dolor sit amet consectetur. Id nullam pellentesque tempus consectetur nulla in convallis...',
                            hintStyle: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFF0ABC74),
                            // Green background color
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ),
                          ),
                          maxLines: 3,
                          // Limit text field height to avoid wrapping
                          validator: (discription) {
                            if (discription!.isEmpty) {
                              return 'Enter a valid Username';
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 219.90.w,
                          height: 69.h,
                          decoration: ShapeDecoration(
                            color: Color(0xFF0ABC74),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: GoogleFonts.notoSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klawapp/main.dart';

import 'Footer.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> images = [
    'assets/homelistimg.png',
    'assets/bookreading.png',
    'assets/focuslearing.png',
    'assets/personlized.png',
    'assets/stayontrack.png',
    'assets/studymatter.png',
  ];

  final List<String> text = [
     'simplify your study \nwith klaw',
    'AI-Powered \nCustom Notes',
    'Focused Learning',
    'Personalized to \nYour University ',
    'Stay on Track \nwith Klaw',
    'Study Smarter with \nBite-Sized Content',
  ];

  final List<String> subtext = [
    'ace your exams effortlessly with ai-generated notes tailored to your university curriculum. klaw breaks down complex subjects into easy-to-understand concepts, helping you focus on what really matters.\n\n',
   "Klaw analyzes your university syllabus and creates concise, tailored notes that highlight key concepts and exam-worthy content. Whether it's a tricky theory or a challenging problem, Klaw makes it simpler." ,
   "Don’t waste time wading through textbooks. Klaw’s notes are designed to cut through the noise, focusing on what you need to know for your exams. Study smart, not hard.",
   "No more generic study guides. Klaw’s AI understands the unique structure of your university’s courses, ensuring that the notes you receive are exactly aligned with your syllabus and exam patterns.",
   "With progress tracking and regular updates, Klaw helps you stay motivated and on top of your revision schedule. Crush your exams with confidence, one step at a time.",
"Klaw’s concise notes are broken down into digestible sections, making learning faster and more efficient. You’ll cover more ground in less time without feeling overwhelmed.",


  ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Padding(
            padding:  EdgeInsets.only(left: 168.w,top: 95.h),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 422.w,
                height: 342.h,
                child: Text(
                  'KLAW\nAPP',
                  style:GoogleFonts.notoSans(
                    textStyle: TextStyle(
                    color: Color(0xFF006039),
                    fontSize: 96.sp,
                   fontWeight: FontWeight.w900,),
                ),),
              ),
              SizedBox(
                width: 808.w,
                height: 361.h,
                child: Text(
                  'lorem ipsum dolor sit amet consectetur. consequat et eu cras libero. ultrices libero tincidunt eget mauris ut aenean. morbi sapien fermentum euismod id elit iaculis. fermentum ornare id duis convallis. sed neque sit neque natoque pharetra at vulputate. mattis blandit viverra elementum faucibus. egestas facilisis semper adipiscing scelerisque sed amet. nibh et blandit semper faucibus et sit. arcu in arcu scelerisque amet convallis eu. sed netus viverra penatibus mauris imperdiet et lacus. tristique ac nisl integer lectus. odio in nisi vel vitae semper. nisi ut quam integer sit curabitur id enim sed penatibus. ridiculus scelerisque tincidunt consequat quis nibh at auctor vitae.',
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
              width: 1438.w,
              height: 427.h,

              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.99, 0.16),
                  end: Alignment(0.99, -0.16),
                  colors: [Color(0xFF03B96E), Color(0xFF0BD07F)],
                ),
              ),child: Text(
              'Join over 10 million people learning on KLAW',
              style:GoogleFonts.inter(
                textStyle: TextStyle(
                color: Colors.black,
                fontSize: 58.sp,
                fontWeight: FontWeight.w500,
              ),),
            ),
            ),


      SizedBox(width: 1440.w,
        height: 480*images.length.h,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount:images.length,
          itemBuilder: (context, index) {
            bool isTextFirst = index % 2 == 0;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [

                  SizedBox(width: 100.w,),

                  if (isTextFirst) ...[
                    Image.asset(
                      images[index],
                      width: 320.w,
                      height: 320.h,
                    ),

                    SizedBox(width: 170.w),
                    Column(
                      children: [
                        SizedBox(
                          width: 725.w,
                          height: 180.h,
                          child: Text(
                            text[index],
                            textAlign: TextAlign.justify,
                            style:GoogleFonts.kronaOne(
                              textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),),
                        ),

                        SizedBox(
                          width: 725.w,
                          height: 192.29.h,
                          child: Text(

                            subtext[index],
                            textAlign: TextAlign.justify,
                            style:GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                            ),),
                          ),
                        )
                      ],
                    ),
                  ] else ...[
                    Column(
                      children: [
                        SizedBox(
                          width: 725.w,
                          height: 180.h,
                          child: Text(
                            text[index],
                            textAlign: TextAlign.justify,
                            style:GoogleFonts.kronaOne(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),),
                        ),

                        SizedBox(
                          width: 725.w,
                          height: 192.29.h,
                          child: Text(
                            subtext[index],
                            textAlign: TextAlign.justify,
                            style:GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),),
                          ),
                        )
                      ],
                    ),


                    SizedBox(width: 170.w),
                    Image.asset(
                      images[index],
                      width: 320.w,
                      height: 320.h,
                    ),
                  ],
                ],
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height:100.h ,); },
        ),
      ),
      Container(
        width: 1440.w,
        height: 558.h,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFF04BC71)),
        child: Padding(
          padding:  EdgeInsets.only(left: 112.w),
          child: Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 600.w,
                  child: Text(
                    'Learn and pass the exams \nfrom your mobile',
                    style:GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 46.sp,
                          fontWeight: FontWeight.w700,
                        )
                    ),
                  ),
                ),
                SizedBox(
                  width: 592.w,
                  child: Text(
                    'Download the app to learn all the subjects easily, keep track of the academic notifications .',
                    style:GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),),
                  ),
                )
              ],),
SizedBox(width: 26.w,),

              Image.asset("assets/phoneimg.png",width: 592.w,
                height: 558.h,fit: BoxFit.cover,),

            ],
          ),
        )
      ),
SizedBox(height: 112.h,),
            Footer()

          ],),
      )
      ,);
  }
}

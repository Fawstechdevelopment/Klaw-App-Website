import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Bloc/DraftSubjectBloc/draft_subject_bloc.dart';
import '../Repository/ModelClass/DraftSubjectModel.dart';

class Draftpage extends StatefulWidget {
  final VoidCallback onNavigate;
  final VoidCallback onBack;

  const Draftpage({super.key, required this.onNavigate, required this.onBack});

  @override
  State<Draftpage> createState() => _DraftpageState();
}

class _DraftpageState extends State<Draftpage> {
  int? draftselectedIndex;
  late DraftSubjectModel draftSubject;
  @override
  void initState() {

    BlocProvider.of<DraftSubjectBloc>(context).add(FeatchDraftSubject());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
      automaticallyImplyLeading: false,actions: [  GestureDetector(
      onTap:widget.onBack,
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width: 177.w,
          height: 48.h,
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                size: 30.sp,
                color: Color(0xFF009357),
              ),
              Text(
                'CANCEL',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Color(0xFF009357),
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
      body:  SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<DraftSubjectBloc, DraftSubjectState>(
                  builder: (context, state) {
                    if (state is DraftSubjectBlocLoading) {
                      return Center(
                        child: CircularProgressIndicator(),);
                    }
                    if (state is DraftSubjectBlocError) {
                      return Center(child: Text('Error'),);
                    }
                    if (state is DraftSubjectBlocLoaded) {
                      draftSubject = BlocProvider
                          .of<DraftSubjectBloc>(context)
                          .draftSubject;


                      return SizedBox(
                        width:1200.w,
                        height: 350 *  draftSubject.draft!.length.h,
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: draftSubject.draft!.length,
                          itemBuilder: (Buildcontext, position) {
                            return Stack(
                              children: [
                                Container(
                                  width: 860.w,
                                  height: 330.h,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 779.w,
                                        height: 302.h,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1.w),
                                            borderRadius:
                                            BorderRadius.circular(
                                                30.r),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(width: 20.w),
                                            Container(
                                              width: 205.w,
                                              height: 205.h,
                                              decoration: ShapeDecoration(
                                                color: Color(
                                                    0xFF006039),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        8.r)),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                    draftSubject
                                                        .draft![
                                                    position]
                                                        .courseCode
                                                        .toString(),
                                                    textAlign:
                                                    TextAlign.center,
                                                    style: GoogleFonts
                                                        .notoSans(
                                                      textStyle: TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontSize: 32
                                                            .sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .w700,
                                                      ),
                                                    ),)),
                                            ),
                                            SizedBox(width: 20.w),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                SizedBox(height: 40
                                                    .h),
                                                SizedBox(
                                                  width: 160.w,
                                                  height: 45.h,
                                                  child: Text(
                                                    draftSubject
                                                        .draft![position]
                                                        .title
                                                        .toString(),
                                                    style:
                                                    GoogleFonts
                                                        .notoSans(
                                                      textStyle: TextStyle(
                                                        color: Colors
                                                            .black,
                                                        fontSize: 27
                                                            .sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 30
                                                    .h),
                                                SizedBox(
                                                  width: 408.21.w,
                                                  height: 129.51.h,
                                                  child: Text(
                                                    draftSubject
                                                        .draft![position]
                                                        .description
                                                        .toString(),
                                                    style:
                                                    GoogleFonts
                                                        .notoSans(
                                                      textStyle: TextStyle(
                                                        color: Colors
                                                            .black,
                                                        fontSize: 12
                                                            .sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets
                                                  .only(
                                                  top: 20.h, left: 30
                                                  .w),
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    draftselectedIndex =
                                                    (draftselectedIndex ==
                                                        position)
                                                        ? null
                                                        : position;
                                                  });
                                                },
                                                child: Align(
                                                  alignment:
                                                  Alignment.topRight,
                                                  child: SizedBox(
                                                    width: 60.w,
                                                    height: 50.h,
                                                    child: Icon(
                                                      Icons
                                                          .edit_note_outlined,
                                                      size: 40.sp,
                                                      color: Colors
                                                          .black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (draftselectedIndex == position)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 730.w, top: 70.h),
                                    child: Container(
                                      width: 134.06.w,
                                      height: 120.h,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF03B96F),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(11.r),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x3F000000),
                                            blurRadius: 4.r,
                                            offset: Offset(4, 3),
                                            spreadRadius: 0.r,
                                          )
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          SizedBox(
                                            width: 129.20.w,
                                            height: 25.h,
                                            child: Text(
                                              'PUBLISH',
                                              textAlign: TextAlign
                                                  .center,
                                              style: GoogleFonts
                                                  .notoSans(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight
                                                      .w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(),
                                          SizedBox(
                                            width: 129.20.w,
                                            height: 23.h,
                                            child: Text(
                                              'EDIT',
                                              textAlign: TextAlign
                                                  .center,
                                              style: GoogleFonts
                                                  .notoSans(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight
                                                      .w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(),
                                          SizedBox(
                                            width: 129.20.w,
                                            height: 23.h,
                                            child: Text(
                                              'DELETE',
                                              textAlign: TextAlign
                                                  .center,
                                              style: GoogleFonts
                                                  .notoSans(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight
                                                      .w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              ],
                            );
                          },
                          separatorBuilder: (Buildcontext, position) {
                            return SizedBox(height: 20.h);
                          },
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  }
              ),
            ],
          ),
        ),
      ),

    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klawapp/Bloc/DeleteSubject_Bloc/delete_bloc.dart';
import 'package:klawapp/Bloc/ToggleSubject%20Bloc/toggle_suject_bloc.dart';

import '../../Bloc/DraftSubjectBloc/draft_subject_bloc.dart';
import '../../Repository/ModelClass/DeleteModelClass.dart';
import '../../Repository/ModelClass/DraftSubjectModel.dart';
import '../../Repository/ModelClass/ToggleModelClass.dart';

class Draftpage extends StatefulWidget {


  const Draftpage({super.key,});

  @override
  State<Draftpage> createState() => _DraftpageState();
}

class _DraftpageState extends State<Draftpage> {
  int? draftselectedIndex;
  late List<DraftSubjectModel> draftSubject;
  late DeleteModelClass delete;
  late ToggleModelClass toggle;
  bool isLoading = false;
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
        automaticallyImplyLeading: false,
        ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<DraftSubjectBloc, DraftSubjectState>(
                    builder: (context, state) {
                      if (state is DraftSubjectBlocLoading) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.green,),);
                      }
                      if (state is DraftSubjectBlocError) {
                        return const Center(child: Text('Error'),);
                      }
                      if (state is DraftSubjectBlocLoaded) {
                        draftSubject = BlocProvider
                            .of<DraftSubjectBloc>(context)
                            .draftSubject;


                        return SizedBox(
                          width: 1200.w,
                          height: 350 * draftSubject.length.h,
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: draftSubject.length,
                            itemBuilder: (Buildcontext, position) {
                              return Stack(
                                children: [
                                  SizedBox(
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
                                                  color: const Color(
                                                      0xFF006039),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          8.r)),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                      draftSubject[
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
                                                    width: 280.w,
                                                    height: 45.h,
                                                    child: Text(
                                                      draftSubject
                                                          [position]
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
                                                      draftSubject[position]
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
                                          color: const Color(0xFF03B96F),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(11.r),
                                          ),
                                          shadows: [
                                            BoxShadow(
                                              color: const Color(0x3F000000),
                                              blurRadius: 4.r,
                                              offset: const Offset(4, 3),
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
                                            BlocListener<ToggleSujectBloc,
                                                ToggleSujectState>(
                                              listener: (context, state) {
                                                if (state
                                                is ToggleBlocLoading) {

                                                  showDialog(
                                                    context: context,
                                                    builder: (
                                                        BuildContext context) {
                                                      return const Center(
                                                        child: CircularProgressIndicator(
                                                          color: Colors
                                                              .green,),
                                                      );
                                                    },
                                                  );


                                                }
                                                if (state
                                                is ToggleBlocError) {
                                                  Navigator.of(context)
                                                      .pop();


                                                }
                                                if (state
                                                is ToggleBlocLoaded) {
                                                  Navigator.of(context)
                                                      .pop();

                                                  BlocProvider.of<DraftSubjectBloc>(context)
                                                      .add(FeatchDraftSubject());



                                                  toggle = BlocProvider
                                                      .of<ToggleSujectBloc>(
                                                      context)
                                                      .togglesubject;


                                                }
                                              },
                                              child: InkWell(
                                                onTap: () {

                                                  BlocProvider.of<
                                                      ToggleSujectBloc>(context)
                                                      .add(FeatchToggle(
                                                      SubjectId: draftSubject[position]
                                                          .id
                                                          .toString()));


                                                },

                                                child: SizedBox(
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
                                              ),
                                            ),
                                            const Divider(),
                                            InkWell(onTap:(){} ,
                                              child: SizedBox(
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
                                            ),
                                            const Divider(),
                                            BlocListener<DeleteBloc,
                                                DeleteState>(
                                              listener: (context, state) {
                                                if (state is DeleteBlocLoading) {
                                                  if (kDebugMode) {
                                                    print("siginloading");
                                                  }

                                                }
                                                if (state is DeleteBlocError) {
                                                  Navigator.of(context).pop();

                                                  if (kDebugMode) {
                                                    print('error');
                                                  }
                                                }
                                                if (state is DeleteBlocLoaded) {



                                                  BlocProvider.of<DraftSubjectBloc>(context).add(FeatchDraftSubject());
                                                  delete = BlocProvider
                                                      .of<DeleteBloc>(context)
                                                      .deleteModel;


                                                }
                                              },
                                              child: InkWell(onTap: () {
                                                BlocProvider.of<DeleteBloc>(
                                                    context).add(FeatchDelete(
                                                    SubjectId: draftSubject[position]
                                                        .id
                                                        .toString()));

                                              },
                                                child: SizedBox(
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
                        return const SizedBox();
                      }
                    }
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

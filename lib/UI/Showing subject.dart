import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klawapp/Bloc/DeleteSubject_Bloc/delete_bloc.dart';
import 'package:klawapp/Bloc/Published%20Subject%20Bloc/published_subject_bloc.dart';
import 'package:klawapp/Bloc/ToggleSubject%20Bloc/toggle_suject_bloc.dart';
import '../Repository/ModelClass/DeleteModelClass.dart';
import '../Repository/ModelClass/PublishedSubjectModel.dart';
import '../Repository/ModelClass/ToggleModelClass.dart';
import '../main.dart';

class ShowingSubject extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onNavigate;
  final VoidCallback onNavigateDraft;
  final VoidCallback onNavigateEditingSubject;
  const ShowingSubject(
      {super.key,
      required this.onBack,
      required this.onNavigate,
      required this.onNavigateDraft, required this.onNavigateEditingSubject});

  @override
  State<ShowingSubject> createState() => _ShowingSubjectState();
}

class _ShowingSubjectState extends State<ShowingSubject> {
  int? publishedselectedIndex;
  var formkey = GlobalKey<FormState>();
  late PublishedSubjectModel subject;
  late DeleteModelClass delete;
  late ToggleModelClass toggle;

  @override
  void initState() {
    BlocProvider.of<PublishedSubjectBloc>(context)
        .add(FeatchPublishedSubjects());


    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, top: 30.h),
            child: Column(
              children: [
                addSubjectpage == false && draftpage == false
                    ? BlocBuilder<PublishedSubjectBloc, PublishedSubjectState>(
                        builder: (context, state) {
                        if (state is PublishedBlocLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is PublishedBlocError) {
                          return Center(
                            child: Text('Error in this page'),
                          );
                        }
                        if (state is PublishedBlocLoaded) {
                          subject =
                              BlocProvider.of<PublishedSubjectBloc>(context)
                                  .publishedsubject;

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 860.w,
                                height: 350 * subject.published!.length.h,
                                child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: subject.published!.length,
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
                                                    side:
                                                        BorderSide(width: 1.w),
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
                                                      decoration:
                                                          ShapeDecoration(
                                                        color:
                                                            Color(0xFF006039),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.r),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          subject
                                                              .published![
                                                                  position]
                                                              .courseCode
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .notoSans(
                                                            textStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 32.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
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
                                                        SizedBox(height: 40.h),
                                                        SizedBox(
                                                          width: 280.w,
                                                          height: 45.h,
                                                          child: Text(
                                                            subject
                                                                .published![
                                                                    position]
                                                                .title
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 27.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 30.h),
                                                        SizedBox(
                                                          width: 408.21.w,
                                                          height: 129.51.h,
                                                          child: Text(
                                                            subject
                                                                .published![
                                                                    position]
                                                                .description
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12.sp,
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
                                                      padding: EdgeInsets.only(
                                                          top: 20.h,
                                                          left: 30.w),
                                                      child: MouseRegion(
                                                        cursor: SystemMouseCursors.click,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              publishedselectedIndex =
                                                                  (publishedselectedIndex ==
                                                                          position)
                                                                      ? null
                                                                      : position;
                                                            });
                                                          },
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: SizedBox(
                                                              width: 60.w,
                                                              height: 50.h,
                                                              child: Icon(
                                                                Icons
                                                                    .edit_note_outlined,
                                                                size: 40.sp,
                                                                color:
                                                                    Colors.black,
                                                              ),
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
                                        if (publishedselectedIndex == position)
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
                                                      BorderRadius.circular(
                                                          11.r),
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
                                                  SizedBox(height: 5.h),
                                                  BlocListener<ToggleSujectBloc,
                                                      ToggleSujectState>(
                                                    listener: (context, state) {
                                                      if (state
                                                          is ToggleBlocLoading) {
                                                        print("siginloading");

                                                      }
                                                      if (state
                                                          is ToggleBlocError) {
                                                        Navigator.of(context)
                                                            .pop();

                                                        print('error');
                                                      }
                                                      if (state
                                                          is ToggleBlocLoaded) {

                                                        BlocProvider.of<PublishedSubjectBloc>(context)
                                                            .add(FeatchPublishedSubjects());



                                                        toggle = BlocProvider
                                                                .of<ToggleSujectBloc>(
                                                                    context)
                                                            .togglesubject;


                                                      }
                                                    },
                                                    child: InkWell(
                                                      onTap: () {
                                                        BlocProvider.of<
                                                                    ToggleSujectBloc>(
                                                                context)
                                                            .add(FeatchToggle(
                                                                SubjectId: subject
                                                                    .published![
                                                                        position]
                                                                    .objectId
                                                                    .toString()));



                                                      },
                                                      child: SizedBox(
                                                        width: 129.20.w,
                                                        height: 25.h,
                                                        child: Text(
                                                          'DRAFT',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .notoSans(
                                                            textStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(),
                                                  MouseRegion(
                                                    cursor: SystemMouseCursors.click,
                                                    child: GestureDetector(
                                                      onTap: widget.onNavigateEditingSubject,
                                                      child: SizedBox(
                                                        width: 129.20.w,
                                                        height: 23.h,
                                                        child: Text(
                                                          'EDIT',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              GoogleFonts.notoSans(
                                                            textStyle: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(),
                                                  BlocListener<DeleteBloc,
                                                      DeleteState>(
                                                    listener: (context, state) {
                                                      if (state
                                                          is DeleteBlocLoading) {
                                                        print("siginloading");


                                                      }
                                                      if (state
                                                          is DeleteBlocError) {
                                                        Navigator.of(context)
                                                            .pop();

                                                        print('error');
                                                      }
                                                      if (state
                                                          is DeleteBlocLoaded) {

                                                        BlocProvider.of<PublishedSubjectBloc>(context)
                                                            .add(FeatchPublishedSubjects());


                                                        delete = BlocProvider
                                                                .of<DeleteBloc>(
                                                                    context)
                                                            .deleteModel;

                                                      }
                                                    },
                                                    child: InkWell(
                                                      onTap: () {
                                                        BlocProvider.of<
                                                                    DeleteBloc>(
                                                                context)
                                                            .add(FeatchDelete(
                                                                SubjectId: subject
                                                                    .published![
                                                                        position]
                                                                    .objectId
                                                                    .toString()));

                                                      },
                                                      child: SizedBox(
                                                        width: 129.20.w,
                                                        height: 23.h,
                                                        child: Text(
                                                          'DELETE',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .notoSans(
                                                            textStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                                  FontWeight
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
                                          ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (Buildcontext, position) {
                                    return SizedBox(height: 20.h);
                                  },
                                ),
                              ),
                              Column(
                                children: [
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: widget.onNavigate,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 30.w),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: 153.w,
                                            height: 64.11.h,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF03B96F),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'ADD SUB',
                                                style: GoogleFonts.notoSans(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: widget.onNavigateDraft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 30.w, top: 10.h),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: 153.w,
                                            height: 64.11.h,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF03B96F),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Draft',
                                                style: GoogleFonts.notoSans(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return SizedBox();
                        }
                      })
                    : SizedBox(),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

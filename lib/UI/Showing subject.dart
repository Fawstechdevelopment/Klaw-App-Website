import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../main.dart';

class ShowingSubject extends StatefulWidget {

  const ShowingSubject({super.key});

  @override
  State<ShowingSubject> createState() => _ShowingSubjectState();
}

class _ShowingSubjectState extends State<ShowingSubject> {
TextEditingController titlecontroller=TextEditingController();
TextEditingController coursecodecontroller=TextEditingController();
TextEditingController universitycontroller=TextEditingController();
TextEditingController descriptioncontroller=TextEditingController();
  bool dropdownexpand = false;
  bool editmenu = false;
  bool drafteditmenu=false;

  List<PlatformFile>? _selectedFiles;
//File picker
  Future<void> _pickFiles() async {
    // Allow multiple files to be selected
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true, // Enables multiple file selection
      type: FileType.custom, // You can customize file types if needed
      allowedExtensions: [
        'pdf',
        'jpg',
        'jpeg',
        'png',
        'doc',
        'docx'
      ], // Allowing specific extensions
    );

    if (result != null && result.files.isNotEmpty) {
      // If the user has selected files
      setState(() {
        _selectedFiles = result.files; // Store the selected files
      });
    } else {
      // User canceled the picker
      setState(() {
        _selectedFiles = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        return
         addSubjectpage==true||draftpage==true?false: true;
      },
      child: Scaffold(
        body:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, top: 30.h),
            child: Column(
              children: [
                addSubjectpage == false && draftpage == false
                    ?
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 860.w,
                                height: 350 * 4.h,
                                child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 4,
                                  itemBuilder: (Buildcontext, position) {
                                    return Stack(
                                      children: [
                                        SizedBox( width: 860.w,height: 330.h,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 779.w,
                                                height: 302.h,
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(width: 1.w),
                                                    borderRadius:
                                                        BorderRadius.circular(30.r),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 20.w),
                                                    Container(
                                                      width: 205.w,
                                                      height: 205.h,
                                                      decoration: ShapeDecoration(
                                                        color: Colors.yellow,
                                                        image: DecorationImage(
                                                          image: AssetImage(""),
                                                          // Add your image asset path here
                                                          fit: BoxFit.fill,
                                                        ),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(8.r)),
                                                      ),
                                                    ),
                                                    SizedBox(width: 20.w),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        SizedBox(height: 40.h),
                                                        SizedBox(
                                                          width: 83.w,
                                                          height: 45.h,
                                                          child: Text(
                                                            'TITLE',
                                                            style: GoogleFonts.notoSans(
                                                              textStyle: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 27.sp,
                                                                fontWeight: FontWeight.w700,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 30.h),
                                                        SizedBox(
                                                          width: 408.21.w,
                                                          height: 129.51.h,
                                                          child: Text(
                                                            'Lorem ipsum dolor sit amet consectetur. Volutpat nunc dictum iaculis donec pharetra eget senectus. Eu a eget sagittis cursus auctor pulvinar. Lobortis enim pulvinar ut amet lobortis proin dui. Eget consectetur tellus sed eu imperdiet eget egestas mi mi. Sagittis vestibulum.',
                                                            style: GoogleFonts.notoSans(
                                                              textStyle: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight.w700,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 20.h, left: 30.w),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            editmenu =
                                                                !editmenu; // Toggle the visibility of the menu
                                                          });
                                                        },
                                                        child: Align(
                                                          alignment: Alignment.topRight,
                                                          child: SizedBox(
                                                            width: 60.w,
                                                            height: 50.h,
                                                            child: Icon(
                                                              Icons.edit_note_outlined,
                                                              size: 40.sp,
                                                              color: Colors.black,
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
                                        if (editmenu)
                                          Padding(
                                            padding: EdgeInsets.only(left: 730.w, top: 70.h),
                                            child: Container(
                                              width: 134.06.w,
                                              height: 120.h,
                                              decoration: ShapeDecoration(
                                                color: Color(0xFF03B96F),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(11.r),
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
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 5.h,),
                                                  SizedBox(
                                                    width: 129.20.w,
                                                    height: 25.h,
                                                    child: Text(
                                                      'DRAFT',textAlign: TextAlign.center,
                                                      style: GoogleFonts.notoSans(
                                                        textStyle: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(),
                                                  SizedBox(
                                                    width: 129.20.w,
                                                    height: 23.h,
                                                    child: Text(
                                                      'EDIT',textAlign: TextAlign.center,
                                                      style: GoogleFonts.notoSans(
                                                        textStyle: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(),
                                                  SizedBox(
                                                    width: 129.20.w,
                                                    height: 23.h,
                                                    child: Text(
                                                      'DELETE',textAlign: TextAlign.center,
                                                      style: GoogleFonts.notoSans(
                                                        textStyle: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.sp,
                                                          fontWeight: FontWeight.w700,
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
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        addSubjectpage = true;
                                        draftpage = false;
                                      });
                                    },
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
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        draftpage = true;
                                        addSubjectpage = false;
                                      });

                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(right: 30.w, top: 10.h),
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
                                ],
                              ),
                            ],
                          ) : SizedBox(),

                ///  ADD Subject Details
                if (addSubjectpage==true)
                  Padding(
                    padding: EdgeInsets.only(left: 38.sp, top: 20.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                addSubjectpage = false;
                              });
                            },
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
                          ),
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
                                child: TextField(controller:titlecontroller ,
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
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                  ),
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
                                child: TextField(controller:coursecodecontroller ,
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
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                  ),
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
                                child: TextField(controller:universitycontroller ,
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
                                  maxLines: 1, // No text wrapping
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
                                child: TextField(controller:descriptioncontroller ,
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
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                  ),
                                  maxLines:
                                      3, // Limit text field height to avoid wrapping
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 39.h),
                            child: Text('Choose your files .PDF/.TEXT',
                                style: GoogleFonts.notoSans(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 27.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 62.w, top: 36.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // "Choose file" button
                                      GestureDetector(
                                        onTap: _pickFiles,
                                        child: Container(
                                          width: 203.w,
                                          height: 53.h,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF0ABC74),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Choose file',
                                              style: GoogleFonts.notoSans(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 27.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 75.w),

                                      // File list container
                                      _selectedFiles != null &&
                                              _selectedFiles!.isNotEmpty
                                          ? Container(
                                              width: 386.w,
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(width: 1.w),
                                                  borderRadius:
                                                      BorderRadius.circular(15.r),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      SizedBox(width: 10.w),
                                                      SizedBox(
                                                        width: 180.w,
                                                        height: 40.h,
                                                        child: Text(
                                                          _selectedFiles![0].name,
                                                          // Show the first file's name
                                                          style: GoogleFonts
                                                              .notoSans(
                                                            textStyle: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight.w200,
                                                            ),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      SizedBox(
                                                        width: 90.w,
                                                        height: 40.h,
                                                        child: Text(
                                                          '${(_selectedFiles![0].size / (1024 * 1024)).toStringAsFixed(2)} MB',
                                                          // Show the first file's size
                                                          style: GoogleFonts
                                                              .notoSans(
                                                            textStyle: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight.w200,
                                                            ),
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                        height: 40.h,
                                                        child: Icon(
                                                            Icons
                                                                .delete_outline_outlined,
                                                            color: Colors.black),
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      // Dropdown Button to toggle file list
                                                      IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            dropdownexpand =
                                                                !dropdownexpand; // Toggle the dropdown state
                                                          });
                                                        },
                                                        icon: Icon(
                                                          dropdownexpand
                                                              ? Icons
                                                                  .arrow_drop_up
                                                              : Icons
                                                                  .arrow_drop_down,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // If the dropdown is expanded, show the additional files
                                                  dropdownexpand
                                                      ? Column(
                                                          children: List.generate(
                                                              _selectedFiles!
                                                                  .length,
                                                              (index) {
                                                            PlatformFile file =
                                                                _selectedFiles![
                                                                    index];
                                                            double fileSizeInMb =
                                                                file.size /
                                                                    (1024 * 1024);
                                                            return Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          5.h),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                      width: 5.w),
                                                                  SizedBox(
                                                                    width: 180.w,
                                                                    height: 40.h,
                                                                    child: Text(
                                                                      file.name,
                                                                      // Display the file name
                                                                      style: GoogleFonts
                                                                          .notoSans(
                                                                        textStyle:
                                                                            TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              20.sp,
                                                                          fontWeight:
                                                                              FontWeight.w200,
                                                                        ),
                                                                      ),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          15.w),
                                                                  SizedBox(
                                                                    width: 90.w,
                                                                    height: 40.h,
                                                                    child: Text(
                                                                      '${fileSizeInMb.toStringAsFixed(2)} MB',
                                                                      // Display the file size
                                                                      style: GoogleFonts
                                                                          .notoSans(
                                                                        textStyle:
                                                                            TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              20.sp,
                                                                          fontWeight:
                                                                              FontWeight.w200,
                                                                        ),
                                                                      ),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 5.w),
                                                                  // Delete icon
                                                                  SizedBox(
                                                                    width: 35,
                                                                    height: 40.h,
                                                                    child: Icon(
                                                                        Icons
                                                                            .delete_outline_outlined,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }),
                                                        )
                                                      : SizedBox(),
                                                  // If not expanded, show nothing
                                                ],
                                              ),
                                            )
                                          : SizedBox(),
                                      // If no file is selected, show nothing
                                    ]),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 283.w, top: 71.h),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      addSubjectpage = false;
                                    });
                                  },
                                  child: Container(
                                    width: 219.90.w,
                                    height: 69.h,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF0ABC74),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'PUBLISH',
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
                                SizedBox(width: 43.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      addSubjectpage = false;
                                    });
                                  },
                                  child: Container(
                                    width: 167.w,
                                    height: 69.h,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF0ABC74),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'DRAFT',
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          )
                        ],
                      ),
                    ),
                  ),

                /// ADD Draft Details Pages
                if (draftpage)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                draftpage = false;
                              });
                            },
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
                          ),
                          SizedBox(
                            width: 860.w,
                            height: 350 * 4.h,
                            child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              itemBuilder: (Buildcontext, position) {
                                return Stack(
                                  children: [
                                    Container( width: 860.w,height: 330.h,

                                      child: Row(
                                        children: [
                                          Container(
                                            width: 779.w,
                                            height: 302.h,
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(width: 1.w),
                                                borderRadius:
                                                BorderRadius.circular(30.r),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 20.w),
                                                Container(
                                                  width: 205.w,
                                                  height: 205.h,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.yellow,
                                                    image: DecorationImage(
                                                      image: AssetImage(""),
                                                      // Add your image asset path here
                                                      fit: BoxFit.fill,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(8.r)),
                                                  ),
                                                ),
                                                SizedBox(width: 20.w),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(height: 40.h),
                                                    SizedBox(
                                                      width: 83.w,
                                                      height: 45.h,
                                                      child: Text(
                                                        'TITLE',
                                                        style: GoogleFonts.notoSans(
                                                          textStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 27.sp,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 30.h),
                                                    SizedBox(
                                                      width: 408.21.w,
                                                      height: 129.51.h,
                                                      child: Text(
                                                        'Lorem ipsum dolor sit amet consectetur. Volutpat nunc dictum iaculis donec pharetra eget senectus. Eu a eget sagittis cursus auctor pulvinar. Lobortis enim pulvinar ut amet lobortis proin dui. Eget consectetur tellus sed eu imperdiet eget egestas mi mi. Sagittis vestibulum.',
                                                        style: GoogleFonts.notoSans(
                                                          textStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.sp,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 20.h, left: 30.w),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        drafteditmenu =
                                                        !drafteditmenu; // Toggle the visibility of the menu
                                                      });
                                                    },
                                                    child: Align(
                                                      alignment: Alignment.topRight,
                                                      child: SizedBox(
                                                        width: 60.w,
                                                        height: 50.h,
                                                        child: Icon(
                                                          Icons.edit_note_outlined,
                                                          size: 40.sp,
                                                          color: Colors.black,
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
                                    if (drafteditmenu)
                                      Padding(
                                        padding: EdgeInsets.only(left: 730.w, top: 70.h),
                                        child: Container(
                                          width: 134.06.w,
                                          height: 120.h,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF03B96F),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(11.r),
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
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 5.h,),
                                              SizedBox(
                                                width: 129.20.w,
                                                height: 25.h,
                                                child: Text(
                                                  'PUBLISH',textAlign: TextAlign.center,
                                                  style: GoogleFonts.notoSans(
                                                    textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider(),
                                              SizedBox(
                                                width: 129.20.w,
                                                height: 23.h,
                                                child: Text(
                                                  'EDIT',textAlign: TextAlign.center,
                                                  style: GoogleFonts.notoSans(
                                                    textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider(),
                                              SizedBox(
                                                width: 129.20.w,
                                                height: 23.h,
                                                child: Text(
                                                  'DELETE',textAlign: TextAlign.center,
                                                  style: GoogleFonts.notoSans(
                                                    textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.sp,
                                                      fontWeight: FontWeight.w700,
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
                          ),
                        ],
                      ),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
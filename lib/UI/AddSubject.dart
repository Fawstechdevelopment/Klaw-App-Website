import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Bloc/AddSubject Bloc/add_subject_bloc.dart';
import '../Repository/ModelClass/AddSubjectModel.dart';
import '../ToastMessage.dart';
class Addsubject extends StatefulWidget {
  final VoidCallback onBack;

  const Addsubject({super.key, required this.onBack});

  @override
  State<Addsubject> createState() => _AddsubjectState();
}

class _AddsubjectState extends State<Addsubject> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController coursecodecontroller = TextEditingController();
  TextEditingController universitycontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  late AddSubjectModel addSubject;
  bool dropdownexpand = false;
  List<PlatformFile>? _selectedFiles;
  var formkey = GlobalKey<FormState>();
  bool _isDialogVisible = false;


  Future<void> _pickFiles() async {
    // Allow multiple files to be selected
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true, // Enables multiple file selection
      type: FileType.custom, // You can customize file types if needed
      allowedExtensions: [
        'pdf',
        'txt',
      ], // Allowing specific extensions
    );

    if (result != null && result.files.isNotEmpty) {
      // If the user has selected files
      setState(() {
        _selectedFiles = result.files; // Store the selected files
      });
      if (kDebugMode) {
        print('pdfsubject$_selectedFiles');
      }
    } else {
      // User canceled the picker
      setState(() {
        _selectedFiles = [];
      });
    }
  }


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
      body: BlocListener<AddSubjectBloc, AddSubjectState>(
      listener: (context, state) {
        if (state is AddSubjectBlocLoading) {
          print("siginloading");
          // if (isLoading)
          if (!_isDialogVisible) {
            setState(() {
              _isDialogVisible = true;
            });
            showDialog(
              context: context,
              barrierDismissible: false, // Prevents dialog from being closed
              builder: (BuildContext context) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          }

        }
        if (state is AddSubjectBlocError) {


          print('error');
        }
        if (state is AddSubjectBlocLoaded) {
          addSubject = BlocProvider
              .of<AddSubjectBloc>(context)
              .addSubjectModel;
          titlecontroller.clear();
          coursecodecontroller.clear();
          universitycontroller.clear();
          descriptioncontroller.clear();
          _selectedFiles?.clear();

          if (_isDialogVisible) {
            Navigator.of(context).pop(); // Close the dialog
            setState(() {
              _isDialogVisible = false;
            });
          }


          ToastMessage().toastmessage(
              message: "Subject Added  Succesfully ");
        widget.onBack();


        }
      },
      child: Padding(
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
                        textInputAction: TextInputAction.next,
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
                        textInputAction: TextInputAction.next,
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
                        textInputAction: TextInputAction.next,
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
                Padding(
                  padding: EdgeInsets.only(top: 39.h),
                  child: Text('Choose your files .PDF/.TXT',
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
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            // "Choose file" button
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: _pickFiles,
                                child: Container(
                                  width: 203.w,
                                  height: 53.h,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF0ABC74),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          10.r),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Choose file',
                                      style: GoogleFonts.notoSans(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 27.sp,
                                          fontWeight:
                                          FontWeight.w400,
                                        ),
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
                                shape:
                                RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.w),
                                  borderRadius:
                                  BorderRadius.circular(
                                      15.r),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .center,
                                    children: [
                                      SizedBox(width: 10.w),
                                      SizedBox(
                                        width: 180.w,
                                        height: 40.h,
                                        child: Text(
                                          _selectedFiles![0]
                                              .name,
                                          // Show the first file's name
                                          style: GoogleFonts
                                              .notoSans(
                                            textStyle:
                                            TextStyle(
                                              color: Colors
                                                  .black,
                                              fontSize:
                                              20.sp,
                                              fontWeight:
                                              FontWeight
                                                  .w200,
                                            ),
                                          ),
                                          overflow:
                                          TextOverflow
                                              .ellipsis,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      SizedBox(
                                        width: 90.w,
                                        height: 40.h,
                                        child: Text(
                                          '${(_selectedFiles![0]
                                              .size / (1024 *
                                              1024))
                                              .toStringAsFixed(
                                              2)} MB',
                                          // Show the first file's size
                                          style: GoogleFonts
                                              .notoSans(
                                            textStyle:
                                            TextStyle(
                                              color: Colors
                                                  .black,
                                              fontSize:
                                              20.sp,
                                              fontWeight:
                                              FontWeight
                                                  .w200,
                                            ),
                                          ),
                                          overflow:
                                          TextOverflow
                                              .ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                        height: 40.h,
                                        child: Icon(
                                            Icons
                                                .delete_outline_outlined,
                                            color: Colors
                                                .black),
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
                                          color:
                                          Colors.black,
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
                                          PlatformFile
                                          file =
                                          _selectedFiles![
                                          index];
                                          double
                                          fileSizeInMb =
                                              file.size /
                                                  (1024 *
                                                      1024);
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
                                                    width:
                                                    5.w),
                                                SizedBox(
                                                  width:
                                                  180.w,
                                                  height:
                                                  40.h,
                                                  child:
                                                  Text(
                                                    file.name,
                                                    // Display the file name
                                                    style:
                                                    GoogleFonts
                                                        .notoSans(
                                                      textStyle:
                                                      TextStyle(
                                                        color: Colors
                                                            .black,
                                                        fontSize: 20
                                                            .sp,
                                                        fontWeight: FontWeight
                                                            .w200,
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
                                                  width:
                                                  90.w,
                                                  height:
                                                  40.h,
                                                  child:
                                                  Text(
                                                    '${fileSizeInMb
                                                        .toStringAsFixed(
                                                        2)} MB',
                                                    // Display the file size
                                                    style:
                                                    GoogleFonts
                                                        .notoSans(
                                                      textStyle:
                                                      TextStyle(
                                                        color: Colors
                                                            .black,
                                                        fontSize: 20
                                                            .sp,
                                                        fontWeight: FontWeight
                                                            .w200,
                                                      ),
                                                    ),
                                                    overflow:
                                                    TextOverflow
                                                        .ellipsis,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width:
                                                    5.w),
                                                // Delete icon
                                                SizedBox(
                                                  width:
                                                  35,
                                                  height:
                                                  40.h,
                                                  child:
                                                  InkWell(
                                                    onTap:
                                                        () {
                                                      setState(() {
                                                        _selectedFiles!
                                                            .removeAt(
                                                            index); // Remove the file at the specified index
                                                      });
                                                    },
                                                    child: Icon(
                                                        Icons
                                                            .delete_outline_outlined,
                                                        color: Colors
                                                            .black),
                                                  ),
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
                  padding:
                  EdgeInsets.only(left: 283.w, top: 71.h),
                  child: Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            print('pdfsubject'+ _selectedFiles.toString());


                            final isValid =
                            formkey.currentState?.validate();
                            if (isValid!) {
                              print('  api calling pfd taked');
                              BlocProvider.of<AddSubjectBloc>(
                                  context)
                                  .add(FeatchAddSubject(
                                  title: titlecontroller.text,
                                  coursecode:
                                  coursecodecontroller.text,
                                  university:
                                  universitycontroller.text,
                                  description:
                                  descriptioncontroller
                                      .text,
                                  status: 'published',
                                  subjectpdf: _selectedFiles!));
                              print('loadedpdf'+_selectedFiles.toString() );
                            }
                            formkey.currentState?.save();
                          },
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
                      ),
                      SizedBox(width: 43.w),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {

                            final isValid =
                            formkey.currentState?.validate();
                            if (isValid!) {
                              BlocProvider.of<AddSubjectBloc>(
                                  context)
                                  .add(FeatchAddSubject(
                                  title: titlecontroller.text,
                                  coursecode:
                                  coursecodecontroller.text,
                                  university:
                                  universitycontroller.text,
                                  description:
                                  descriptioncontroller
                                      .text,
                                  status: 'draft',
                                  subjectpdf:_selectedFiles!));
                            }
                            formkey.currentState?.save();

                          },
                          child: Container(
                            width: 167.w,
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
      ),
    ),);
  }
}

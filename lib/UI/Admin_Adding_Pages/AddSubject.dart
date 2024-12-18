import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bloc/AddSubject Bloc/add_subject_bloc.dart';
import '../../Repository/ModelClass/AddSubjectModel.dart';
import '../../ToastMessage.dart';


class Addsubject extends StatefulWidget {

  const Addsubject({super.key, });

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
  // bool _isDialogVisible = false;


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
     ),
      body: BlocListener<AddSubjectBloc, AddSubjectState>(
        listener: (context, state) {
          if (state is AddSubjectBlocLoading) {

            showDialog(
              context: context,
              barrierDismissible: false, // Prevents dialog from being closed
              builder: (BuildContext context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );

          }
          if (state is AddSubjectBlocError) {
            Navigator.of(context).pop();

          }
          if (state is AddSubjectBlocLoaded) {
            Navigator.of(context).pop();

            addSubject = BlocProvider
                .of<AddSubjectBloc>(context)
                .addSubjectModel;
            titlecontroller.clear();
            coursecodecontroller.clear();
            universitycontroller.clear();
            descriptioncontroller.clear();
            _selectedFiles?.clear();


            ToastMessage().toastmessage(
                message: "Subject Added  Succesfully ");

            context.go('/parent/Add Subject');

          }
        },
        child: Padding(
          padding: EdgeInsets.only(left: 38.sp, top: 20.h),
          child: SingleChildScrollView(
            child: Form(key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
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
                        height: 85.h,
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
                            border: OutlineInputBorder(   borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.circular(15.r)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ) ,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ),
                          ),
                          validator: (title) {
                            if (title!.isEmpty) {
                              return 'This Feild is required';
                            }

                            return null;
                          },
                          maxLines: 1, // No text wrapping
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 27.h),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
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
                        height: 85.h,
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
                            border: OutlineInputBorder(   borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.circular(15.r)),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ) ,
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
                              return 'This Feild is required';
                            }

                            return null;
                          },
                          maxLines: 1, // No text wrapping
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 27.h),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,
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
                        height: 85.h,
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
                              fillColor: const Color(0xFF0ABC74),
                              // Green background color
                              border: OutlineInputBorder(   borderSide: BorderSide.none,
                                  borderRadius:
                                  BorderRadius.circular(15.r)),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(15.r),
                              ) ,
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
                              return 'This Feild is required';
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
                            fillColor: const Color(0xFF0ABC74),
                            // Green background color
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(15.r),
                            ) ,
                            border: OutlineInputBorder(   borderSide: BorderSide.none,
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
                              return 'This Feild is required';
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
                                      color: const Color(0xFF0ABC74),
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
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 10.w),
                                        // Display the first file's name
                                        SizedBox(
                                          width: 180.w,
                                          height: 40.h,
                                          child: Text(
                                            _selectedFiles![0].name,
                                            style: GoogleFonts.notoSans(
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        // Display the first file's size
                                        SizedBox(
                                          width: 90.w,
                                          height: 40.h,
                                          child: Text(
                                            '${(_selectedFiles![0].size / (1024 * 1024)).toStringAsFixed(2)} MB',
                                            style: GoogleFonts.notoSans(
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                          height: 40.h,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedFiles!.removeAt(0); // Remove the first file
                                              });
                                            },
                                            child: const Icon(Icons.delete_outline_outlined, color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        // Dropdown Button to toggle file list
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              dropdownexpand = !dropdownexpand; // Toggle the dropdown state
                                            });
                                          },
                                          icon: Icon(
                                            dropdownexpand ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Show additional files if dropdown is expanded
                                    if (dropdownexpand)
                                      Column(
                                        children: List.generate(
                                          _selectedFiles!.length - 1, // Exclude the first file
                                              (index) {
                                            PlatformFile file = _selectedFiles![index + 1]; // Start from the second file
                                            double fileSizeInMb = file.size / (1024 * 1024);
                                            return Padding(
                                              padding: EdgeInsets.symmetric(vertical: 5.h),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(width: 5.w),
                                                  // Display the file name
                                                  SizedBox(
                                                    width: 180.w,
                                                    height: 40.h,
                                                    child: Text(
                                                      file.name,
                                                      style: GoogleFonts.notoSans(
                                                        textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20.sp,
                                                          fontWeight: FontWeight.w200,
                                                        ),
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(width: 15.w),
                                                  // Display the file size
                                                  SizedBox(
                                                    width: 90.w,
                                                    height: 40.h,
                                                    child: Text(
                                                      '${fileSizeInMb.toStringAsFixed(2)} MB',
                                                      style: GoogleFonts.notoSans(
                                                        textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20.sp,
                                                          fontWeight: FontWeight.w200,
                                                        ),
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w),
                                                  // Delete button
                                                  SizedBox(
                                                    width: 35,
                                                    height: 40.h,
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedFiles!.removeAt(index + 1); // Adjust index for the second file onward
                                                        });
                                                      },
                                                      child: const Icon(Icons.delete_outline_outlined, color: Colors.black),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                )

                              )
                                  : const SizedBox(),
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
                              if (kDebugMode) {
                                print('pdfsubject$_selectedFiles');
                              }


                              final isValid =
                              formkey.currentState?.validate();
                              if (isValid!) {
                                if (kDebugMode) {
                                  print('  api calling pfd taked');
                                }
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
                                if (kDebugMode) {
                                  print('loadedpdf$_selectedFiles' );
                                }
                              }
                              formkey.currentState?.save();
                            },
                            child: Container(
                              width: 219.90.w,
                              height: 69.h,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF0ABC74),
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
                                color: const Color(0xFF0ABC74),
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
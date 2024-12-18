import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klawapp/Bloc/Contact%20Bloc/contact_bloc.dart';
import 'package:klawapp/Repository/ModelClass/ContactModel.dart';
import 'Footer.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  late ContactModel contact;
  var formkey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcodecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController feedbackcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 80.w, top: 70.h),
                child: Container(
                  width: 1306.52.w,
                  height: 680.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 57.60,
                        offset: Offset(7, 13),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocListener<ContactBloc, ContactState>(
                        listener: (context, state) {
                          if (state is ContactBlocLoading) {


                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.green,
                                  ),
                                );
                              },
                            );
                          }
                          if (state is ContactBlocError) {
                            Navigator.of(context).pop();


                          }
                          if (state is ContactBlocLoaded) {

                            contact = BlocProvider.of<ContactBloc>(context)
                                .contactModel;
                            Navigator.of(context).pop();
                            feedbackcontroller.clear();
                            phonenumbercontroller.clear();
                            emailcodecontroller.clear();
                            namecontroller.clear();
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Text('Get in Touch',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: const Color(0xFF006039),
                                    fontSize: 54.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              width: 545.w,
                              child: Text(
                                'Lorem ipsum dolor sit amet consectetur. Nunc erat pharetra et scelerisque dolor cursus. Elit commodo sapien molestie adipiscing sem.',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              width: 545.w,
                              child: TextFormField(
                                controller: namecontroller,
                                decoration: InputDecoration(
                                  hintText: 'Name*',
                                  hintStyle: const TextStyle(color: Colors.black),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                  errorBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1.w,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                                validator: (name) {
                                  if (name == null || name.isEmpty) {
                                    return 'Name is required';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              width: 545.w,
                              child: TextFormField(
                                controller: emailcodecontroller,
                                keyboardType: TextInputType.emailAddress, // Show email keyboard
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: const TextStyle(color: Colors.black),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                  errorBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1.w,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                                validator: (email) {
                                  // Ensure email is not null and matches the pattern
                                  if (email == null || email.isEmpty) {
                                    return 'Email is required';
                                  }
                                  // Use RegExp for basic email validation
                                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
                                    return 'Enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              width: 545.w,
                              child: TextFormField(
                                controller: phonenumbercontroller,
                                keyboardType: TextInputType.phone, // Ensures numeric keyboard
                                decoration: InputDecoration(
                                  hintText: 'Phone number *',
                                  hintStyle: const TextStyle(color: Colors.black),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                  errorBorder:  OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1.w,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                                validator: (phonenumber) {
                                  // Ensure phone number is not null and has at least 10 digits
                                  if (phonenumber == null || phonenumber.isEmpty) {
                                    return 'Phone number is required';
                                  }

                                  else if (phonenumber.length != 10 || !RegExp(r'^\d+$').hasMatch(phonenumber)) {

                                    return 'Enter a valid 10-digit phone number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),

                            SizedBox(
                              width: 545.w,
                              child: TextFormField(
                                controller: feedbackcontroller,
                                decoration: InputDecoration(
                                  hintText: 'How did you find us?',
                                  hintStyle: const TextStyle(color: Colors.black),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),  errorBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.w,
                                  ),
                                ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.w,
                                    ),
                                  ),
                                ),
                                validator: (feedback) {
                                  if (feedback!.isEmpty) {
                                    return 'This is empty ';
                                  }

                                  return null;
                                },
                              ),
                            ),

                            SizedBox(
                              height: 20.h,
                            ),
                            InkWell(
                              onTap: () {
                                final isValid =
                                    formkey.currentState?.validate();
                                if (isValid!) {

                                  BlocProvider.of<ContactBloc>(context).add(
                                      FeatchContact(
                                          name: namecontroller.text,
                                          Email: emailcodecontroller.text,
                                          Phonenumber:
                                              phonenumbercontroller.text,
                                          Feedback: feedbackcontroller.text));
                                }
                                formkey.currentState?.save();
                              },
                              child: Container(
                                width: 545.w,
                                height: 56.h,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF03B96F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'SEND',
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
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
                        width: 100.w,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 577.w,
                          height: 680.h,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/contactpageimage.png"),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 103.h,
              ),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klawapp/Bloc/LoginBloc/login_bloc.dart';
import 'package:klawapp/UI/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Repository/ModelClass/AdminLoginModelClass.dart';
import '../../ToastMessage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = true;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  late AdminLoginModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(key:formkey ,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 167.h, left: 84.w),
                child: Column(
                  children: [
                    Text(
                      'Welcome Back .!',
                      style: GoogleFonts.notoSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 96.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 236.w,
                          height: 72.h,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF009357),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 4.w,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Skip the lag ?',
                              style: GoogleFonts.notoSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.sp,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500.w,
                          child: Row(
                            children: List.generate(
                                150 ~/ 5,
                                (index) => Expanded(
                                      child: Container(
                                        color: index % 2 == 0
                                            ? Colors.transparent
                                            : const Color(0xFF009357),
                                        height: 1.9.h,
                                      ),
                                    ),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 37.w),
              Padding(
                padding: EdgeInsets.only(top: 52.h),
                child: Container(
                  width: 374.w,
                  height: 634.h,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side:
                          BorderSide(width: 1.w, color: const Color(0xFF009357)),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 37.w, top: 52.h),
                    child: BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginBlocLoading) {
                          print("siginloading");

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                        }
                        if (state is LoginBlocError) {
                          Navigator.of(context).pop();

                          print('error');
                        }
                        if (state is LoginBlocLoaded) {
                          data =
                              BlocProvider.of<LoginBloc>(context).adminLoginModel;
                          Navigator.of(context).pop();
                          ToastMessage().toastmessage(message: "Succesfully login");
                          // DashboardHome.instance;
Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> Home()), (route)=> false);
                          checkLogin(data.access.toString());
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Login',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: const Color(0xFF006039),
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              )),
                          Text('Glad you’re back.!',
                              style: GoogleFonts.notoSans(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 62.h, right: 20.w),
                            child: TextFormField(
                              controller: usernamecontroller,
                              decoration: InputDecoration(
                                  hintText: 'Username',
                                  hintStyle: GoogleFonts.notoSans(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(
                                          width: 1.w, color: Colors.black)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(
                                          width: 1.w, color: Colors.black)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: BorderSide(
                                          width: 1.w, color: Colors.black))),
                              validator: (username) {
                                if (username!.isEmpty ) {
                                  return 'Enter a valid Username';
                                }

                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 45.h, right: 20.w),
                            child: TextFormField(
                              controller: passwordcontroller,
                              obscureText: passwordVisible,
                              decoration: InputDecoration(
                                hintText: 'Pass Key',
                                hintStyle: GoogleFonts.notoSans(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: passwordVisible
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: Color(0xFFA7B0BB),
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: Color(0xFFA7B0BB),
                                        ),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide(
                                        width: 1.w, color: Colors.black)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide(
                                        width: 1.w, color: Colors.black)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide:
                                      BorderSide(width: 1.w, color: Colors.black),
                                ),
                              ), validator: (passwordvalue) {
                              if (passwordvalue!.isEmpty || passwordvalue.length < 5) {
                                return 'Enter a valid password!';
                              }

                              return null;
                            },
                            ),
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(

                              onTap: () {

                                final isValid = formkey.currentState?.validate();
                                if (isValid!) {
                                BlocProvider.of<LoginBloc>(context).add(FeatchLogin(
                                    username: usernamecontroller.text,
                                    password: passwordcontroller.text));
                              }
                                formkey.currentState?.save();
                                },
                              child: Padding(
                                padding: EdgeInsets.only(top: 52.h, left: 37.w),
                                child: Container(
                                  width: 196.w,
                                  height: 40.h,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF009357),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      style: GoogleFonts.notoSans(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 0.h,
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void checkLogin(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }


}

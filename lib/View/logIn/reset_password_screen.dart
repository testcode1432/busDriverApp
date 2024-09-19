
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../constants.dart';
import '../../hooks/commonWidgets/common_text.dart';
import '../../hooks/commonWidgets/custom_button.dart';
import '../../hooks/commonWidgets/snackbar.dart';
import '../../services/user_services.dart';
import '../../strings.dart';
import 'components/custom_textformfield.dart';
import 'login_screen.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({Key? key}) : super(key: key);
  static String routeName = "/password_reset_screen";
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final GlobalKey<FormState> _formKey0 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final TextEditingController _OTPController = TextEditingController();
  final OtpFieldController _OTPFieldController = OtpFieldController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  FocusNode zerothFocusNode = FocusNode();
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  RxBool isOtpSent = RxBool(false);
  RxBool isPassNotMatched = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool _showNewPassword = false;
  bool _showConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(appbarBgpng),fit: BoxFit.fill),
                ),
                child: Column(
                  children: [
                    kheight20,
                    GradientText(
                      "WELCOME",
                      colors: const [
                        kGradientTextColor2,
                        kPageyellow,
                      ],
                      style: TextStyle(
                        fontFamily: defaultFount,
                        fontSize: 46.71999740600586.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      gradientDirection: GradientDirection.ttb,
                    ),
                    kheight80,
                    //Image.asset(loginPng),
                    const SizedBox(height: 303,),
                    Obx(() {
                      if (isOtpSent.isFalse) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding.w),
                          width: double.infinity,
                          height: 300,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              gradient: defaultGradient),
                          child: Form(
                              key: _formKey0,
                              child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            kheight20,
                                            const CommonTextSmall(text: "Forget Password", weight: FontWeight.w800),
                                            kheight40,
                                            const  SizedBox(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Enter your registered emailid',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            kheight10,
                                            CustomTextformfield(
                                                textcolor: kTextWhite,
                                                curserColor: kTextWhite,
                                                focusNode: zerothFocusNode,
                                                textInputAction: TextInputAction.next,
                                                borderRadius: 12,
                                                labelText: "Email",
                                                controller: _emailController),
                                            kheight20,
                                            CustomMaterialButton(
                                              onpress: () {
                                                if (_formKey0.currentState!
                                                    .validate()) {
                                                  sendOtp();
                                                }
                                              },
                                              height: 50.h,
                                              text: Text("Send Otp",
                                                  style: Theme.of(context).textTheme.titleSmall),
                                            )
                                          ])))),
                        );
                      } else {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding.w),
                          width: double.infinity,
                          height: 500,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              gradient: defaultGradient),
                          child: Form(
                            key: _formKey1,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    kheight20,
                                    const CommonTextSmall(text: "New Password", weight: FontWeight.w800),
                                    const  SizedBox(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'OTP',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    kheight10,

                                    SizedBox(
                                      height: 50,
                                      child: OTPTextField(
                                        outlineBorderRadius: 10,
                                        otpFieldStyle: OtpFieldStyle(
                                            focusBorderColor: kTextWhite,
                                          borderColor: kTextWhite,
                                          disabledBorderColor: kTextWhite,
                                          enabledBorderColor: kTextWhite,
                                          errorBorderColor: kTextWhite
                                          //(here)
                                        ),
                                        controller: _OTPFieldController,
                                        length: 6,
                                        width: MediaQuery.of(context).size.width,
                                        fieldWidth: 45,
                                        style: const TextStyle(fontSize: 17, color: kTextWhite),
                                        textFieldAlignment: MainAxisAlignment.spaceAround,
                                        fieldStyle: FieldStyle.box,
                                        keyboardType: const TextInputType.numberWithOptions(
                                          signed: false,
                                          decimal: false,
                                        ),
                                        inputFormatter: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly,
                                        ],
                                        onCompleted: (pin) {
                                          _OTPController.text = pin;
                                        },
                                        hasError: _OTPFieldController == null ,
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: () {
                                        sendOtp();
                                      },
                                      child: SizedBox(
                                        height: 30,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            const Text(
                                              '00:00',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            kwidth30,
                                            const Text(
                                              'Resend Otp',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            kwidth5,
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    CustomTextformfield(
                                        textcolor: kTextWhite,
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _showNewPassword = !_showNewPassword;
                                            });
                                          },
                                          child: Icon(
                                            _showNewPassword
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            // Other icon properties...
                                          ),
                                        ),
                                        focusNode: secondFocusNode,
                                        textInputAction: TextInputAction.next,
                                        borderRadius: 12,
                                        labelText: "New Password",
                                        obscureText: !_showNewPassword,
                                        controller: _newPasswordController),
                                    SizedBox(
                                      height: 30,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'At least 8 characters',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                          kwidth5,
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    CustomTextformfield(
                                        textcolor: kTextWhite,
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _showConfirmPassword =
                                              !_showConfirmPassword;
                                            });
                                          },
                                          child: Icon(
                                            _showConfirmPassword
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            // Other icon properties...
                                          ),
                                        ),
                                        focusNode: thirdFocusNode,
                                        textInputAction: TextInputAction.done,
                                        borderRadius: 12,
                                        labelText: "Confirm New Password",
                                        obscureText: !_showConfirmPassword,
                                        controller: _confirmNewPasswordController),
                                    isPassNotMatched.value ?  SizedBox(
                                      height: 30,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'Not matching with new password',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.red),
                                          ),
                                          kwidth5,
                                        ],
                                      ),
                                    ):Container(),
                                    kheight20,
                                    CustomMaterialButton(
                                      onpress: () {
                                        if (_formKey1.currentState!.validate()) {
                                          resetPassword();
                                        }
                                      },
                                      height: 50.h,
                                      text: Text("Confirm",
                                          style: Theme.of(context).textTheme.titleSmall),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 240),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      loginPng,
                      width: 300.w,
                      height: 300.h,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  resetPassword() async {
    // String userRole = await Get.arguments['user_role'];
    if(_confirmNewPasswordController.text != _newPasswordController.text){
      setState(() {
        isPassNotMatched.value = true;
      });

    }else if(_OTPController.text.length <6){
      getSnackbar(
          titile: "OTP ERROR",
          discription: 'Please enter otp',
          bgColor: Colors.redAccent);
    }else{
        isPassNotMatched.value = false;
      bool status = await UserContollerService.resetPassword(
          newpassword: _confirmNewPasswordController.text.trim(),
          email: _emailController.text.trim(),
          otp: _OTPController.text.trim());
      if (status) {
        getSnackbar(
            titile: "Reset password",
            discription: 'Password changed successfully',
            bgColor: Colors.greenAccent);
        Get.offAndToNamed(LoginScreen.routeName);
      } else {
        getSnackbar(
            titile: "Reset password",
            discription: 'Password reset failed',
            bgColor: Colors.redAccent);
      }
    }

  }

  sendOtp() async {isOtpSent.value = true;

    String status = await UserContollerService.generateResetOtp(
        email: _emailController.text.trim());
    if (status.contains("successfully")) {
      getSnackbar(
          titile: "Forgot Password",
          discription: status,
          bgColor: Colors.greenAccent);
      isOtpSent.value = true;
    } else {
      getSnackbar(
          titile: "Forgot password",
          discription: status,
          bgColor: Colors.redAccent);
    }
  }
}

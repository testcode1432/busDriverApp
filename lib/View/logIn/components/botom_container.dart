// ignore_for_file: must_be_immutable
import 'package:caringio_student/View/logIn/components/custom_textformfield.dart';
import 'package:caringio_student/View/logIn/services/login_services.dart';
import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/common_text.dart';
import 'package:caringio_student/hooks/commonWidgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../strings.dart';
import '../reset_password_screen.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer({
    super.key,
  });

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  String hardcodedUsername = "user";

  String hardcodedPassword = "password";

  bool isUsernameValid = true;

  bool isPasswordValid = true;

  TextEditingController emailContrller = TextEditingController();

  TextEditingController passwordContrller = TextEditingController();

  void validateFields() {
    String enteredUsername = emailContrller.text.trim();
    String enteredPassword = passwordContrller.text.trim();

    bool isUsernameEmpty = enteredUsername.isEmpty;
    bool isPasswordEmpty = enteredPassword.isEmpty;

    bool isValid = true;

    // Validate username and password
    if (isUsernameEmpty || isPasswordEmpty) {
      isValid = false;
    } else {
      LogInServices()
          .userLogin(email: enteredUsername, password: enteredPassword);
    }

    if (!isValid) {
      Get.snackbar(
        'Error',
        'Invalid username or password',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  final FocusNode _textField1FocusNode = FocusNode();

  final FocusNode _textField2FocusNode = FocusNode();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 320.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding.w),
              width: double.infinity,
              height: 380,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  gradient: defaultGradient),
              child: Column(
                children: [
                  kheight80,
                  const CommonTextSmall(text: "Login", weight: FontWeight.w800),
                  kheight20,
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomTextformfield(
                        textcolor: kTextWhite,
                        curserColor: kTextWhite,
                        focusNode: _textField1FocusNode,
                        textInputAction: TextInputAction.next,
                        borderRadius: 12,
                        labelText: "Username",
                        controller: emailContrller),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10).w,
                    child: CustomTextformfield(
                        textcolor: kTextWhite,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _toggleVisibility();
                          },
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            // Other icon properties...
                          ),
                        ),
                        focusNode: _textField2FocusNode,
                        textInputAction: TextInputAction.done,
                        borderRadius: 12,
                        labelText: "Password",
                        obscureText: !_showPassword,
                        controller: passwordContrller),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(PasswordResetScreen.routeName);
                          },
                          child: const Text(
                            'Forget password',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10).w,
                    child: CustomMaterialButton(
                      onpress: () async {
                        validateFields();
                        // Get.offAllNamed(BottomNavScreen.routeName);
                      },
                      height: 40.h,
                      text: Text("LogIn",
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Align(
            alignment: Alignment.center,
            child: Image.asset(
              loginPng,
              width: 301.w,
              height: 470.h,
            )),
      ],
    );
  }

  void _toggleVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}

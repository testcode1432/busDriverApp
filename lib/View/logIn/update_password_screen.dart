import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../services/user_services.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../hooks/commonWidgets/custom_button.dart';
import '../../hooks/commonWidgets/snackbar.dart';
import '../../strings.dart';
import 'login_screen.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);
  static String routeName = "/update_password_screen";
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<UpdatePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final email = Get.arguments['email'];
  bool _showCurrentPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kheight10,
              const Center(
                  child: Text(
                'Update Password',
                style: TextStyle(fontSize: 25, color: kTextWhite),
              )),
              kheight20,
              Image.asset(loginPng),
              Form(
                key: _formKey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          obscureText: !_showCurrentPassword,
                          focusNode: firstFocusNode,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () =>
                              secondFocusNode.requestFocus(),
                          controller: _currentPasswordController,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showCurrentPassword = !_showCurrentPassword;
                                });
                              },
                              child: Icon(
                                _showCurrentPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                // Other icon properties...
                              ),
                            ),
                            labelText: 'Current Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          obscureText: !_showNewPassword,
                          // Other properties...

                          focusNode: secondFocusNode,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () =>
                              thirdFocusNode.requestFocus(),
                          controller: _newPasswordController,
                          decoration: InputDecoration(
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
                            labelText: 'New Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          onFieldSubmitted: (value) {
                            // Perform your action here, such as pressing a button
                            _validate();
                          },
                          obscureText: !_showConfirmPassword,
                          focusNode: thirdFocusNode,
                          textInputAction: TextInputAction.done,
                          controller: _confirmNewPasswordController,
                          validator: (value) {
                            if (value != _newPasswordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showConfirmPassword = !_showConfirmPassword;
                                });
                              },
                              child: Icon(
                                _showConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                // Other icon properties...
                              ),
                            ),
                            labelText: 'Confirm New Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        kheight20,
                        Padding(
                          padding: const EdgeInsets.all(10).w,
                          child: CustomMaterialButton(
                            onpress: () {
                              if (_formKey.currentState!.validate()) {
                                _validate();
                              }
                            },
                            height: 40.h,
                            text: Text("Submit",
                                style: Theme.of(context).textTheme.titleSmall),
                          ),
                        )
                      ],
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

  _validate() async {
    bool status = await UserContollerService.updatePassword(
        email: email!,
        oldPassword: _currentPasswordController.text,
        newPassword: _confirmNewPasswordController.text);
    if (status) {
      getSnackbar(
          titile: "Reset password",
          discription: 'Password changed successfully',
          bgColor: Colors.greenAccent);
      Get.offAllNamed(LoginScreen.routeName);
    } else {
      getSnackbar(
          titile: "Reset password",
          discription: 'Password reset failed',
          bgColor: Colors.redAccent);
    }
  }
}

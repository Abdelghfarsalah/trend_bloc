import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/others/authentication/widgets/custom_button.dart';
import 'package:trend/features/others/authentication/widgets/custom_textfield.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 270.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Align with LoginPage
                      SizedBox(height: 100.h),
                      Text(
                        'Create Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'Pick a username for your account. You can always change it later.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(height: 20.h),
                      CustomTextfield(
                        name: 'Username',
                        isPassword: false,
                        controller: TextEditingController(),
                      ),
                      SizedBox(height: 10.h),
                      CustomTextfield(
                        name: 'First Name',
                        isPassword: false,
                        controller: TextEditingController(),
                      ),
                      SizedBox(height: 10.h),
                      CustomTextfield(
                        name: 'Last Name',
                        isPassword: false,
                        controller: TextEditingController(),
                      ),
                      SizedBox(height: 10.h),
                      CustomTextfield(
                        name: 'Email Address',
                        isPassword: false,
                        controller: TextEditingController(),
                      ),
                      SizedBox(height: 10.h),
                      CustomTextfield(
                        name: 'Password',
                        isPassword: true,
                        controller: TextEditingController(),
                      ),
                      SizedBox(height: 10.h),
                      CustomTextfield(
                        name: 'Confirm Password',
                        isPassword: true,
                        controller: TextEditingController(),
                      ),
                      SizedBox(height: 30.h),
                      CustomButton(
                        text: 'Sign Up',
                        onPressed: () {
                          // Handle sign-up logic here
                        },
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              // Hide "Back to Login" when the keyboard is open
              if (!isKeyboardOpen)
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      // Navigate back to Login Page
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back to Login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              if (!isKeyboardOpen) SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

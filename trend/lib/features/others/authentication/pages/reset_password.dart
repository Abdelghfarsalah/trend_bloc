import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/others/authentication/widgets/custom_button.dart';
import 'package:trend/features/others/authentication/widgets/custom_textfield.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if the keyboard is open
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
                      SizedBox(height: 200.h),

                      SizedBox(height: 30.h),
                      Text(
                        'Reset Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      CustomTextfield(
                        name: 'Email Address',
                        isPassword: false,
                        controller: TextEditingController(),
                      ),
                      SizedBox(height: 30.h),
                      CustomButton(
                        text: 'Send Reset Link',
                        onPressed: () {
                          // Handle password reset logic here
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

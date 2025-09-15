import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_governate_app/app_styles.dart';
import 'package:my_governate_app/Login%20&%20Register/pop_out.dart';
import 'package:my_governate_app/theme/app_theme.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, size: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          // child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/pass2.jpeg',
                height: 300,
                width: 300,
              ),
              const SizedBox(height: 30),
              const Text(
                "Forget Password",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Enter your email account to reset  your password",
                style: GoogleFonts.inter(
                  color: const Color(0xff7D848D),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Text(
                "Email Address",
                style: AppTheme.bodyLarge,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: AppTheme.spacingS),
              Form(
                key: _formKey,
                child: SizedBox(
                  width: 335,
                  height: 70,
                  child: TextFormField(
                    controller: emailController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the email';
                      } else if (!value.contains('@')) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                    decoration: AppStyles.inputDecoration(
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Color(0xFF0D6EFD),
                      ),
                      hintText: "Pleaase enter your email",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              CustomButton(
                text: "Reset Password",
                size: const Size(327, 48),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    emailController.clear();
                  }
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: const PopOut(),
                    ),
                  );
                },
                textSize: 16,
                borderRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

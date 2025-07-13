import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Success!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF112095), Color(0xFF09245A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 140.h),
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50.h),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email kiriting";
                    } else if (!RegExp(
                      r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$',
                    ).hasMatch(value)) {
                      return "To'g'ri email formatida kiriting";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Parol",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Parol kiriting";
                    } else if (value.length < 6) {
                      return "Parol kamida 6 ta belgidan iborat bo'lishi kerak";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.h),
                ElevatedButton(onPressed: _submitForm, child: Text("Kirish")),
                Spacer(),
                SvgPicture.asset(
                  "assets/svgs/splashImage3.svg",
                  color: Color(0xFF00133F),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

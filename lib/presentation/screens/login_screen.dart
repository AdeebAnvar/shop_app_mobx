import 'package:flutter/material.dart';
import 'package:shopp_app_mobx/widgets/custom_button.dart';
import 'package:shopp_app_mobx/widgets/custom_textform_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomTextFormField(hintText: 'email'),
          const CustomTextFormField(hintText: 'password'),
          CustomButton(
            label: 'Login',
            onPressed: () => onClickLogin(context),
          ),
        ],
      ),
    );
  }
}

void onClickLogin(BuildContext context) => Navigator.of(context)
    .pushNamedAndRemoveUntil('/product_detail_screen', (route) => false);

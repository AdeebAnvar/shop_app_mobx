// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social_auth_buttons/res/buttons/google_auth_button.dart';
import 'package:social_auth_buttons/res/shared/colors.dart';
import 'package:social_auth_buttons/res/shared/images_url.dart';

import 'package:shopp_app_mobx/logic/login_screen/login_screen_store.dart';
import 'package:shopp_app_mobx/widgets/custom_textform_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginScreenStore? loginScreenStore;
    loginScreenStore ??= Provider.of<LoginScreenStore>(context);
    String? email;
    String? password;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                signInCard(
                  context: context,
                  store: loginScreenStore,
                  email: email,
                  password: password,
                ),
                SizedBox(height: 35),
                Text(
                  'Login with social',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: buttonFacebookColor),
                            icon: Row(
                              children: [
                                SvgPicture.asset(
                                  facebookLogoBlue,
                                  height: 30,
                                ),
                              ],
                            ),
                            label: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ))),
                    SizedBox(width: 10),
                    Expanded(
                      child: GoogleAuthButton(
                        elevation: 2,
                        borderRadius: 30,
                        text: '  Log In',
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Material signInCard(
      {required BuildContext context,
      LoginScreenStore? store,
      String? email,
      String? password}) {
    return Material(
      type: MaterialType.button,
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey.shade300)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardTab(),
            SizedBox(height: 20),
            Text(
              'Registered Customers',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'If you have an account, sign in with your email address',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'Email *',
              onChanged: (String? value) => email = value,
            ),
            CustomTextFormField(
              hintText: 'Password *',
              obscureText: true,
              onChanged: (String? value) => password = value,
            ),
            SizedBox(height: 20),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  foregroundColor: Colors.teal.shade400,
                  side: BorderSide(
                    color: Colors.teal.shade400,
                    width: 3,
                  ),
                ),
                onPressed: () => store!
                    .signIn(email: email, password: password, ctx: context),
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Forgot Password?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row cardTab() {
    return Row(
      children: [
        Container(
          child: Column(
            children: [
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.dhurjati().fontFamily,
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 5,
                width: 80,
                color: Colors.teal,
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Container(
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  fontFamily: GoogleFonts.dhurjati().fontFamily,
                  fontSize: 25,
                  color: Colors.teal.shade400,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Container(
              //   height: 7,
              //   width: 100,
              //   color: Colors.teal,
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

void onClickLogin(BuildContext context) => Navigator.of(context)
    .pushNamedAndRemoveUntil('/product_detail_screen', (route) => false);

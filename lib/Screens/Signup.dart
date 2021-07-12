
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe/widgets/pallete.dart';
import 'package:recipe/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipe/DataModel/authentication_service.dart';
// import 'package:recipe/Screens/HomePage.dart';


class Signup extends StatefulWidget {

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
   String password;
  String email;
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/login_bg.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              
              children: [
                SizedBox(
                  height: size.width * 0.3,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:105.0),
                  child: Center(
                    child: Text(
                      'MrRecipe',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextInputField(
                      ontap: (value) {
                        email = value;
                        print(value);
                      },
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      ontap: (value) {
                        password = value;
                        print(value);
                      },
                      icon: FontAwesomeIcons.lock,
                      hint: 'Password',
                      inputAction: TextInputAction.done,
                    ),
                    
                    SizedBox(
                      height: 25,
                    ),
                    RoundedButton(
                        buttonName: 'Signup',
                         ontap: () {
                          context
                              .read<AuthenticationService>()
                              .signUp(email: email, password: password);
                          Navigator.pushNamed(context, 'HomePage');
                          // print(email);
                          // print(password);
                        }),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(
                                color: kBlue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

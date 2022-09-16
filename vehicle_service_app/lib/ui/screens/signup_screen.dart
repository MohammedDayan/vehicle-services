import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vehicle_service_app/config/authentication.dart';
import 'package:vehicle_service_app/ui/components/components.dart';
import 'package:vehicle_service_app/ui/components/under_part.dart';
import 'package:vehicle_service_app/ui/screens/screens.dart';
import 'package:vehicle_service_app/ui/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Upside(
                  imgUrl: Lottie.asset("assets/anim.json"),
                ),
                const PageTitleBar(title: 'Create New Account'),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        iconButton(context),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "or use your email account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                        Form(
                          child: Column(
                            children: [
                              RoundedInputField(
                                controller: _email,
                                hintText: "Email",
                                icon: Icons.email,
                              ),
                              // RoundedInputField(
                              //   hintText: "Name",
                              //   icon: Icons.person,
                              // ),
                              RoundedPasswordField(
                                controller: _password,
                              ),
                              RoundedButton(
                                  text: 'REGISTER',
                                  press: () async {
                                    bool successful = await register(
                                        _email.text, _password.text);
                                    if (successful) {
                                      const snackbar = SnackBar(
                                          content: Text(
                                              "Account Creation successful"));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackbar);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()));
                                    }
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

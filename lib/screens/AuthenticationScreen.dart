import 'package:flutter/material.dart';

enum AuthenticationState { signUp, login }

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    var ActiveAuthenticationState = AuthenticationState.signUp;
    var formKey = GlobalKey<FormState>();
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    void changeAuthenticationMode() {
      if (ActiveAuthenticationState == AuthenticationState.signUp) {
        setState(() {
          ActiveAuthenticationState = AuthenticationState.login;
        });
      } else {
        setState(() {
          ActiveAuthenticationState = AuthenticationState.signUp;
        });
      }
    }

    void submitForm() {}
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.network(
            'https://i.pinimg.com/736x/b0/26/6a/b0266a114b60808a7b7198c49a2025c4.jpg',
            fit: BoxFit.cover,
            height: deviceHeight,
            width: deviceWidth,
          ),
          Container(
            margin: EdgeInsets.only(top: deviceHeight / 4),
            child: SignUpFormWidget(
                deviceHeight: deviceHeight,
                deviceWidth: deviceWidth,
                formKey: formKey),
          )
        ],
      ),
    );
  }
}

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
    required this.deviceHeight,
    required this.deviceWidth,
    required this.formKey,
  }) : super(key: key);

  final double deviceHeight;
  final double deviceWidth;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Sign Up'),
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(left: 10, right: 10),
          height: deviceHeight / 2,
          width: deviceWidth,
          decoration: const BoxDecoration(color: Colors.black54),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  const Text(
                    'By submitting you accept the privacy policy and the user end license agreement of the application',
                  ),
                  ElevatedButton(
                      onPressed: null,
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.black),
                        ),
                      ))
                ],
              )),
        ),
        Row(
          children: const [
            Text('Already have an account?'),
            TextButton(onPressed: null, child: Text('Login'))
          ],
        )
      ],
    );
  }
}

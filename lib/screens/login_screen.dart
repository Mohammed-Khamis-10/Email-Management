import 'package:email_management/screens/home.dart';
import 'package:email_management/service/app_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // defining this private key for form validation
  final _formkey = GlobalKey<FormState>();

// defining two controller from text field
  var emailTextEditingController = TextEditingController();
  var passwordTextEditingController = TextEditingController();

// define this variable to use it for loading when press the button
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color.fromARGB(255, 243, 170, 33)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Welcome To The Emails World...",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        // calling the key we defined above
                        key: _formkey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              TextFormField(
                                // defined above  to take data
                                controller: emailTextEditingController,
                                // to hide the validatation mssg when begin writing
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade300,
                                    hintText: "Email",
                                    prefixIcon: const Icon(
                                      Icons.email,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),

                                // using the validator for the output message
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Valid Email";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                // defined above  to take data
                                controller: passwordTextEditingController,
                                // to hide the validatation mssg when begin writing
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                obscureText: true,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade300,
                                    hintText: "Password",
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),

                                // using the validator for the output message
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Valid Password";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 60,
                              ),

                              // this for loading when press the button
                              _isLoading
                                  ? const CircularProgressIndicator(
                                      color: Color.fromARGB(255, 243, 170, 33),
                                    )
                                  : SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: onLoginAction,
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            primary: Color.fromARGB(255, 243, 170, 33)),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24),
                                          ),
                                        ),
                                      ),
                                    ),
                              const SizedBox(
                                height: 80,
                              ),
                              RichText(
                                  text: const TextSpan(
                                      text: "Don\'t have an Account ? ",
                                      children: [
                                    TextSpan(
                                        text: "Register Now ",
                                        style: TextStyle(color: Color.fromARGB(255, 243, 170, 33))),
                                  ]))
                            ],
                          ),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  void onLoginAction() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1));
      if (emailTextEditingController.text == "khamis@gmail.com" &&
          passwordTextEditingController.text == "123456") {
        AppService.prefs!.setString("email", "khamis@gmail.com");

        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => Home()), (route) => false);
      } else {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Not Valid User..."),
        ));
      }
    }
  }
}

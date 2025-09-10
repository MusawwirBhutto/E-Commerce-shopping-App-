import 'package:catalog_app/providers/theme_provider.dart';
import 'package:catalog_app/utilis/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 800));

      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
        },
        child: Icon(
          // ignore: unrelated_type_equality_checks
          themeProvider == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: 400,
                  height: 180,
                  child: Image.asset(
                    "assets/flutter vector.PNG",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Welcome $name",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 30.0,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: "Enter username",
                            labelText: "Username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "⚠️ Username cannot be empty";
                            }

                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_open_outlined),
                          hintText: "Enter password",
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "⚠️ Password cannot be empty";
                          } else if (value.length < 7) {
                            return "⚠️ Password length should be at least 7";
                          }
                          Future.delayed(Duration(seconds: 1));

                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forget password?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Material(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(
                          changeButton ? 50 : 8,
                        ),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 900),
                            width: changeButton ? 30 : 300,
                            height: 40,
                            alignment: Alignment.center,
                            child:
                                changeButton
                                    ? Icon(
                                      Icons.done,
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                    )
                                    : Text(
                                      "Login",
                                      style: TextStyle(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Don't have account? ",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(fontSize: 17),
                      ),

                      Text(
                        "Sign In",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(fontSize: 21),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

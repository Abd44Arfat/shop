import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:go_router/go_router.dart';
import 'package:untitled/cubits/Auth/auth_cubit.dart';
import 'package:untitled/presentation/screens/widgets/custom_button.dart';

import '../../../shared/app_router.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              GoRouter.of(context).go(AppRouter.KApprouter);
            } else if (state is LoginError) {
              Fluttertoast.showToast(msg: 'Errorwwwwww');
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.jpg'),
                          height: 150.0,
                        ),
                        Text('qqqqqqqqq'),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomButton(
                          press: () {
                            if (formKey.currentState!.validate()) {
                              AuthCubit.get(context).login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          size: 250,
                          text: 'Login',
                          color: Colors.blue,
                          height: 50,
                          fontesiz: 20,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Other UI components
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
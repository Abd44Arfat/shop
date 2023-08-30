import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubits/profile_cubit.dart';
import 'package:untitled/presentation/screens/widgets/custom_text_field.dart';
class SettingScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..fetchProfileData(),
      child: Scaffold(
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is ProfileSuccess) {
              var model = state.model1;

              nameController.text = model.data.name;
              emailController.text = model.data.email;
              phoneController.text = model.data.phone;
            }

            return Column(
              children: [
                SizedBox(height: 30,),
                CustomFormTextField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                CustomFormTextField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                CustomFormTextField(
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'phone is required';
                    }
                    return null;
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
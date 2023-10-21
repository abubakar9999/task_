import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/bloc/image_picker/pike_image_bloc.dart';

 
import 'package:interview_task/bloc/reginstation_bloc/registation_bloc.dart';
import 'package:interview_task/view/ui/home/home.dart';

 
import 'package:interview_task/view/ui/login/widgets/login_widgets.dart';
import 'package:interview_task/view/ui/registaion/widgets/functions.dart';
import 'package:interview_task/view/ui/registaion/widgets/widgets.dart';

// ignore: must_be_immutable
class RegistationPage extends StatelessWidget {
  RegistationPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final divController = TextEditingController();
  final disController = TextEditingController();
  final dob = TextEditingController();
  Uint8List? logo = Uint8List.fromList([]);
  @override
  Widget build(BuildContext context) {
    dob.text = DateTime.now().toString().substring(0, 10);
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegistationBloc(),
        child: BlocBuilder<RegistationBloc, RegState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RegFailureState) {
              return Center(child: Text('Login failed: ${state.error}'));
            } else if (state is RegSuccessState) {
              // return const Center(child: Text('Login successful'));
              return const HomeScreen();
            } else {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                              child: const Text(
                            "Registation Screen",
                            style: TextStyle(fontSize: 20),
                          )),
                          const SizedBox(height: 50),

                          BlocBuilder<PikeImageBloc, PikeImageState>(
                            builder: (context, state) {
                              if (state is ImageLoaddedState) {
                                if (state.logo != null) {
                                  logo = state.logo!.readAsBytesSync();
                                }
                                return Center(
                                  child: GestureDetector(
                                    onTap: () => uploadLogo(context),
                                    child: Profilemage(state: state),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: ElevatedButton(
                                      onPressed: () => uploadLogo(context),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQlfYzZkDRF3C1pPYhERS7GDGPihBOAiGMXmTw_qMMPwf4S1JvxCMgkiXL7bOYhmI6dwY&usqp=CAU',
                                          fit: BoxFit.cover,
                                          height: 150,
                                          width: 150,
                                        ),
                                      )),
                                );
                              }
                            },
                          ),
                          // image

                          CustomTextFeildWidget(
                              controller: nameController, lebel: "Name"),
                          const SizedBox(height: 20),
                          CustomTextFeildWidget(
                              controller: emailController, lebel: "Email"),
                          const SizedBox(height: 20),
                          CustomTextFeildWidget(
                              controller: phoneController, lebel: "Phone"),
                          const SizedBox(height: 20),
                          const Text(
                            'Select Gender',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Gender(gender: "Male"),
                              Gender(gender: "Female"),
                            ],
                          ),

                          Row(
                            children: [
                              Text(
                                "DOB :",
                              ),
                              SizedBox(
                                width: 200,
                                child: Datepicker(
                                  dob: dob,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text("Division Id :"),
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: CustomTextFeildWidget(
                                    controller: divController, lebel: "0"),
                              ),
                              Text("District Id :"),
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: CustomTextFeildWidget(
                                    controller: disController, lebel: "0"),
                              ),
                            ],
                          ),

                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                              
                                BlocProvider.of<RegistationBloc>(context).add(
                                  RegButtonPressed(name: nameController.text, email: emailController.text.toString(), phone: "10", countrycode: "+88", adderss: "Dhaka bangadesh", districId:20, divisionId:10, dob: dob.text, gender: "mail", macadderss: "sdljfld", password: passwordController.text, photo: "photo")
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 40.0,
                                  vertical: 15.0,
                                ),
                                child: Text(
                                  'Sing Up',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/bloc/image_picker/pike_image_bloc.dart';

import 'package:interview_task/bloc/reginstation_bloc/registation_bloc.dart';
import 'package:interview_task/view/ui/home/home.dart';

import 'package:interview_task/view/ui/login/widgets/login_widgets.dart';
import 'package:interview_task/view/ui/registaion/widgets/functions.dart';
import 'package:interview_task/view/ui/registaion/widgets/widgets.dart';

// ignore: must_be_immutable
class RegistationPage extends StatefulWidget {
  RegistationPage({super.key});

  @override
  State<RegistationPage> createState() => _RegistationPageState();
}

class _RegistationPageState extends State<RegistationPage> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final divController = TextEditingController();

  final disController = TextEditingController();

  final dob = TextEditingController();

  Uint8List? logo = Uint8List.fromList([]);

  int countryCodeValue = 880;

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
              return Center(child: Text('${"login_failed".tr()}: ${state.error}'));
            } else if (state is RegSuccessState) {
              // return const Center(child: Text('Login successful'));
              return const HomeScreen();
            } else {
              return ListView(
                children: [
               

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                         //************* Screen Title**********


                        Center(
                          child: Text(
                        "registation_screen".tr(),
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                      )),
                      const SizedBox(height: 50),//hight for space

                       //************* Profile Picture Image **********
                      BlocBuilder<PikeImageBloc, PikeImageState>(
                        builder: (context, state) {
                          if (state is ImageLoaddedState) {
                            if (state.logo != null) {
                              logo = state.logo!.readAsBytesSync();
                            }
                            return Center(
                              child: GestureDetector(
                                onTap: () => uploadImage(context),
                                child: Profilemage(state: state),
                              ),
                            );
                          } else {
                            return Center(
                              child: ElevatedButton(
                                  onPressed: () => uploadImage(context),
                                  child: ClipRRect(
                                 
                                    child: Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQlfYzZkDRF3C1pPYhERS7GDGPihBOAiGMXmTw_qMMPwf4S1JvxCMgkiXL7bOYhmI6dwY&usqp=CAU',
                                      fit: BoxFit.contain,
                                      height: 150,
                                      width: 100,
                                    ),
                                  )),
                            );
                          }
                        },
                      ),
                        const SizedBox(height: 20),//hight for space

                         //************* User Info  **********

                      CustomTextFeildWidget(controller: nameController, lebel: "name".tr()),
                      const SizedBox(height: 20),//hight for space
                      CustomTextFeildWidget(controller: emailController, lebel: "email".tr()),
                      const SizedBox(height: 20),//hight for space


                     //************* Get Country code for mobile **********

                      Row(
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              items: CountryCode().dropdownItems,
                              value: countryCodeValue,
                              dropdownColor:const Color.fromARGB(255, 5, 4, 0),
                              style:const TextStyle(fontSize: 20),
                              onChanged: (value) {
                                setState(() {
                                countryCodeValue = value;
                                  
                                });
                                
                              },
                            ),
                          ),
                          
                      SizedBox(
                        width:310 ,
                        
                        child: CustomTextFeildWidget(controller: phoneController, lebel: "phone".tr())),
                        ],
                      ),

                      //countrycode
                      const SizedBox(height: 20),
                        //************* Date Of Birth **********
                      Row(
                        children: [
                          const Text(
                            "DOB :",
                            style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold


                            ),
                          ),
                          SizedBox(width: 10,),
                          SizedBox(
                            width: 300,
                            child: Datepicker(
                              dob: dob,
                            ),
                          ),
                        ],
                      ),
                       const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text("${"division_id".tr()} :",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: CustomTextFeildWidget(controller: divController, lebel: "0"),
                          ),
                          Text("${"district_id".tr()} :",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: CustomTextFeildWidget(controller: disController, lebel: "0"),
                          ),
                        ],
                      ),

                        const SizedBox(height: 20),

                       //************* Gender Info **********

                       Text(
                        'select_gender'.tr(),
                        style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Gender(gender: "male".tr()),
                          Gender(gender: "female".tr()),
                        ],
                      ),


                     


                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            isValidEmail(emailController.text)?
                            BlocProvider.of<RegistationBloc>(context).add(RegButtonPressed(
                                name: nameController.text,
                                email: emailController.text.toString(),
                                phone: phoneController.text,
                                countrycode: countryCodeValue.toString(),
                                adderss: "Dhaka bangadesh",
                                districId: int.parse(disController.text),
                                divisionId: int.parse(divController.text),
                                dob: dob.text,
                                gender: "mail",
                                macadderss: "sdljfld",
                                password: passwordController.text,
                                photo: "photo")):ScaffoldMessenger(child: Text("Enter valid Email"));
                          },
                          child:  Padding(
                            padding:const EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 15.0,
                            ),
                            child: Text(
                              'sing_up'.tr(),
                              style:const TextStyle(fontSize: 16),
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

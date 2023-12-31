import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/bloc/login_bloc/bloc/login_bloc.dart';
import 'package:interview_task/view/ui/home/home.dart';
import 'package:interview_task/view/ui/login/widgets/login_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("login".tr())),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoginFailureState) {
              return Center(child: Text('${"login_failed".tr()}: ${state.error}'));
            } else if (state is LoginSuccessState) {
              // return const Center(child: Text('Login successful'));
              return const HomeScreen();
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomTextFeildWidget(
                          controller: phoneController, lebel: "phone".tr()),
                      const SizedBox(height: 20),
                      CustomTextFeildWidget(
                          controller: passwordController, lebel: 'Password'.tr()),

                      const SizedBox(height: 20),
                      // TextFormField(
                      //   controller: macAddressController,
                      //   decoration: const InputDecoration(
                      //     labelText: 'Mac Address',
                      //     border: OutlineInputBorder(),
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<LoginBloc>(context).add(
                            LoginButtonPressed(
                              phone: phoneController.text,
                              password: passwordController.text,
                              macAddress:
                                  "886FE523-6BBC-4C8B-8981-01ECA8B48214",
                            ),
                          );
                        },
                        child:   Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40.0,
                            vertical: 15.0,
                          ),
                          child: Text(
                            'login'.tr(),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

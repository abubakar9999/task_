import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/bloc/home/home_bloc.dart';

import 'package:interview_task/view/ui/home/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeLodedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home").tr(),
        centerTitle: true,
      ),
      drawer: DrawerWidgets(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLodingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLodetState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [

                         // ************  photo
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        "https://aboutme-images-1.s3.amazonaws.com/background/users/a/b/u/abubakar9999_1605285555_568.jpg",
                        height: 150,
                        width: 150,
                      ),
                    ),

                    // ************  user INfo
                    HomeRow(
                      data: state.data["name"],
                      title: "name".tr(),
                    ),
                    HomeRow(
                      data: state.data["email"],
                      title: "email".tr(),
                    ),
                    HomeRow(
                      data: state.data["phone"],
                      title: "phone".tr(),
                    ),
                    HomeRow(
                      data: state.data["gender"],
                      title: "gender".tr(),
                    ),
                    HomeRow(
                      data: state.data["dob"],
                      title: "Dob".tr(),
                    ),
                    HomeRow(
                      data: state.data["division_id"].toString(),
                      title: "division_id".tr(),
                    ),
                    HomeRow(
                      data: state.data["district_id"].toString(),
                      title: "district_id".tr(),
                    ),
                    HomeRow(
                      data: state.data["address"],
                      title: "address".tr(),
                    ),
                  ],
                ),
              ),
            );
          }

          return const Center(
            child: Text("err"),
          );
        },
      ),
    );
  }
}

class HomeRow extends StatelessWidget {
  HomeRow({super.key, required this.data, required this.title});
  String data;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("$title :"), Text(data)],
      ),
    );
  }
}

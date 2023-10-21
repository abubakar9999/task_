import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interview_task/bloc/image_picker/pike_image_bloc.dart';

double getFileSize(File file) {
  int sizeInBytes = file.lengthSync();
  double sizeInKb = sizeInBytes / 1024;
  return sizeInKb;
}

XFile? serverImgLogo;
XFile? serverImgBanner;
void uploadImage(BuildContext context) async {
  //XFile? xf;
  try {
    XFile? xf = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 300,
      maxWidth: 400,
    );

    if (xf != null) {
      //validation variable
      String validImageExtension = 'jpg';
      int validImageLimitSizeInKb = 1024;
      if (xf.name.substring(xf.name.length - 3, xf.name.length) ==
              validImageExtension &&
          getFileSize(File(xf.path)) <= validImageLimitSizeInKb) {
        serverImgLogo = xf;
        File? resLogo = File(xf.path);
        // logo = resLogo.readAsBytesSync();
        BlocProvider.of<PikeImageBloc>(context)
            .add(PikeImagegallaryEvent(resLogo));
      }
    }
  } catch (e) {
    print(e);
  }
}

pickDate(BuildContext context, TextEditingController dob) async {
  DateTime dt = DateTime.now();
  await showDatePicker(
    context: context,
    initialDate: dt,
    firstDate: DateTime(DateTime.now().year - 100),
    lastDate: DateTime(DateTime.now().year + 10),
    builder: (context, child) {
      return Theme(
        data: ThemeData(
          primaryColor: Colors.white,
        ), // This will change to light theme.
        child: child!,
      );
    },
  ).then((value) {
    if (value != null) {
      dt = value;
      dob.text = value.toString().substring(0, 10);

      // BlocProvider.of<ReservationTableBloc>(context).add(ReservationTableSearchEvent(dt));
    }
  });
}



class CountryCode {
  List<DropdownMenuItem> dropdownItems = const [
    DropdownMenuItem(value: 93, child: Text('93')),
    DropdownMenuItem(value: 355, child: Text('355')),
    DropdownMenuItem(value: 213, child: Text('213')),
    DropdownMenuItem(value: 54, child: Text('54')),
    DropdownMenuItem(value: 374, child: Text('374')),
    DropdownMenuItem(value: 61, child: Text('61')),
    DropdownMenuItem(value: 973, child: Text('973')),
    DropdownMenuItem(value: 880, child: Text('880')),
    DropdownMenuItem(value: 32, child: Text('32')),
    DropdownMenuItem(value: 975, child: Text('975')),
    DropdownMenuItem(value: 591, child: Text('591')),
    DropdownMenuItem(value: 387, child: Text('387')),
    DropdownMenuItem(value: 55, child: Text('55')),
    DropdownMenuItem(value: 359, child: Text('359')),
    DropdownMenuItem(value: 86, child: Text('86')),
    DropdownMenuItem(value: 57, child: Text('57')),
    DropdownMenuItem(value: 45, child: Text('45')),
    DropdownMenuItem(value: 20, child: Text('20')),
    DropdownMenuItem(value: 358, child: Text('358')),
    DropdownMenuItem(value: 33, child: Text('33')),
    DropdownMenuItem(value: 49, child: Text('49')),
    DropdownMenuItem(value: 91, child: Text('91')),
    DropdownMenuItem(value: 81, child: Text('81')),
    DropdownMenuItem(value: 44, child: Text('44')),
   
  ];
}

bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }
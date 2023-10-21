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
void uploadLogo(BuildContext context) async {
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

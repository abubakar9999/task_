import 'package:flutter/material.dart';
import 'package:interview_task/bloc/image_picker/pike_image_bloc.dart';
import 'package:interview_task/view/ui/registaion/widgets/functions.dart';

//Date of birth
class Datepicker extends StatelessWidget {
  const Datepicker({
    super.key,
    required this.dob,
  });

  final TextEditingController dob;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: dob,
      style: const TextStyle(color: Colors.black),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'Date of Birth',
        contentPadding: const EdgeInsets.all(5.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        suffixIcon: const Icon(
          Icons.date_range_rounded,
          color: Colors.blueAccent,
          size: 30.0,
        ),
      ),
      onTap: () {
        pickDate(context, dob);
      },
    );
  }
}

//Profile Image
class Profilemage extends StatelessWidget {
  Profilemage({super.key, required this.state});
  ImageLoaddedState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 150,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.all(Radius.circular(12)),
          // color: Colors.yellow,
          border: Border.all(width: 4)),
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: state.logo == null
                ? Image.network(
                    'https://toppng.com/uploads/preview/roger-berry-avatar-placeholder-11562991561rbrfzlng6h.png',
                    fit: BoxFit.cover,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      state.logo!,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

//Gender
class Gender extends StatefulWidget {
  Gender({super.key, required this.gender});

  String gender;

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String select = '';

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      width: 160,
      child: RadioListTile(
        title: Text(widget.gender), // Replace 'gender' with an appropriate value or variable
        value: widget.gender.toLowerCase(), // Change to your desired value for male
        groupValue: select,
        onChanged: (value) {
          setState(() {
            select = value as String;
          });
        },
      ),
    );
  }
}

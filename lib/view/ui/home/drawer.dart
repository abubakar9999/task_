import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/bloc/theam_bloc/bloc/theam_bloc.dart';
import 'package:interview_task/view/ui/login/widgets/login.dart';

class DrawerWidgets extends StatelessWidget {
  const DrawerWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          //*************   Theme  */
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "themes".tr(),
                  style: const TextStyle(fontSize: 16),
                ),
                Switch(
                    value: context
                            .select((ThemeBloc themeBloc) => themeBloc.state) ==
                        ThemeMode.dark,
                    onChanged: (value) {
                      context
                          .read<ThemeBloc>()
                          .add(TheamChangeEvent(isDark: value));
                    }),
              ],
            ),
          ),

          //********* Language ***************** */
          CheckboxListTile(
            // tileColor: Colors.black54,
            title: Text('english'.tr()),
            value: context.locale.toString() == 'en',
            onChanged: (value) {
              context.setLocale(const Locale('en'));
              Navigator.of(context).pop();
            },
          ),
          CheckboxListTile(
            // tileColor: Colors.black54,
            title: Text('bangla'.tr()),
            value: context.locale.toString() == 'bn',
            onChanged: (value) {
              context.setLocale(const Locale('bn'));
              Navigator.of(context).pop();
            },
          ),
          CheckboxListTile(
            // tileColor: Colors.black54,
            title: Text('arabic'.tr()),
            value: context.locale.toString() == 'ar',
            onChanged: (value) {
              context.setLocale(const Locale('ar'));
              Navigator.of(context).pop();
            },
          ),
          IconButton.filled(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}

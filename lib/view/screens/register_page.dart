import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qit_flutter/Providers/register_provider.dart';

import '../../Providers/loadinf_provider.dart';
import '../../core/constants/appRoutes.dart';
import '../../core/function/validinput.dart';
import '../widgets/auth/apptextfield.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password2 = TextEditingController();
  late GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    final counter = ref.watch(LoadingStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register').tr(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                type: 'email',
                iconData: Icons.email_outlined,
                inputType: TextInputType.emailAddress,
                onChanged: (p0) {
                  return null;
                },
                validator: (val) {
                  // email = TextEditingController(text: val);
                  return validInput(val!, 4, 50, 'email');
                },
                textFieldController: email,
              ),
              AppTextField(
                type: 'username',
                iconData: Icons.person,
                inputType: TextInputType.text,
                onChanged: (p0) {
                  return null;
                },
                validator: (val) {
                  // email = TextEditingController(text: val);
                  return validInput(val!, 4, 50, 'username');
                },
                textFieldController: username,
              ),
              AppTextField(
                type: 'password',
                iconData: Icons.password,
                inputType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (p0) {
                  return null;
                },
                validator: (val) {
                  // password = TextEditingController(text: val);
                  return validInput(val!, 8, 50, 'password');
                },
                textFieldController: password1,
              ),
              AppTextField(
                type: 'c_password',
                iconData: Icons.password,
                inputType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (p0) {
                  return null;
                },
                validator: (val) {
                  // password = TextEditingController(text: val);
                  return validInput(val!, 8, 50, 'password');
                },
                textFieldController: password2,
              ),
              const SizedBox(
                height: 20,
              ),
              ref.read(LoadingStateProvider.notifier).state
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        ref.read(LoadingStateProvider.notifier).state = true;
                        await ref
                            .read(registerProvider.notifier)
                            .register(
                              email.text,
                              username.text,
                              password2.text,
                              password1.text,
                            )
                            .then((val) {
                          if (val) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.login,
                            );
                          }
                        });
                        ref.read(LoadingStateProvider.notifier).state = false;
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 10.h),
                        child: const Text('Register').tr(),
                      ),
                    ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
                child: const Text('login_account').tr(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

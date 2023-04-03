import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qit_flutter/core/constants/appRoutes.dart';
import '../../Providers/loadinf_provider.dart';
import '../../Providers/login_provider.dart';
import '../../core/function/validinput.dart';
import '../widgets/auth/apptextfield.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    final counter = ref.watch(LoadingStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login').tr(),
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
                textFieldController: password,
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
                            .read(loginProvider.notifier)
                            .login(email.text, password.text)
                            .then((val) {
                          if (val) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.home,
                              (route) => false,
                            );
                          }
                        });
                        ref.read(LoadingStateProvider.notifier).state = false;
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 10.h),
                        child: const Text('Login').tr(),
                      ),
                    ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.register);
                  },
                  child: const Text('have_account').tr())
            ],
          ),
        ),
      ),
    );
  }
}

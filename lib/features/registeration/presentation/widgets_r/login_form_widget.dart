import 'package:find_partner_app/features/registeration/domain/entities_r/log_in_entity.dart';
import 'package:find_partner_app/features/registeration/presentation/bloc_r/login_bloc/login_bloc.dart';
import 'package:find_partner_app/features/registeration/presentation/pages_r/form_submit_btn.dart';
import 'package:find_partner_app/features/registeration/presentation/widgets_r/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInFormWdg extends StatefulWidget {
  const LogInFormWdg({Key? key}) : super(key: key);

  @override
  State<LogInFormWdg> createState() => _LogInFormWdgState();
}

class _LogInFormWdgState extends State<LogInFormWdg> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController username_or_email_ctrl = TextEditingController();
  TextEditingController password_ctrl = TextEditingController();
  bool remember_Client_ctrl = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormFieldWidget(
              controller: username_or_email_ctrl,
              name: "user name or Email",
              obscureText: false,
            ),
            TextFormFieldWidget(
              controller: password_ctrl,
              name: "password",
              obscureText: true,
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: Colors.red,
                  checkColor: Colors.black,
                  value: remember_Client_ctrl,
                  onChanged: (value) {
                    setState(() {
                      remember_Client_ctrl = value!;
                      print('changed $remember_Client_ctrl');
                    });
                  },
                ),
                const Text('remember me')
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            FormSubmitBtn(
                buttonTxt: "logIn",
                onPressed: () {
                  final isValid = _formkey.currentState!.validate();
                  if (isValid) {
                    loginuser();
                  }
                })
          ],
        ),
      ),
    );
  }

  void loginuser() {
    final LogIn logIn = LogIn(
        userNameOrEmailAddress: username_or_email_ctrl.text,
        password: password_ctrl.text,
        rememberClient: remember_Client_ctrl.toString());
    print("login btn has triged");
    BlocProvider.of<LoginBloc>(context, listen: false)
        .add(LoginUserEvent(logIn: logIn));
  }
}

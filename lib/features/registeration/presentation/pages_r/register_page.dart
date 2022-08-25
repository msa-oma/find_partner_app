import 'package:find_partner_app/core/util/snackbar_message.dart';
import 'package:find_partner_app/features/registeration/presentation/widgets_r/regis_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_r/register_bloc/register_bloc.dart';
import 'welcome_page.dart';

class RegisterPage extends StatelessWidget {
  //final Register register;

  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _buildBody(),
    );
  }

  AppBar _appbar() {
    return AppBar(
        title: const Text(
      "register for new partner",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ));
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is MessageRegisterState) {
              SnackBarMessage().showSuccessSnackBar(
                  message: state.message, context: context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const WelcomePage()),
                  (route) => false);
            } else if (state is ErrorRegisterState) {
              SnackBarMessage()
                  .showErrorSnackBar(message: state.message, context: context);
            }
          },
          builder: (context, state) {
            return const RegisterForm();
          },
        ),
      ),
    );
  }
}

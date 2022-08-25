import 'package:find_partner_app/features/registeration/presentation/pages_r/welcome_page.dart';
import 'package:find_partner_app/features/registeration/presentation/widgets_r/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/snackbar_message.dart';
import '../bloc_r/login_bloc/login_bloc.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

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
      "Log In User",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ));
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<LoginBloc, LoginState>(
          builder: (context, state) {
            return const LogInFormWdg();
          },
          listener: (context, state) {
            if (state is DoneLoginState) {
              SnackBarMessage().showSuccessSnackBar(
                  message: state.message, context: context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const WelcomePage()),
                  (route) => false);
            } else if (state is ErrorLoginState) {
              SnackBarMessage()
                  .showErrorSnackBar(message: state.message, context: context);
            }
          },
        ),
      ),
    );
  }
}

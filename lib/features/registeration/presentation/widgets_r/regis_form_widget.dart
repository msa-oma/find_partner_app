// ignore_for_file: non_constant_identifier_names
import 'package:find_partner_app/features/cities/presentation/bloc/cities/cities_bloc.dart';
import 'package:find_partner_app/features/registeration/domain/entities_r/register.dart';
import 'package:find_partner_app/features/registeration/presentation/bloc_r/register_bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cities/presentation/bloc/cities/cities_bloc.dart';
import '../../../cities/presentation/pages/Cities_dropdown_page.dart';
import '../pages_r/countries_dropdown_page.dart';
import '../pages_r/form_submit_btn.dart';
import 'profile_image.dart';
import 'text_form_field_widget.dart';

// need to add//wrap BlocProvider to provide Context to this widget
class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name_ctrl = TextEditingController();
  TextEditingController gender_ctrl = TextEditingController();
  TextEditingController age_ctrl = TextEditingController();
  TextEditingController cityId_ctrl = TextEditingController();
  TextEditingController countryId_ctrl = TextEditingController();
  TextEditingController phoneNumber_ctrl = TextEditingController();
  TextEditingController emailAddress_ctrl = TextEditingController();
  TextEditingController password_ctrl = TextEditingController();
  TextEditingController avatar_ctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Imageforprofile(),
            const CitiesDrDownPage(),
            const CountriesDrDownPage(),
            TextFormFieldWidget(
              controller: name_ctrl,
              name: "your neme",
              obscureText: false,
            ),
            TextFormFieldWidget(
              controller: gender_ctrl,
              name: "gender",
              obscureText: false,
            ),
            TextFormFieldWidget(
              controller: age_ctrl,
              name: "your age",
              obscureText: false,
            ),
            TextFormFieldWidget(
              controller: cityId_ctrl,
              name: "city ",
              obscureText: false,
            ),
            TextFormFieldWidget(
              controller: countryId_ctrl,
              name: "country",
              obscureText: false,
            ),
            TextFormFieldWidget(
              controller: phoneNumber_ctrl,
              name: "phone Number",
              obscureText: false,
            ),
            TextFormFieldWidget(
              controller: emailAddress_ctrl,
              name: "email Address",
              obscureText: false,
            ),
            TextFormFieldWidget(
              controller: password_ctrl,
              name: "password",
              obscureText: true,
            ),
            TextFormFieldWidget(
              controller: avatar_ctrl,
              name: "avatar",
              obscureText: false,
            ),
            FormSubmitBtn(
              buttonTxt: "Rigester ",
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if (1 == 1) {
                  registerNewUser(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void registerNewUser(BuildContext context) {
    // var imagefilex = ImageProfile().imagefile;
    // final bytes = File(imagefilex!.path).readAsBytesSync();
    // String img64 = base64Encode(bytes);
    // print('image is $img64');
    // PrfImageVM prfimgvn = Provider.of<PrfImageVM>(context, listen: false);

    //  var m = prfimgvn.selectedImage64.toString();
    String avatar = BlocProvider.of<RegisterBloc>(context).selectediImage!;
    int city_id = BlocProvider.of<CitiesBloc>(context).selectedCityIDB!;
    final Register register = Register(
      name: "msamsa", //name_ctrl.text,
      gender: 1, //int.tryParse(gender_ctrl.text)!,
      age: 32, // int.tryParse(age_ctrl.text)!,
      cityId: city_id, //selectedCityIDR, //int.tryParse(cityId_ctrl.text)!,
      countryId: 1, //int.tryParse(countryId_ctrl.text)!,
      phoneNumber: "14557285", // phoneNumber_ctrl.text,
      emailAddress: "msall@gmail.com", //emailAddress_ctrl.text,
      password: "558899663355", //password_ctrl.text,
      avatar: avatar, //avatar_ctrl.text,
    );
    print("onPressed has triged");
    BlocProvider.of<RegisterBloc>(context, listen: false)
        .add(RegisterUserEvent(register: register));
  }
}

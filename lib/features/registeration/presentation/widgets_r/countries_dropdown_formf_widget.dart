import 'package:find_partner_app/features/registeration/domain/entities_r/country_entity.dart';
import 'package:find_partner_app/features/registeration/presentation/bloc_r/register_bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesDropdownWidget extends StatefulWidget {
  final List<Country> countries;
  const CountriesDropdownWidget({Key? key, required this.countries})
      : super(key: key);

  @override
  State<CountriesDropdownWidget> createState() =>
      _CountriesDropdownWidgetState();
}

class _CountriesDropdownWidgetState extends State<CountriesDropdownWidget> {
  int? selectedCountryID;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return DropdownButtonFormField<int>(
          value: selectedCountryID,
          items: widget.countries
              .map((Country item) => DropdownMenuItem<int>(
                    child: Text(item.name),
                    value: item.id,
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedCountryID = value;
            });

            //add event
            context
                .read<RegisterBloc>()
                .add(SelectedCountryIDEvent(selectedCountryIDE: value!));
            print('value selected =$selectedCountryID');
          },
        );
      },
    );
  }
}

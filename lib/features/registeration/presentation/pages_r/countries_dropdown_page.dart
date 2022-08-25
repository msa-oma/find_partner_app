import 'package:find_partner_app/features/registeration/presentation/bloc_r/register_bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../widgets_r/countries_dropdown_formf_widget.dart';

class CountriesDrDownPage extends StatelessWidget {
  const CountriesDrDownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is LoadedCountriesState) {
            return CountriesDropdownWidget(countries: state.countries);
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}


/**class CitiesDrDownPage extends StatelessWidget {
  const CitiesDrDownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<CitiesBloc, CitiesState>(
        builder: (context, state) {
          if (state is LoadedCitiesState) {
            return CitiesDropdownWidget(
              cities: state.cities,
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
 */
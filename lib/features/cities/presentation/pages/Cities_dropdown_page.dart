import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../bloc/cities/cities_bloc.dart';
import '../widgets/cities_dropdown_formf_widget.dart';

class CitiesDrDownPage extends StatelessWidget {
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

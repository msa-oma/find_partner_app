import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/city.dart';
import '../bloc/cities/cities_bloc.dart';

class CitiesDropdownWidget extends StatefulWidget {
  final List<City> cities;

  const CitiesDropdownWidget({Key? key, required this.cities})
      : super(key: key);

  @override
  State<CitiesDropdownWidget> createState() => _CitiesDropdownWidgetState();
}

class _CitiesDropdownWidgetState extends State<CitiesDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    ///wrap with bloc something blocprovider

    int? selectedCityID;
    //last add BlocBuilder
    return BlocBuilder<CitiesBloc, CitiesState>(
      //bloc: BlocProvider.of<CitiesBloc>(context),
      builder: (context, state) {
        return DropdownButtonFormField<int>(
          value: selectedCityID,
          hint: const Text('select city'),
          items: widget.cities
              .map(
                (City item) => DropdownMenuItem<int>(
                  child: Text(item.name),
                  value: item.id,
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedCityID = value;
            });

            //add event
            context
                .read<CitiesBloc>()
                .add(SelectedCityIDEvent(selectedCityIDE: value!));
            print('value selected =$selectedCityID');
          },
        );
      },
    );
  }
}

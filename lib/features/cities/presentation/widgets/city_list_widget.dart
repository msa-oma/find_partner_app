import 'package:flutter/material.dart';

import '../../domain/entities/city.dart';

class CityListWidget extends StatelessWidget {
  final List<City> cities;
  const CityListWidget({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cities.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(cities[index].id.toString()),
          title: Text(
            cities[index].name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            cities[index].countryName,
            style: const TextStyle(fontSize: 16),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          onTap: () {},
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(thickness: 1);
      },
    );
  }
}

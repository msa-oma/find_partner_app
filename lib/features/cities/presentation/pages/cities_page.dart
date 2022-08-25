import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../bloc/cities/cities_bloc.dart';
import '../widgets/city_list_widget.dart';
import '../widgets/message_display_widget.dart';

//// it was for ListView
class CitiesPage extends StatelessWidget {
  const CitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('find partner'),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<CitiesBloc, CitiesState>(
        builder: (context, state) {
          if (state is LoadingCitiesState) {
            return const LoadingWidget();
          } else if (state is LoadedCitiesState) {
            return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: CityListWidget(cities: state.cities));
          } else if (state is ErrorCitiesState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<CitiesBloc>(context).add(RefreshCitiesEvent());
  }
}

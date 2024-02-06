import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:missing_finder/ViewModel/Logic/Cubit/layout_cubit.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'soon';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
                child:
                    Lottie.asset('assets/images/soon.json', fit: BoxFit.fill)),
          );
        });
  }
}

import 'package:cars/features/auth/presentation/view/widgets/create_new_pass_body.dart';
import 'package:flutter/material.dart';

class CreatePassView extends StatelessWidget {
  const CreatePassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CreatePassBody(),
    );
  }
}

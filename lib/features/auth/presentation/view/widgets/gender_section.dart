import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/style.dart';
import 'package:flutter/material.dart';

class GenderSection extends StatefulWidget {
  const GenderSection({super.key});

  @override
  _GenderSectionState createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  Gender selectedGender = Gender.Male;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildRadioButton(Gender.Male),
          buildRadioButton(Gender.Female),
        ],
      ),
    );
  }

  Widget buildRadioButton(Gender gender) {
    return Row(
      children: [
        Radio<Gender>(
          value: gender,
          fillColor: MaterialStateProperty.all(
            Theme.of(context).canvasColor,
          ),
          groupValue: selectedGender,
          onChanged: (value) => setState(() => selectedGender = value!),
        ),
        Text(
          gender.name,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).canvasColor,
              ),
        ),
      ],
    );
  }
}

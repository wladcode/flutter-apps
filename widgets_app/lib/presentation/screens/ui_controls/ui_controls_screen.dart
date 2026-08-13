import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ui Controls Screen')),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Gender { male, female, other }

class _UiControlsViewState extends State<_UiControlsView> {
  bool _isDeveloperMode = false;
  Gender _gender = Gender.male;
  void _toggleDeveloperMode() {
    setState(() {
      _isDeveloperMode = !_isDeveloperMode;
    });
  }

  bool _acceptTermsAndConditions = false;
  void _setAcceptTermsAndConditions(bool value) {
    setState(() {
      _acceptTermsAndConditions = value;
    });
  }

  void _setGender(Gender value) {
    setState(() {
      _gender = value;
    });
  }

bool _eatBreakfast = false;
bool _eatLunch = false;
bool _eatDinner = false;


  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: Text('Controla las preferencias de la aplicación'),
          value: _isDeveloperMode,
          onChanged: (value) {
            _toggleDeveloperMode();
          },
        ),

        RadioGroup<Gender>(
          groupValue: _gender,
          onChanged: (value) {
            if (value != null) _setGender(value);
          },
          child: Column(
            children: [
              RadioListTile(
                title: Text('Male'),
                subtitle: Text('Male gender'),
                value: Gender.male,
              ),
              RadioListTile(
                title: Text('Female'),
                subtitle: Text('Female gender'),
                value: Gender.female,
              ),
              RadioListTile(
                title: Text('Other'),
                subtitle: Text('Other gender'),
                value: Gender.other,
              ),
            ],
          ),
        ),

        ExpansionTile(
          title: Text('Gender'),
          subtitle: Text('gender subtitle'),
          children: [
            RadioGroup<Gender>(
              groupValue: _gender,
              onChanged: (value) {
                if (value != null) _setGender(value);
              },
              child: Column(
                children: [
                  RadioListTile(
                    title: Text('Male'),
                    subtitle: Text('Male gender'),
                    value: Gender.male,
                  ),
                  RadioListTile(
                    title: Text('Female'),
                    subtitle: Text('Female gender'),
                    value: Gender.female,
                  ),
                  RadioListTile(
                    title: Text('Other'),
                    subtitle: Text('Other gender'),
                    value: Gender.other,
                  ),
                ],
              ),
            ),
          ],
        ),


        CheckboxListTile(
          title: Text('Breakfast?'),
          subtitle: Text('Do you want to eat breakfast?'),
          value: _eatBreakfast,
          onChanged: (value) {
            setState(() {
              _eatBreakfast = !_eatBreakfast;
            });
          },
        ),

        CheckboxListTile(
          title: Text('Lunch?'),
          subtitle: Text('Do you want to eat lunch?'),
          value: _eatLunch,
          onChanged: (value) {
            setState(() {
              _eatLunch = !_eatLunch;
            });
          },
        ),

        CheckboxListTile(
          title: Text('Dinner?'),
          subtitle: Text('Do you want to eat dinner?'),
          value: _eatDinner,
          onChanged: (value) {
            setState(() {
              _eatDinner = !_eatDinner;
            });
          },
        ),
      ],
    );
  }
}

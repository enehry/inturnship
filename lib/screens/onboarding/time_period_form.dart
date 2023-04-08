import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:inturnship/widgets/dropdown_select.dart';
import 'package:inturnship/widgets/form_input.dart';
import 'package:inturnship/widgets/primary_button.dart';

class HoursPerDay {
  final int hours;
  final String label;

  @override
  String toString() {
    return label;
  }

  HoursPerDay({required this.hours, required this.label});
}

class TimePeriodForm extends StatefulWidget {
  const TimePeriodForm({super.key});

  @override
  State<TimePeriodForm> createState() => _TimePeriodFormState();
}

class _TimePeriodFormState extends State<TimePeriodForm> {
  final _formTimePeriodKey = GlobalKey<FormState>();
  final _textTotalHoursController = TextEditingController();

  final List<HoursPerDay> _choices = [
    HoursPerDay(hours: 4, label: '4 hours'),
    HoursPerDay(hours: 6, label: '6 hours'),
    HoursPerDay(hours: 8, label: '8 hours'),
    HoursPerDay(hours: 10, label: '10 hours'),
    HoursPerDay(hours: 12, label: '12 hours'),
  ];

  HoursPerDay? selectedValue;

  // calculate total days by dividing hours by hours per day
  int? totalDays;

  @override
  void initState() {
    _textTotalHoursController.addListener(() {
      setState(() {
        setTotalDays();
      });
    });
    super.initState();
  }

  void setTotalDays() {
    // check if hours per day is selected
    if (selectedValue == null) return;
    // check if total hours is empty
    if (_textTotalHoursController.text.isEmpty) return;
    totalDays =
        (int.parse(_textTotalHoursController.text) / selectedValue!.hours)
            .ceil();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formTimePeriodKey,
      child: Expanded(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormInput(
                    textController: _textTotalHoursController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    keyboardType: TextInputType.number,
                    labelText:
                        'How many hours do you need to complete your Internship?',
                    hintText: 'Enter hours ex. 400',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Hours is required';
                      } else if (value.length < 3) {
                        return 'Hours must be at least 3 characters long';
                      }
                      return null;
                    },
                  ),
                  DropdownSelect<HoursPerDay>(
                    items: _choices,
                    selectedValue: selectedValue,
                    hinText: 'Select hours per day',
                    onChanged: (value) {
                      setState(
                        () {
                          selectedValue = value;
                          setTotalDays();
                        },
                      );
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Hours per day is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Your internship will be finish within',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16.0),
                  // circular container for the number of days
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${totalDays ?? 0}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          Text(
                            'DAYS',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: PrimaryButton(
                textLabel: 'Ok Cool',
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  if (_formTimePeriodKey.currentState!.validate()) {
                    context.goNamed('HomeScreen');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

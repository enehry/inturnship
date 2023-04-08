import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inturnship/widgets/dropdown_select.dart';
import 'package:inturnship/widgets/form_input.dart';
import 'package:inturnship/widgets/primary_button.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _textNameController = TextEditingController();
  final _textAddressController = TextEditingController();
  final _textYearSectionController = TextEditingController();
  final _textAdviserController = TextEditingController();

  // Host Training Establishment Data
  final _textHteNameController = TextEditingController();
  final _textHteAddressController = TextEditingController();
  final _textHteContactController = TextEditingController();

  final List<String> _universities = [
    'University of Rizal System Binangonan',
    'University of Rizal System Morong',
  ];

  String? _selectedUniversity;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormInput(
            labelText: 'Full Name',
            textController: _textNameController,
            hintText: 'Your full name ex. Juan C. Dela Cruz',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Your name is required';
              } else if (value.length < 5) {
                return 'Your name must be at least 5 characters long';
              }
              return null;
            },
          ),
          FormInput(
            labelText: 'Home Address',
            maxLines: 3,
            minLines: 1,
            textController: _textAddressController,
            hintText: 'Your address ex. 12 Street, Barangay, City...',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Your address is required';
              } else if (value.length < 5) {
                return 'Your address must be at least 5 characters long';
              }
              return null;
            },
          ),
          DropdownSelect<String>(
            items: _universities,
            selectedValue: _selectedUniversity,
            onChanged: (value) {
              setState(() {
                _selectedUniversity = value;
              });
            },
            hinText: 'Select your university',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Your university is required';
              }
              return null;
            },
          ),
          FormInput(
            labelText: 'Year & Section',
            textController: _textYearSectionController,
            hintText: 'Your year and section ex. BSIT 4-1',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Your year and section is required';
              } else if (value.length < 5) {
                return 'Your year and section must be at least 5 characters long';
              }
              return null;
            },
          ),
          FormInput(
            labelText: 'Adviser',
            textController: _textAdviserController,
            hintText: 'Your adviser ex. Dr. Juan Dela Cruz',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Your adviser is required';
              } else if (value.length < 5) {
                return 'Your adviser must be at least 5 characters long';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          Container(
            height: 1.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16.0),
          FormInput(
            labelText: 'Host Training Establishment Name',
            textController: _textHteNameController,
            hintText: 'Your HTE name ex. Company Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Your HTE name is required';
              } else if (value.length < 5) {
                return 'Your HTE name must be at least 2 characters long';
              }
              return null;
            },
          ),
          FormInput(
            labelText: 'HTE Address',
            maxLines: 3,
            minLines: 1,
            textController: _textHteAddressController,
            hintText: 'Your HTE address ex. 12 Street, Barangay, City...',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Your HTE address is required';
              } else if (value.length < 5) {
                return 'Your HTE address must be at least 5 characters long';
              }
              return null;
            },
          ),
          FormInput(
            labelText: 'HTE Contact Number',
            textController: _textHteContactController,
            hintText: 'Your HTE contact number ex. 09123456789',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Your HTE contact number is required';
              } else if (value.length < 5) {
                return 'Your HTE contact number must be at least 5 characters long';
              }
              return null;
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: PrimaryButton(
              textLabel: 'Continue',
              onPressed: () {
                context.push('/onboarding/time-period');
              },
              icon: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}

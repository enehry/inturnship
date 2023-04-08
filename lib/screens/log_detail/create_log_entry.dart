import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inturnship/utils/constant.dart';
import 'package:inturnship/widgets/primary_button.dart';

class CreateLogEntry extends StatelessWidget {
  const CreateLogEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: kVerticalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: 'create-log-entry',
                  child: Material(
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        // do something
                        context.pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2.0,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          color: Colors.transparent,
                        ),
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.close,
                          size: 24.0,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                      minLines: 1,
                      maxLines: 10,
                      // remove the decoration
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.all(0.0),
                        hintText: 'Tap to start typing...',
                        hintStyle:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .primaryColorLight
                                      .withOpacity(0.5),
                                ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Wrap(
                      spacing: 12.0,
                      runSpacing: 8.0,
                      children: [
                        TextButton.icon(
                          onPressed: () async {
                            final DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            if (selectedDate != null) {
                              // do something with the selected date
                            }
                          },
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            color: Theme.of(context).primaryColorLight,
                            size: 20.0,
                          ),
                          label: Text('Today',
                              style: Theme.of(context).textTheme.bodyMedium),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              side: BorderSide(
                                color: Theme.of(context).primaryColorLight,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // do something
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Theme.of(context).primaryColorLight,
                            size: 20.0,
                          ),
                          label: Text('Remarks',
                              style: Theme.of(context).textTheme.bodyMedium),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              side: BorderSide(
                                color: Theme.of(context).primaryColorLight,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // do something
                          },
                          icon: Icon(
                            Icons.access_time_outlined,
                            color: Theme.of(context).primaryColorLight,
                            size: 20.0,
                          ),
                          label: Text('Time',
                              style: Theme.of(context).textTheme.bodyMedium),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              side: BorderSide(
                                color: Theme.of(context).primaryColorLight,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: PrimaryButton(
                  textLabel: 'Save',
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

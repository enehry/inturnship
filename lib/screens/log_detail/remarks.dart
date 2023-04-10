import 'package:flutter/material.dart';
import 'package:inturnship/widgets/circle_icon_button.dart';
import 'package:go_router/go_router.dart';

class Remarks extends StatefulWidget {
  const Remarks({
    super.key,
    required this.onSaved,
  });

  final Function(String) onSaved;

  @override
  State<Remarks> createState() => _RemarksState();
}

class _RemarksState extends State<Remarks> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String remarks = controller.text;

    return TextButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // title: const Text('Remarks'),
              content: TextField(
                controller: controller,
                style: Theme.of(context).textTheme.bodyMedium,
                minLines: 3,
                maxLines: 10,
                // remove the decoration
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.all(0.0),
                  hintText: 'Tap to add remarks...',
                  hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .primaryColorLight
                            .withOpacity(0.5),
                      ),
                ),
              ),
              actions: <Widget>[
                Hero(
                  tag: 'remarks',
                  child: CircleIconButton(
                    icon: Icons.close,
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
                CircleIconButton(
                  icon: Icons.check,
                  onPressed: () {
                    widget.onSaved(remarks);
                    context.pop();
                  },
                ),
              ],
            );
          },
        );
      },
      icon: Icon(
        Icons.edit_outlined,
        color: Theme.of(context).primaryColorLight,
        size: 20.0,
      ),
      label: Text('Remarks', style: Theme.of(context).textTheme.bodyMedium),
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
          side: BorderSide(
            color: Theme.of(context).primaryColorLight,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}

import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

enum TextFieldType { input, date, time, gost }

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.type = TextFieldType.input,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.enable,
  });
  final String label;
  final TextFieldType type;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final bool? enable;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focus = FocusNode();
  bool _isFocus = false;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      setState(() {
        if (_controller.text.isEmpty) _isFocus = !_isFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        _isFocus
            ? AnimatedOpacity(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeIn,
                opacity: _isFocus ? 1.0 : 0,
                child: Text(
                  widget.label,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              )
            : const SizedBox(),
        SizedBox(height: 4.h),
        TextField(
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          expands: widget.expands,
          controller: _controller,
          focusNode: _focus,
          readOnly: widget.type != TextFieldType.input &&
              widget.type != TextFieldType.gost,
          enabled: widget.enable,
          style: Theme.of(context).textTheme.labelMedium,
          keyboardType:
              TextFieldType.gost == widget.type ? TextInputType.number : null,
          maxLength: TextFieldType.gost == widget.type ? 2 : null,
          decoration: InputDecoration(
            counterText: '',
            alignLabelWithHint: true,
            labelText: widget.label,
            suffixIcon: _isFocus || TextFieldType.input != widget.type
                ? IconButton(
                    onPressed: () async {
                      switch (widget.type) {
                        case TextFieldType.input:
                          _controller.clear();
                          break;
                        case TextFieldType.date:
                          {
                            final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2025),
                            );
                            if (date != null) {
                              _controller.text =
                                  DateFormat("dd.MM.yyyy").format(date);
                              setState(() {
                                _isFocus = true;
                              });
                            }
                            break;
                          }
                        case TextFieldType.time:
                          {
                            final time = DateTime.now();
                            final date = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(
                                hour: time.hour,
                                minute: time.minute,
                              ),
                            );
                            if (date != null) {
                              _controller.text = date.format(context);
                              setState(() {
                                _isFocus = true;
                              });
                            }
                            break;
                          }
                        case TextFieldType.gost:
                          break;
                      }
                    },
                    icon: Icon(
                      switch (widget.type) {
                        TextFieldType.input => Icons.clear,
                        TextFieldType.date => Icons.calendar_today_outlined,
                        TextFieldType.time => Icons.access_time_outlined,
                        TextFieldType.gost => null,
                      },
                    ),
                    color: AppColor.text4,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

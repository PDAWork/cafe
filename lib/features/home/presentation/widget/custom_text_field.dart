import 'package:cafe/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TextFieldType {
  input,
  date,
  time,
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.type = TextFieldType.input,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
  });
  final String label;
  final TextFieldType type;
  final int? maxLines;
  final int? minLines;
  final bool expands;
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
          readOnly: widget.type != TextFieldType.input,
          style: Theme.of(context).textTheme.labelMedium,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: widget.label,
            suffixIcon: _isFocus || TextFieldType.input != widget.type
                ? IconButton(
                    onPressed: () {
                      switch (widget.type) {
                        case TextFieldType.input:
                          _controller.clear();
                          break;
                        case TextFieldType.date:
                          {
                            break;
                          }
                        case TextFieldType.time:
                          {
                            break;
                          }
                      }
                    },
                    icon: Icon(
                      switch (widget.type) {
                        TextFieldType.input => Icons.clear,
                        TextFieldType.date => Icons.calendar_today_outlined,
                        TextFieldType.time => Icons.access_time_outlined,
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

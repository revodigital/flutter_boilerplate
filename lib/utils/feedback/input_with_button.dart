/*import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/button.dart';

class InputWithButton extends StatefulWidget {
  final void Function(String) callback;
  final Uint8List? image;

  const InputWithButton({super.key, required this.callback, required this.image});

  @override
  State<InputWithButton> createState() => _InputWithButton();
}

class _InputWithButton extends State<InputWithButton> {
  final _controller = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.image != null) ...[
          Image.memory(widget.image!, height: Adaptive.px(140),),
          SizedBox(height: Adaptive.px(16)),
        ],
        TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MaterialColors.primary.k60, width: 1.0),
            ),
            hintText: 'Descrizione',
          ),
          maxLines: 3,
          keyboardType: TextInputType.multiline,
        ),
        SizedBox(height: Adaptive.px(16)),
        CustomButton(
          label: "Invia",
          fit: CustomButtonFit.full,
          type: CustomButtonType.primary,
          isLoading: _isLoading,
          onPressed: () {
            _isLoading = true;
            setState(() {});
            widget.callback(_controller.text);
          },
        ),
      ],
    );
  }
}*/
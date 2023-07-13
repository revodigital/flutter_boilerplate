import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../components/CustomButton.dart';

class InputWithButton extends StatefulWidget {
  final void Function(String) callback;
  final Uint8List image;

  const InputWithButton({super.key, required this.callback, required this.image});

  @override
  State<InputWithButton> createState() => _InputWithButton();
}

class _InputWithButton extends State<InputWithButton> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.memory(widget.image, width: Adaptive.w(20), height: Adaptive.w(40),),
        Divider(height: Adaptive.w(5), color: Colors.transparent),
        TextFormField(
          controller: _controller,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
            ),
            hintText: 'Descrizione',
          ),
          maxLines: 3,
          keyboardType: TextInputType.multiline,
        ),
        Divider(height: Adaptive.w(5), color: Colors.transparent),
        CustomButton(
          label: "Invia",
          onPress: () {
            widget.callback(_controller.text);
          },
        ),
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.label, required this.onPress, this.buttonStyle});

  final String label;
  final Function onPress;
  final ButtonStyle? buttonStyle;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _loadingButton = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _loadingButton ? null : () {
        _loadingButton = true;
        setState(() { });

        widget.onPress().then(() {
          _loadingButton = false;
          setState(() { });
        });
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: Adaptive.w(3)),
          elevation: 0.0
      ).merge(widget.buttonStyle),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _loadingButton ?
          Container(
            width: Adaptive.w(6),
            height: Adaptive.w(6),
            margin: EdgeInsets.only(right: Adaptive.w(3)),
            child: const CircularProgressIndicator.adaptive(backgroundColor: Colors.black26,),
          )
              :
          Container(),
          Text(widget.label, style: TextStyle(fontSize: Adaptive.px(20)),)
        ],
      ),
    );
  }
}

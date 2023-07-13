import 'dart:async';

import 'package:flutter/cupertino.dart';

class TouchableOpacity extends StatefulWidget {
  final Function onPress;
  final Function? onLongPress;
  final Widget child;

  const TouchableOpacity({
    required this.onPress,
    required this.child,
    this.onLongPress,
    super.key
  });

  @override
  State<StatefulWidget> createState() => _TouchableOpacity();
}

class _TouchableOpacity extends State<TouchableOpacity>{
  bool _visible = true;

  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTapCancel: () => {
        setState(() {
          _visible = true;
        })
      },
      onTapDown: (TapDownDetails details) => {
        setState(() {
          _visible = false;
        })
      },
      onTapUp: (TapUpDetails details) => {
        Timer(const Duration(milliseconds: 100), () =>
            setState(() {
              _visible = true;
            })
        )
      },
      onTap: () => {
        widget.onPress()
      },
      onLongPress: () => {
        widget.onLongPress ?? widget.onLongPress!()
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.5,
        duration: const Duration(milliseconds: 100),
        // The green box must be a child of the AnimatedOpacity widget.
        child: widget.child,
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../TouchableOpacity.dart';

class ModalWithHeader extends StatelessWidget {
  const ModalWithHeader({super.key, required this.title, required this.titleColor, required this.children});

  final String title;
  final Color titleColor;
  final List<Widget> children;

  static void show({
    required BuildContext context,
    required String headerLabel,
    required List<Widget> children,
    Color? headerLabelColor,
    Function? whenCompleted
  }) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return ModalWithHeader(
            title: headerLabel,
            titleColor: headerLabelColor ?? Colors.black54,
            children: children
        );
      },
    ).whenComplete(() {
      whenCompleted != null ? whenCompleted() : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(bottom: Adaptive.w(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.all(Adaptive.w(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: CupertinoColors.systemGrey6, borderRadius: BorderRadius.all(Radius.circular(100))),
                        child: TouchableOpacity(
                            onPress: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(Adaptive.w(2)),
                              child: Icon(
                                Icons.close,
                                size: 20,
                                color: Theme.of(context).textTheme.bodyMedium!.color,
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
                    constraints: BoxConstraints(maxWidth: Adaptive.w(90)),
                    child: DefaultTextStyle(
                      style: TextStyle(color: titleColor, fontSize: Adaptive.px(25), fontWeight: FontWeight.bold),
                      child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis
                      ),
                    )
                ),
                Divider(height: Adaptive.w(10), color: Colors.transparent),
                for(Widget child in children) child
              ],
            )
        ),
      )
    );
  }
}

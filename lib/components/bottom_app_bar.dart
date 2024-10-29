import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_revo_boilerplate/model/auth_model.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomBottomAppBar extends StatefulWidget {
  final int? initialIndex;
  final ScrollController homeScrollController = ScrollController();
  final ScrollController reviewsScrollController = ScrollController();

  CustomBottomAppBar({
    super.key,
    this.initialIndex
  });

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBar();
}

class _CustomBottomAppBar extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.initialIndex ?? 0;
    super.initState();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index){
      if (index == 0) {
        widget.homeScrollController.animateTo(0.0, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
        setState(() {});
      } else if (index == 2) {
        widget.reviewsScrollController.animateTo(0.0, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
        setState(() {});
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _buildTabItem({
    required IconData icon,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    required bool disabled,
    int badgeCount = 0,
  }) {
    Color color = isSelected ? Colors.white : CustomColors.neutral[80]!;

    return Opacity(
      opacity: disabled ? 0.5 : 1,
      child: GestureDetector(
        onTap: disabled ? (){} : onTap,
        behavior: HitTestBehavior.opaque,
        child: badgeCount > 0
            ? Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(icon, color: color, size: Adaptive.px(20),),
                SizedBox(height: Adaptive.px(8),),
                Text(text, style: isSelected ? CustomTypography.caption['bold']!.copyWith(color: color) : CustomTypography.caption['medium']!.copyWith(color: color)),
              ],
            ),
            Positioned(
              top: Adaptive.px(-4),
              right: Adaptive.px(6),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.primary[50],
                  borderRadius: BorderRadius.circular(6),
                ),
                width: Adaptive.px(14),
                height: Adaptive.px(14),
                child: Center(
                  child: Text(
                    '$badgeCount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Adaptive.px(12),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        )
            : Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: color, size: Adaptive.px(20),),
            SizedBox(height: Adaptive.px(8),),
            Text(text, style: isSelected ? CustomTypography.caption['bold']!.copyWith(color: color) : CustomTypography.caption['medium']!.copyWith(color: color)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        Container(),
        Container(),
        Container(),
      ][_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(Adaptive.px(20)), topRight: Radius.circular(Adaptive.px(20))),
        child: BottomAppBar(
          color: CustomColors.neutral[10],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildTabItem(
                icon: _selectedIndex == 0 ? FontAwesomeIcons.solidHouse : FontAwesomeIcons.house,
                text: 'Home',
                isSelected: _selectedIndex == 0,
                onTap: () => _onItemTapped(0),
                disabled: AuthGetModel().id == null
              ),
              _buildTabItem(
                icon: _selectedIndex == 1 ? FontAwesomeIcons.magnifyingGlassPlus : FontAwesomeIcons.magnifyingGlass,
                text: 'Cerca',
                isSelected: _selectedIndex == 1,
                onTap: () => _onItemTapped(1),
                disabled: false
              ),
              _buildTabItem(
                icon: _selectedIndex == 2 ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                text: 'Visite',
                isSelected: _selectedIndex == 2,
                onTap: () => _onItemTapped(2),
                disabled: AuthGetModel().id == null
              ),
              /*_buildTabItem(
                icon: Icons.notifications,
                text: 'Notifiche',
                isSelected: _selectedIndex == 3,
                onTap: () => _onItemTapped(3),
                badgeCount: 3,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
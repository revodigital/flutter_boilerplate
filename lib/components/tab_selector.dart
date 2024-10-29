import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTabSelector extends StatefulWidget {
  final List<Widget> sliverList;
  final List<String> tabList;
  final List<Widget> pageList;

  const CustomTabSelector({
    super.key,
    required this.tabList,
    required this.pageList,
    required this.sliverList,
  });

  @override
  State<CustomTabSelector> createState() => _CustomTabSelector();
}

class _CustomTabSelector extends State<CustomTabSelector> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.tabList.length, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: const NeverScrollableScrollPhysics(),
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
            child: Column(
              children: widget.sliverList,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Adaptive.px(24)),
              child: TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                physics: const NeverScrollableScrollPhysics(),
                isScrollable: true,
                indicatorColor: CustomColors.primary[40],
                indicatorWeight: Adaptive.px(1),
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelStyle: CustomTypography.body['1-semibold']!.copyWith(
                    color: CustomColors.text[30]
                ),
                labelStyle: CustomTypography.body['1-semibold']!.copyWith(
                    color: CustomColors.primary[40]
                ),
                labelPadding: EdgeInsets.symmetric(horizontal: Adaptive.px(8)),
                indicatorPadding: EdgeInsets.symmetric(horizontal: Adaptive.px(8)),
                dividerColor: CustomColors.transparent,
                tabs: widget.tabList.map((e) {
                  return Tab(
                    height: Adaptive.px(25),
                    child: Text(
                      e,
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ];
      },
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: Adaptive.px(24)),
        child: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: widget.pageList.map((e) {
            return e;
          }).toList(),
        ),
      ),
    );
  }
}
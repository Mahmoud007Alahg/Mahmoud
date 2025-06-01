import 'package:flutter/material.dart';

class CustomTabScaffold extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> tabContents;

  const CustomTabScaffold({
    required this.tabTitles,
    required this.tabContents,
    super.key,
  }) : assert(
         tabTitles.length == tabContents.length,
         'Number of tabs and contents must match.',
       );

  @override
  State<CustomTabScaffold> createState() => _CustomTabScaffoldState();
}

class _CustomTabScaffoldState extends State<CustomTabScaffold>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabTitles.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          labelColor: const Color.fromRGBO(40, 40, 40, 1),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Tajawal',
            fontSize: screenSize.width * (16 / 430),
          ),
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color.fromRGBO(159, 106, 245, 1),
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: Colors.transparent,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          tabs:
              widget.tabTitles
                  .map(
                    (title) => Text(
                      title,
                      style: TextStyle(
                        fontSize: screenSize.width * (16 / 430),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                  .toList(),
        ),
        SizedBox(height: screenSize.height * (40 / 932)),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabContents,
          ),
        ),
      ],
    );
  }
}

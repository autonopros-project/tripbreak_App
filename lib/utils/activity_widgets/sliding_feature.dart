import 'package:flutter/material.dart';

class SlidingFeature extends StatefulWidget {
  final ValueChanged<int>? onValueChanged;
  final String text1, text2;
  final double height;
  final IconData? icon1, icon2;

  const SlidingFeature({
    super.key,
    this.onValueChanged,
    required this.text1,
    required this.text2,
    required this.height,
    this.icon1,
    this.icon2,
  });

  @override
  State<SlidingFeature> createState() => _SlidingFeatureState();
}

class _SlidingFeatureState extends State<SlidingFeature>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final pillWidth = constraints.maxWidth / 2;
          return Stack(
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOutCubic,
                alignment: _selectedIndex == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                  width: pillWidth,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5C518),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() => _selectedIndex = 0);
                        widget.onValueChanged?.call(0);
                      },
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: _selectedIndex == 0
                                ? const Color(0xFF00388C)
                                : const Color(0xFF767676),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(widget.icon1),
                              SizedBox(width: 8),
                              Text(widget.text1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() => _selectedIndex = 1);
                        widget.onValueChanged?.call(1);
                      },
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: _selectedIndex == 1
                                ? const Color(0xFF00388C)
                                : const Color(0xFF767676),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(widget.icon2),
                              SizedBox(width: 8),
                              Text(widget.text2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/gap.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.iconData, required this.text});

  IconData iconData;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  const FABBottomAppBar({
    super.key,
    required this.items,
    required this.height,
    required this.iconSize,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.onTabSelected,
  }) : assert(items.length == 2 || items.length == 4);

  final List<FABBottomAppBarItem> items;

  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final ValueChanged<int> onTabSelected;

  @override
  State<FABBottomAppBar> createState() => _FABBottomAppBarState();
}

class _FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    items.insert(
      items.length >> 1,
      const Expanded(child: AppGap.big()),
    );

    return BottomAppBar(
      color: widget.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
          height: widget.height,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => onPressed(index),
              child: Icon(
                item.iconData,
                color: color,
                size: widget.iconSize,
              ),
            ),
          )),
    );
  }
}

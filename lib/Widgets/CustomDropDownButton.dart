import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/utils/color_constants.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    required this.items,
    this.onChanged, // دالة جديدة لإرجاع الـ index
    super.key,
  });

  final List<String> items;
  final ValueChanged<int>? onChanged; // سيُرجع الـ index فقط

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  int? _selectedIndex; // تخزين الـ index بدلاً من القيمة

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.items.isNotEmpty ? 0 : null; // افتراضي: أول عنصر (index = 0)
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<int>(
        dropdownColor: fieldColor,
        isExpanded: true,
        underline: const SizedBox(),
        onChanged: (int? newIndex) {
          setState(() {
            _selectedIndex = newIndex;
          });
          widget.onChanged?.call(newIndex!);
        },
        value: _selectedIndex,
        items: List<DropdownMenuItem<int>>.generate(
          widget.items.length,
              (index) => DropdownMenuItem<int>(
            value: index,
            child: Text(widget.items[index],style: TextStyle(color: greyColor),),
          ),
        ),
      ),
    );
  }
}
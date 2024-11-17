import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Commondropdown extends StatelessWidget {
  final List<String> items;
  final String hint;
  final String? selectedItem;
  final ValueChanged<String?>? onChanged;

  const Commondropdown({
    Key? key,
    required this.items,
    required this.hint,
    this.selectedItem,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            hint,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ))
              .toList(),
          value: selectedItem,
          onChanged: onChanged,
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: double.infinity
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

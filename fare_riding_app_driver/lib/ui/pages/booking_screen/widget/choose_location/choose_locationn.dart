import 'package:fare_riding_app/constant/AppText.dart';
import 'package:fare_riding_app/ui/common/AppBar.dart';
import 'package:fare_riding_app/ui/common/MainButton.dart';
import 'package:fare_riding_app/ui/common/TextFieldWithLabel.dart';
import 'package:fare_riding_app/ui/pages/booking_screen/widget/choose_location/choose_location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChooseLocationCubit>(
      create: (context) => ChooseLocationCubit(),
      child: _ChooseLocation(),
    );
  }
}

class _ChooseLocation extends StatefulWidget {
  const _ChooseLocation({super.key});

  @override
  State<_ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<_ChooseLocation> {
  late ChooseLocationCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ChooseLocationCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBase(title: "Đặt xe"),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextFieldWithSuggestions(
                  onChange: (value){
                    setState(() {
                      _cubit.getAutofillLocation(value);
                    });
                  },
                  controller: _cubit.fromLocation,
                  hint: "Nhập điểm đón",
                  suggestions: _cubit.state.placeAutofillList ?? [],
                  onSuggestionSelected: (suggestion) {
                    setState(() {
                      _cubit.fromLocation.text = suggestion;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextFieldWithSuggestions(
                  onChange: (value){
                    setState(() {
                      _cubit.getAutofillLocation(value);
                    });
                  },
                  controller: _cubit.toLocation,
                  hint: "Nhập điểm đến",
                  suggestions: _cubit.state.placeAutofillList ?? [],
                  onSuggestionSelected: (suggestion) {
                    setState(() {
                      _cubit.toLocation.text = suggestion;
                    });
                  },
                ),
              ],
            ),
            Mainbutton(
                text: "Xác nhận",
                type: 1,
                onTap: () {
                   _cubit.getBookingCalculation(_cubit.fromLocation.text, _cubit.toLocation.text, '',context);
                })
          ],
        ),
      ),
    );
  }
}

class TextFieldWithSuggestions extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final List<String?>? suggestions;
  final Function(String) onSuggestionSelected;
  final Function(String) onChange;

  const TextFieldWithSuggestions({
    required this.controller,
    required this.hint,
    required this.suggestions,
    required this.onSuggestionSelected,
    required this.onChange,
  });

  @override
  _TextFieldWithSuggestionsState createState() => _TextFieldWithSuggestionsState();
}

class _TextFieldWithSuggestionsState extends State<TextFieldWithSuggestions> {
  final FocusNode _focusNode = FocusNode();
  bool _showSuggestions = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          _showSuggestions = false; // Ẩn gợi ý khi mất focus
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: widget.controller,
              focusNode: _focusNode, // Gán focus node vào TextField
              decoration: InputDecoration(hintText: widget.hint),
              onChanged: (value) {
                widget.onChange(value);
                setState(() {
                  _showSuggestions = value.isNotEmpty && widget.suggestions!.isNotEmpty;
                });
              },
            ),
            // Hiển thị gợi ý nếu có và khi showSuggestions là true
            if (_showSuggestions && widget.suggestions != null && widget.suggestions!.isNotEmpty)
              Container(
                color: Colors.white,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.suggestions!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.suggestions![index]!),
                      onTap: () {
                        widget.onSuggestionSelected(widget.suggestions![index]!);
                        setState(() {
                          _showSuggestions = false; // Ẩn gợi ý khi chọn
                        });
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ],
    );
  }
}





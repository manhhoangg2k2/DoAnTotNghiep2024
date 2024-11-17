import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/constant/AppSize.dart';
import 'package:fare_riding_app/constant/AppText.dart';
import 'package:fare_riding_app/ui/pages/Authentication/sign_up/cubit/sign_up_cubit.dart';
import 'package:fare_riding_app/ui/pages/Authentication/sign_up/view/otp_screen.dart';
import 'package:fare_riding_app/ui/pages/Authentication/sign_up/view/set_passcode_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../constant/AppFont.dart';
import '../../../../common/AppBar.dart';
import '../../../../common/MainButton.dart';
import '../../../../common/TextBase.dart';
import '../../../../common/TextFieldWithLabel.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (BuildContext context) => SignUpCubit(),
      child: _SignUpScreen(phoneNumber: phoneNumber,),
    );
  }
}

class _SignUpScreen extends StatefulWidget {
  const _SignUpScreen({super.key,  required this.phoneNumber});

  final String phoneNumber;

  @override
  State<_SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<_SignUpScreen> {
  late SignUpCubit _cubit;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _cubit = BlocProvider.of<SignUpCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> _gender = ['Nam', 'Nữ', 'Khác'];
    return BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
      final _cubit = context.read<SignUpCubit>();
      return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBarBase(text: AppText.signUp),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.size_20, vertical: AppSizes.size_20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Textfieldwithlabel(
                        controller: _cubit.nameController,
                        hint: AppText.name,
                        initial: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập tên';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: AppSizes.size_20,
                    ),
                    Textfieldwithlabel(
                      controller: _cubit.emailController,
                      hint: AppText.email,
                      initial: '',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Vui lòng nhập email hợp lệ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: AppSizes.size_20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppText.gender,
                        style: TextStyle(
                          fontWeight: AppFonts.medium,
                          color: AppColor.black,
                          fontSize: AppSizes.size_16,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.size_5),
                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColor.gray_0A0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColor.gray_0A0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColor.main),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        hint: const Text(
                          AppText.gender,
                          style: TextStyle(fontSize: 14),
                        ),
                        items: _gender
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Hãy chọn giới tính';
                          }
                          return null;
                        },
                        onChanged: (value) {
                        },
                        onSaved: (value) {
                          _cubit.setGendle(value.toString());
                          // selectedValue = value.toString();
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: IconStyleData(
                          iconDisabledColor: AppColor.main,
                          iconEnabledColor: AppColor.main,
                          icon: SvgPicture.asset('assets/svg/down_arrow.svg'),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Mainbutton(
                        text: AppText.signUp,
                        type: 1,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _cubit.signUp(name: _cubit.nameController.text, phoneNumber: widget.phoneNumber, gender: _cubit.gendleController.text, email: _cubit.emailController.text);
                          }
                          Navigator.push(context,MaterialPageRoute(builder: (context) => SetPasscodeScreen(phoneNumber: widget.phoneNumber)),
                          );
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

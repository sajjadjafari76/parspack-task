import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app_clean_architecture/core/shared/validation.dart';

import 'color_constant.dart';
import 'enums/gender_type.dart';
import 'font_constant.dart';
// import 'package:persian_datetime_picker/persian_datetime_picker.dart' as datePicker;

// ------------------------------------------------------------------------------------------------------------------------------
class TextFormFieldBase extends StatefulWidget {
  const TextFormFieldBase({
    Key? key,
    required this.title,
    required this.hintText,
    required this.submitted,
    this.inputType,
    this.textAlign = TextAlign.start,
    this.validator,
    this.helperText,
    this.controller,
    this.errorText,
    this.hasIcon = false,
    this.enable = true,
    this.horizontalPadding = 24.0,
    this.canTypeEnglish = false,
    this.txtChange,
    this.height = 48,
    this.focusNode,
    this.focusedBorderColor = grey300,
    this.errorStyleHeight,
  }) : super(key: key);

  final String title;
  final String hintText;
  final String? errorText;
  final String? helperText;
  final TextInputType? inputType;
  final bool submitted;
  final TextEditingController? controller;
  final StringValidator? validator;
  final TextAlign textAlign;
  final bool enable;
  final bool hasIcon;
  final double horizontalPadding;
  final bool canTypeEnglish;
  final Function(String txt)? txtChange;
  final double height;
  final FocusNode? focusNode;
  final Color focusedBorderColor;
  final double? errorStyleHeight;

  @override
  State<TextFormFieldBase> createState() => _TextFormFieldBase();
}

class _TextFormFieldBase extends State<TextFormFieldBase> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    bool validatorIsValid = (!widget.submitted || (widget.validator != null && widget.validator!.isValid(widget.controller?.text ?? value)));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        widget.title != '' ? Text(widget.title, style: sm14(color: grey700)) : const SizedBox(),
        SizedBox(
          height: widget.title.isNotEmpty ? 4.0 : 0.0,
        ),
        SizedBox(
          height: widget.height,
          child: TextFormField(
              controller: widget.controller,
              maxLines: 1,
              minLines: 1,
              textDirection: TextDirection.ltr,
              textAlign: widget.textAlign,
              inputFormatters: [
                widget.canTypeEnglish
                    ? FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]"))
                    : FilteringTextInputFormatter.allow(RegExp(r"^([\u0600-\u06FF]+\s?)+$")),
                LengthLimitingTextInputFormatter(100)
              ],
              validator: (txt) {
                return validatorIsValid ? null : widget.errorText;
              },
              focusNode: widget.focusNode,
              decoration: InputDecoration(
                  helperText: (widget.helperText != null && widget.helperText!.isNotEmpty) ? widget.helperText : null,
                  helperStyle: sm10(color: blue),
                  enabled: widget.enable,
                  filled: true,
                  fillColor: grey100,
                  errorText: validatorIsValid ? null : widget.errorText,
                  errorStyle: sm10(color: error500, height: widget.errorStyleHeight ?? 1),
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: error300, width: 1), borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: widget.focusedBorderColor, width: 1), borderRadius: const BorderRadius.all(Radius.circular(8.0))),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: error300, width: 1), borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      borderSide: validatorIsValid ? BorderSide.none : const BorderSide(color: error300, width: 1)),
                  hintText: widget.hintText,
                  labelStyle: md16(color: white),
                  hintTextDirection: TextDirection.rtl,
                  // counter: Text('${value.length} کلمه'),
                  contentPadding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding, vertical: widget.height / 4),
                  hintStyle: sm14(color: grey400),
                  prefixIcon: widget.hasIcon
                      ? const Icon(
                          Icons.keyboard_arrow_down,
                          color: grey800,
                        )
                      : null),
              keyboardType: widget.inputType,
              onChanged: (res) {
                setState(() {
                  if (widget.txtChange != null) widget.txtChange!.call(res);
                  value = res;
                });
              },
              style: sm16(color: grey800)), //sm16(color: widget.enable ? grey800 : grey800)),
        ),
      ],
    );
  }
}

// ------------------------------------------------------------------------------------------------------------------------------
class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.submitted,
      this.textAlign = TextAlign.start,
      this.validator,
      this.helperText,
      this.controller,
      this.txtChange,
      this.errorText})
      : super(key: key);

  final String title;
  final String hintText;
  final String? errorText;
  final String? helperText;
  final bool submitted;
  final TextEditingController? controller;
  final StringValidator? validator;
  final TextAlign textAlign;
  final Function(String txt)? txtChange;

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextField();
}

class _PhoneNumberTextField extends State<PhoneNumberTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 25.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: grey100,
                ),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SvgPicture.asset(
                    //   'assets/svg_iran.svg',
                    //   width: 18.0,
                    //   height: 18.0,
                    // ),
                    Text(
                      '+98',
                      style: sm16(color: grey600),
                    )
                  ],
                ),
              )),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            flex: 4,
            child: TextFormFieldBase(
              title: widget.title,
              hintText: widget.hintText,
              errorText: widget.errorText,
              submitted: false,
              canTypeEnglish: true,
              controller: widget.controller,
              helperText: widget.helperText,
              // validator: CheckIsPhoneNumberValidator(),
              textAlign: widget.textAlign,
              inputType: TextInputType.number,
              txtChange: (txt) {
                widget.txtChange?.call(txt);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------------------------------------------------------------------

class CheckBoxBaseWithContainer extends StatefulWidget {
  CheckBoxBaseWithContainer(
      {Key? key, required this.title, required this.hintText, required this.onChange, this.isChecked = false, this.textStyle, required this.id})
      : super(key: key);

  final String title;
  final String hintText;
  final int id;
  final TextStyle? textStyle;
  final Function(bool value, int id) onChange;
  bool isChecked;

  @override
  State<CheckBoxBaseWithContainer> createState() => _CheckBoxBaseWithContainer();
}

class _CheckBoxBaseWithContainer extends State<CheckBoxBaseWithContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isChecked = !widget.isChecked;
        });
        widget.onChange.call(widget.isChecked, widget.id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          widget.title != ''
              ? Text(
                  widget.title,
                  style: sm14(color: grey700),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                )
              : const SizedBox(),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(color: grey100, width: 1),
                color: widget.isChecked ? grey100 : white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    widget.hintText,
                    style: sm16(color: widget.isChecked ? grey800 : grey500),
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                      border: Border.all(color: grey300, width: 1.0),
                      color: widget.isChecked ? blue : grey25),
                  padding: const EdgeInsets.all(5.0),
                  // child: widget.isChecked
                  //     ? SvgPicture.asset(
                  //         'assets/svg_check.svg',
                  //       )
                  //     : const SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------------------------------------------------------------------

class CheckBoxBase extends StatefulWidget {
  CheckBoxBase({Key? key, required this.hintText, required this.onChange, required this.txtStyle}) : super(key: key);

  final String hintText;
  final TextStyle txtStyle;
  final Function(bool value) onChange;

  @override
  State<CheckBoxBase> createState() => _CheckBoxBase();
}

class _CheckBoxBase extends State<CheckBoxBase> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onChange.call(isChecked);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 4.0,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8.0)), color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(widget.hintText, style: sm16(color: isChecked ? grey800 : grey500)),
                const SizedBox(
                  width: 8.0,
                ),
                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                      border: Border.all(color: grey300, width: 1.0),
                      color: isChecked ? blue : grey25),
                  padding: const EdgeInsets.all(5.0),
                  // child: isChecked
                  //     ? SvgPicture.asset(
                  //         'assets/svg_check.svg',
                  //       )
                  //     : const SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------------------------------------------------------------------

class SwitchScreenBase extends StatefulWidget {
  SwitchScreenBase({required this.title, required this.hintText});

  final String title;
  final String hintText;

  @override
  State<SwitchScreenBase> createState() => _SwitchScreen();
}

class _SwitchScreen extends State<SwitchScreenBase> {
  bool isSwitched = false;

  void toggleSwitch() {
    isSwitched = !isSwitched;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        widget.title != '' ? Text(widget.title, style: sm14(color: grey700)) : const SizedBox(),
        const SizedBox(
          height: 4.0,
        ),
        InkWell(
          onTap: toggleSwitch,
          child: Container(
            height: 54.0,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(color: grey100, width: 1),
                color: isSwitched ? grey100 : white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.hintText,
                  style: sm16(color: grey500),
                ),
                Transform.scale(
                  scale: 0.73,
                  child: CupertinoSwitch(
                    onChanged: (val) => toggleSwitch,
                    value: isSwitched,
                    activeColor: blue,
                    dragStartBehavior: DragStartBehavior.down,
                    trackColor: grey200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ------------------------------------------------------------------------------------------------------------------------------

class SelectGender extends StatefulWidget {
  SelectGender({required this.title, required this.hintTextOne, required this.hintTextTwo, required this.onClick, this.type = GenderType.MAN});

  final String title;
  final String hintTextOne;
  final String hintTextTwo;
  final Function(GenderType type) onClick;
  GenderType type;

  @override
  State<SelectGender> createState() => _SelectGender();
}

class _SelectGender extends State<SelectGender> {
  GenderType genderType = GenderType.MAN;

  void toggleSwitch(GenderType g) {
    switch (g) {
      case GenderType.MAN:
        widget.type = GenderType.MAN;
        break;
      case GenderType.WOMAN:
        widget.type = GenderType.WOMAN;
    }
    widget.onClick.call(g);
    genderType = g;
    setState(() {});
  }

  @override
  void initState() {
    genderType = widget.type;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        widget.title != '' ? Text(widget.title, style: sm14(color: grey700)) : const SizedBox(),
        const SizedBox(
          height: 4.0,
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => toggleSwitch(GenderType.MAN),
                child: Container(
                  height: 48.0,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(color: grey100, width: 1),
                      color: widget.type == GenderType.MAN ? grey100 : white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.hintTextOne,
                        style: sm16(color: widget.type == GenderType.MAN ? grey800 : grey500),
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: Radio<GenderType>(
                          value: GenderType.MAN,
                          groupValue: genderType,
                          onChanged: (GenderType? value) {
                            setState(() {
                              genderType = value!;
                              widget.type = GenderType.MAN;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: InkWell(
                onTap: () => toggleSwitch(GenderType.WOMAN),
                child: Container(
                  height: 48.0,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(color: grey100, width: 1),
                      color: widget.type == GenderType.WOMAN ? grey100 : white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.hintTextTwo,
                        style: sm16(color: widget.type == GenderType.WOMAN ? grey800 : grey500),
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: Radio<GenderType>(
                          value: GenderType.WOMAN,
                          groupValue: genderType,
                          onChanged: (GenderType? value) {
                            setState(() {
                              genderType = value!;
                              widget.type = GenderType.WOMAN;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

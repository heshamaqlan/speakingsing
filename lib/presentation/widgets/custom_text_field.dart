import 'package:flutter/material.dart';
import 'package:speaking_sign/config/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.colors,
    this.onChanged,
    required this.hintText,
    required this.lableText,
    this.validator,
    this.onSaved,
  });

  final AppColors colors;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String lableText;
  final String hintText;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            lableText,
            style: TextStyle(
              color: colors.wordCardText,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),
          TextFormField(
            textDirection: TextDirection.rtl,
            validator: validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: colors.wordCard,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              // suffixIcon: Container(
              //   width: 57,
              //   height: 60,
              //   margin: EdgeInsets.only(right: 6),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       VerticalDivider(
              //         thickness: 2,
              //         indent: 15,
              //         endIndent: 15,
              //         color: Colors.grey,
              //       ),
              //       CircleAvatar(
              //         backgroundColor: Colors.transparent,
              //         child: IconButton(
              //           onPressed: () {},
              //           icon: Icon(
              //             Icons.add_link_outlined,
              //             color: colors.wordCardText,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              hintText: hintText,
              hintTextDirection: TextDirection.rtl,

              // prefixIcon: CircleAvatar(
              //   backgroundColor: Colors.transparent,
              //   child: IconButton(
              //     onPressed: () {},
              //     icon: Icon(Icons.mic, color: colors.wordCardText),
              //   ),
              // ),
            ),
            onChanged: onChanged,
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }
}

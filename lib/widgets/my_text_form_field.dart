import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller ;
  final String? Function(String?) validator;

  const MyTextFormField({super.key, required this.controller, required this.validator,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: validator,
        controller: controller,
        style:
            const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
        decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 153, 151, 176))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Color(0xff1B08DA))),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            )),
      ),
    );
  }
}

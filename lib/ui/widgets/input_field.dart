import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key, required this.title, required this.hint, this.controller, this.widget})
      : super(key: key);
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;    
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(title,style:headingStyle),
          Container(
margin: const EdgeInsets.only(left:10,right:10),
width: double.infinity,
height: 52,
decoration:
BoxDecoration(
  borderRadius: BorderRadius.circular(20),
border: Border.all(color: Colors.black)) ,
child:Row(
  children: [
        Expanded(child: TextFormField(
      controller: controller,
     // readOnly: widget !=null ?true:false,
      autofocus: false,
      cursorColor: Get.isDarkMode? Colors.grey[100]:Colors.grey[700],
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        
        hintText: hint,
      hintStyle: subHeadingStyle,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 0,
          color: context.theme.backgroundColor,
        ) ),
      focusedBorder:UnderlineInputBorder(borderSide: 
      BorderSide(color:context.theme.backgroundColor )) ,),
    )),
    widget??Container(),
  ],
),
),
        ],
      ),
    );
  }
}

import 'package:flutter/services.dart';
import 'package:persian_input/validator/persian_unicode.dart';

class PersianNumberValidator implements TextInputFormatter{


  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    if(newValue.text.isNotEmpty){


      int codeUnit = newValue.text.codeUnitAt(newValue.text.length-1);
      String unicodeEscape = 'U+${codeUnit.toRadixString(16).padLeft(4, '0')}';
      String? entered_value = PersianUnicode.numbers_list[unicodeEscape.toUpperCase()];


      if(entered_value!=null){

        String new_value = PersianUnicode.replaceCharAtIndex(newValue.text, newValue.text.length-1, entered_value!);


        return TextEditingValue(text: new_value,selection: TextSelection.fromPosition(
          TextPosition(offset: new_value.length),
        ));
      }
      else{

        String new_value = PersianUnicode.replaceCharAtIndex(newValue.text, newValue.text.length-1, '');
        return TextEditingValue(text: new_value,selection: TextSelection.fromPosition(
          TextPosition(offset: new_value.length),
        ));
      }

    } else return TextEditingValue(text: '');
  }


}
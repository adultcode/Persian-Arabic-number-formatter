<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
<img src="https://flutter-learn.ir/wp-content/uploads/2023/09/untitled.gif" >

## Persian/Arabic number input formatter

If you use the digitsOnly formatter option on a TextField in Flutter, it only works with English digits, and you can't use Persian/Arabic numbers.
However, if you don't use any input formatter, then you can't convert Persian/Arabic digits to an integer


## How to use

Add this line to your file
````
package:persian_input/validator/number_validator.dart
````


Now simply add PersianNumberValidator class in inputFormatters list.

````
TextField(
            inputFormatters: [
                  PersianNumberValidator()
                ],
                decoration: const InputDecoration(
                    hintText: 'With persian formatter'
                ),
              )
````
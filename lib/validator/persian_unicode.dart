
class PersianUnicode{


  /*
  persian to latin numbers
   */

  static Map<String,String> numbers_list = {

    'U+06F0':'0',
    'U+0660':'0',
    'U+06F1':'1',
    'U+0661':'1',
    'U+0031':'1',
    'U+06F2':'2',
    'U+0662':'2',
    'U+0032':'2',
    'U+06F3':'3',
    'U+0663':'3',
    'U+0033':'3',
    'U+06F4':'4',
    'U+0664':'4',
    'U+0034':'4',
    'U+06F5':'5',
    'U+0665':'5',
    'U+0035':'5',
    'U+06F6':'6',
    'U+0666':'6',
    'U+0036':'6',
    'U+06F7':'7',
    'U+06F67':'7',
    'U+0037':'7',
    'U+06F8':'8',
    'U+06F68':'8',
    'U+0038':'8',
    'U+06F9':'9',
    'U+06F69':'9',
    'U+0039':'9'
  };

  static String replaceCharAtIndex(String original, int index, String replacement) {
    if (index < 0 || index >= original.length) {
      return original;
    }

    return original.replaceRange(index, index + 1, replacement);
  }

}
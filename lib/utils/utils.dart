
import 'package:intl/intl.dart';

class Utils {
  //数值显示格式化
  static String intFormat(int count) {
    if (count.toString().length >= 5 && count.toString().length < 9) {
      List<String> list = (count / 10000).toString().split('.');
      String integer = list[0];
      String decimal = list[1].substring(0, 1);

      return integer + '.' + decimal + "万";
    } else if (count.toString().length >= 9) {
      return (count / 100000000).toStringAsFixed(1).toString() + "亿";
    } else {
      return count.toString();
    }
  }

  static String myDataFormat(String date){
    return DateFormat("yyyy-MM-dd").format(DateFormat("yyyy-MM-dd")
                    .parse(date));
  }

}

class Utils {
  static String intFormat(int count) {
    if (count.toString().length >= 5 && count.toString().length < 9) {
      return (count / 10000).toString() + "万";
    } else if (count.toString().length >= 9) {
      return (count / 100000000).toString() + "亿";
    } else {
      return count.toString();
    }
  }
}

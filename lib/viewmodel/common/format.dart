class Format{

  String dateTimeToString (DateTime date){
    return date.toString().split('-')[0] + date.toString().split('-')[1] + date.toString().split('-')[2].split(' ')[0];
  }

  String fmtDate(DateTime date){
    final dateStr = dateTimeToString(date);
    return '${dateStr.substring(0,4)}年 ${dateStr.substring(4,6)}月 ${dateStr.substring(6,8)}日';
  }

}
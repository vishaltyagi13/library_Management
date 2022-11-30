package util

import java.text.SimpleDateFormat


class DateUtil {

    public static final DATE_FORMAT = 'yyyy-MM-dd'
    public static final Date_fORMAT1='dd/mm/yyyy'

    static Date  stringToDate(String dateStr,String dateFormat=DATE_FORMAT){
        Date date=null
        try{
            if (dateStr){
                 date =new SimpleDateFormat(dateFormat).parse(dateStr)
            }
        }catch(Exception e){
            println(e)
        }
        return date
        }


         static String dateToString(Date date, String dateFormat = DATE_FORMAT) {
         if (date) {
            try {
                String dateStr =  new SimpleDateFormat(dateFormat)?.format(date)
                return dateStr
            } catch (Exception e) {
                println(e)
            }
        }
         return ""
    }
}


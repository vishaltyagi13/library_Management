package util

import java.text.SimpleDateFormat


class DateUtil {

    public static final DATE_FORMAT = 'yyyy-MM-dd'
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
    }


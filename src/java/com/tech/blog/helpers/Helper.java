/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author KIIT
 */
public class Helper {
    
    public static boolean deleteFile(String path){
        boolean flag = false;
        try{
            File file = new File(path);
            flag = file.delete();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    public static boolean saveFile(InputStream is, String path){
        boolean flag = false;
        try{
            byte[] b = new byte[is.available()];
            is.read(b);
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            flag = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    
    public static String formatDate(String date){
        String newDate = "";
        int i = 0;
        while(date.charAt(i) != '-'){
            newDate += date.charAt(i);
            i++;
        }
        String month = "";
        i++;
        while(date.charAt(i) != '-'){
            month += date.charAt(i);
            i++;
        }
        switch(month){
            case "01" -> month = "Jan";
            case "02" -> month = "Feb";
            case "03" -> month = "Mar";
            case "04" -> month = "Apr";
            case "05" -> month = "May";
            case "06" -> month = "Jun";
            case "07" -> month = "Jul";
            case "08" -> month = "Aug";
            case "09" -> month = "Sep";
            case "10" -> month = "Oct";
            case "11" -> month = "Nov";
            case "12" -> month = "Dec";
                       
        }
        newDate = month + ", " + newDate;
        i++;
        String day = "";
        while(i < date.length()){
            day += date.charAt(i);
            i++;
        }
        int d = Integer.parseInt(day);
        day = switch (d) {
            case 1 -> d + "st ";
            case 2 -> d + "nd ";
            case 3 -> d + "rd ";
            default -> d + "th ";
        };
        newDate = day + newDate;
        return newDate;
    }
    
}

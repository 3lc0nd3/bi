package co.util;

import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.ChoiceFormat;
import java.util.Date;
import java.util.Hashtable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.Timestamp;
import java.io.*;
import java.nio.CharBuffer;
import java.nio.ByteBuffer;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.Charset;
import java.awt.image.BufferedImage;
import java.awt.*;

import javax.imageio.ImageIO;

/**
 * Created by Edward L. Ramirez A.
 * cel 300 554 3367
 * email elramireza@gmail.com
 * User: usuariox
 * Date: Aug 5, 2011
 * Time: 12:43:11 AM
 */
public class Uno {
    public static void main(String[] args) throws IOException {

/*
        String f = "pidof apache2";
        f = CommandSystem.exec(f).trim();
        String[] ff = f.split(" ");
        for (String s : ff) {
            System.out.println("s =" + s+"=");
        }*/
/*

        String f = "smshilo";
        f = CommandSystem.exec(f).trim();
        String[] ff = f.split(" ");
        for (String s : ff) {
            System.out.println("s =" + s+"=");
        }
*/

        /*
        ArrayList<String> imeis = new ArrayList<String>();

        String ls = "lsmodem";
        String pS = CommandSystem.exec(ls);
//        System.out.println("pS = " + pS);
        String[] arrayPortS = pS.split("\n");
//        System.out.println("arrayPortS.length = " + arrayPortS.length);
        for (int i = 1; i < arrayPortS.length; i++) {
            String s = arrayPortS[i];
//            System.out.println("s = " + s);
        }

//        System.out.println("arrayPortS.length = " + arrayPortS.length);

        String aux1;
        for (int i=1; i<= arrayPortS.length-1; i++) {

            String portDev = arrayPortS[i];
            int index = portDev.indexOf("USB") + 3;
            String phone = portDev.substring(index).trim();
//            System.out.println("phone = " + phone);
//          ANTERIOR LINEA DE COMANDO
//            aux1 = CommandSystem.exec(" --phone "+phone+" --identify");
            aux1 = CommandSystem.exec("modembind "+phone);
//            System.out.println("aux1 = " + aux1);

            index = aux1.indexOf("IMEI         :");

//            System.out.println("index = " + index);
            if (index != -1) {
                int intInicio = aux1.indexOf(":", index)+2;
//                System.out.println("intInicio = " + intInicio);
                int intFinal = aux1.indexOf("\n", index);
//                System.out.println("intFinal = " + intFinal);
                aux1 = aux1.substring(intInicio, intFinal).trim();

//                System.out.println("aux"+(phone)+" =" + aux1);
            } else {
            }
        }
*/
        /* int phone = 2000;
    String command;
    command = "modembind " + phone;
    command = "gnokii --phone "+phone+" --identify";
    command = "ls";
    command = "gnokii --identify";
    System.out.println("command = " + command);
    String aux1 = CommandSystem.exec(command);
    System.out.println("aux1 = " + aux1);*/

        /*SimpleDateFormat dfDate = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat dfDateTime = new SimpleDateFormat("dd/MM/yyyy KK:mm aaa");

        try {
//            System.out.println("dfDateTime.parse(\"24/05/2012 11:36 pm\") = " + dfDateTime.parse("24/05/2012 11:36 pm"));
            Date date = dfDateTime.parse("24/05/2012 10:36 pm");
            Timestamp timestamp = new Timestamp(date.getTime());
            System.out.println("dfDateTime.parse(\"24/05/2012 11:36 PM\") = " + date);
            System.out.println("dfDateTime.format(timestamp) = " + dfDateTime.format(timestamp));
        } catch (ParseException e) {
            e.printStackTrace();
            
        }*/

        /*Pattern patron = Pattern.compile("a*b");
// creamos el Matcher a partir del patron, la cadena como parametro
        Matcher encaja = patron.matcher("aabmanoloaabmanoloabmanolob");
// invocamos el metodo replaceAll
        String resultado = encaja.replaceAll("-");
        System.out.println(resultado);*/

        /*double[] limits = {1,2,3,4,5,6,7};
        String[] dayOfWeekNames = {"Sun","Mon","Tue","Wed","Thur","Fri","Sat"};
        ChoiceFormat form = new ChoiceFormat(limits, dayOfWeekNames);
        ParsePosition status = new ParsePosition(0);
        for (double i = 0.0; i <= 8.0; ++i) {
            status.setIndex(0);
            System.out.println(i + " -> " + form.format(i) + " -> "
                    + form.parse(form.format(i),status));
        }

        ChoiceFormat fmt = new ChoiceFormat(
                "-1#is negative| 0#is zero or fraction | 1#is one |1.0<is 1+ |2#is two |2<is more than 2.");
        System.out.println("Formatter Pattern : " + fmt.toPattern());

        System.out.println("Format with -INF : " + fmt.format(Double.NEGATIVE_INFINITY));
        System.out.println("Format with -1.0 : " + fmt.format(-1.0));
        System.out.println("Format with 0 : " + fmt.format(0));
        System.out.println("Format with 0.9 : " + fmt.format(0.9));
        System.out.println("Format with 1.0 : " + fmt.format(1));
        System.out.println("Format with 1.5 : " + fmt.format(1.5));
        System.out.println("Format with 2 : " + fmt.format(2));
        System.out.println("Format with 2.1 : " + fmt.format(2.1));
        System.out.println("Format with NaN : " + fmt.format(Double.NaN));
        System.out.println("Format with +INF : " + fmt.format(Double.POSITIVE_INFINITY));*/

       

        // Make the BufferedImage that are to hold the QRCode
        /*int matrixWidth = byteMatrix.getWidth();
        BufferedImage image = new BufferedImage(matrixWidth, matrixWidth,
                BufferedImage.TYPE_INT_RGB);
        image.createGraphics();

        Graphics2D graphics = (Graphics2D) image.getGraphics();
        graphics.setColor(Color.WHITE);
        graphics.fillRect(0, 0, matrixWidth, matrixWidth);
        // Paint and save the image using the ByteMatrix
        graphics.setColor(Color.BLACK);

        for (int i = 0; i < matrixWidth; i++) {
            for (int j = 0; j < matrixWidth; j++) {
                if (byteMatrix.get(i, j)) {
                    graphics.fillRect(i, j, 1, 1);
                }
            }
        }
        ImageIO.write(image, fileType, qrFile);*/
    }
}

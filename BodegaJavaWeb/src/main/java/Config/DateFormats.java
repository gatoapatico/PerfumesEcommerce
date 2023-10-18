package Config;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateFormats {

    public static String formatoFechaTexto(String fecha) {
        SimpleDateFormat formatoOriginal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat formatoDeseado = new SimpleDateFormat("d 'de' MMMM 'del' yyyy", new Locale("es", "ES"));

        try {
            Date date = formatoOriginal.parse(fecha);
            return formatoDeseado.format(date);
        }
        catch (ParseException e) {
            e.printStackTrace();
        }
        return fecha;
    }

    public static String formatoFechaDiaTexto(String fecha) {
        SimpleDateFormat formatoOriginal = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat formatoDeseado = new SimpleDateFormat("EEEE, d 'de' MMMM 'del' yyyy", new Locale("es", "ES"));

        try {
            Date date = formatoOriginal.parse(fecha);
            return formatoDeseado.format(date);
        }
        catch (ParseException e) {
            e.printStackTrace();
        }
        return fecha;
    }

    public static String sumarHora(String hora) {
        String[] partesHora = hora.split(":");
        int horas = Integer.parseInt(partesHora[0]);
        int minutos = Integer.parseInt(partesHora[1]);
        int segundos = Integer.parseInt(partesHora[2]);

        horas++;

        return formatoHora(String.format("%02d:%02d:%02d", horas, minutos, segundos));
    }

    public static String formatoHora(String hora) {
        String[] partesHora = hora.split(":");
        int horas = Integer.parseInt(partesHora[0]);
        int minutos = Integer.parseInt(partesHora[1]);

        String formatoDeseado = "hh:mm a";
        SimpleDateFormat sdf = new SimpleDateFormat(formatoDeseado, new Locale("es", "ES"));

        return sdf.format(new Date(0, 0, 0, horas, minutos));
    }
}

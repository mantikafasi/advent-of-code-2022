/*
 * This Java source file was generated by the Gradle 'init' task.
 */

import java.io.File;
import java.io.FileNotFoundException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Scanner;

public class App {

    
    List<List<Integer>> arr2d = new ArrayList();
    static String bullshit = "";

    public static void main(String[] args) {
        var file = new File("C:\\Users\\manti\\Desktop\\projeler\\adventofcode2022\\08\\8.txt");
        try {

            var dumbReader = new Scanner(file);;
            int line = 0;

            while (dumbReader.hasNextLine()) {

                String data = dumbReader.nextLine();
                bullshit += "\n" + data;

            }
            dumbReader.close();
            bullshit = bullshit.trim();

            findStupitTreeCount();

            foundOnes.forEach(o -> {
                var guh = (String)o;
                guh.split(",");
                
            });
            System.out.println(foundOnes.size());
        } catch (FileNotFoundException e) {
            System.out.println("nop");
        }
    }

    static LinkedHashSet foundOnes = new LinkedHashSet<String>();


    public static void findStupitTreeCount() {
        int numbers[] = new int[99];
        Arrays.fill(numbers,-1);
        var strings = bullshit.split("\n");

        var line = 0;
        for (String s : strings) {
            var pos = 0;

            var numberLeft = -1;
            var numberRight = -1;
            for (String s1 : s.split("")) {
                var s1int = Integer.parseInt(s1);

                if (numbers[pos] < Integer.parseInt(s1)) {
                    foundOnes.add(line +","+pos);
                    numbers[pos] = Integer.parseInt(s1);
                }

                if (numberLeft < s1int) {
                    foundOnes.add(line +","+pos);
                    numberLeft = s1int;
                }
                pos ++;
            }

            for (int i = s.length() -1 ;i > 0;i--) {
                var s1 = Integer.parseInt( "" + s.toCharArray()[i]);

                if (numberRight < s1) {
                    foundOnes.add(line +","+(i));
                    numberRight = s1;
                }
            }
            line ++;
        }


        Arrays.fill(numbers,-1);

        for (int lineIx = strings.length - 1; lineIx > 0;lineIx--) {
            //do UPSIDE DOWN
            var pos = 0;

            for (String s : strings[lineIx].split("")) {

                if (numbers[pos] < Integer.parseInt(s)) {
                    foundOnes.add(lineIx +","+pos);
                    numbers[pos] = Integer.parseInt(s);
                }
                pos++;
            }
        }
    }
}
package com.seu.licenseAnalysis.analysis;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Scanner;

public class licenseType {
    public String getType(String path) throws IOException {
        System.out.println(path);

        File file = new File(path);
        Reader reader = null;
        ArrayList words = new ArrayList();

        Scanner scanner = new Scanner(new FileInputStream(path));
        while(scanner.hasNext())
            words.add(scanner.next());

//        try {
//            reader = new InputStreamReader(new FileInputStream(path));
//            int tempchar;
//            while ((tempchar = reader.read()) != -1) {
//                if (((char) tempchar) != '\r') {
//                    System.out.print((char) tempchar);
//                    words.add((char) tempchar);
//                }
//            }
//        }catch(FileNotFoundException e){
//            e.printStackTrace();
//        }finally {
//            if (reader != null) {
//                try {
//                    reader.close();
//                } catch (IOException e1) {
//                }
//            }
//        }

        for(int i = 0;i<words.size();i++)
            System.out.println(words.get(i));

        boolean t = words.contains("Apache");
        int t1 = words.indexOf("Version");

        if(words.contains("Apache")&&words.get(words.indexOf("Version")+1).equals("2.0"))
            return "Apache 2.0";
        else
            return "Unclear";
    }
}

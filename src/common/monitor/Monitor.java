package common.monitor;

import com.sun.management.OperatingSystemMXBean;

import java.io.File;
import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.lang.management.MemoryUsage;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Monitor {
    public static Monitor it;

    public static Monitor getInstance() { //인스턴스 생성
        if (it == null)
            it = new Monitor();
        return it;
    }

    static double kb = 1024.0;
    static double mb = 1024.0 * 1024.0;
    static double gb = 1024.0 * 1024.0 * 1024;

    public List<Map<String, String>> getSpaceInfo() {
        List<Map<String, String>> listOfMaps = new ArrayList<Map<String, String>>();
        String disk = "";
        double total = 0;
        double used = 0;
        double free = 0;
        File[] drives = File.listRoots();
        for(File drive : drives) {
            Map<String,String> map = new HashMap<String,String>();
            disk = drive.getAbsolutePath();
            total = drive.getTotalSpace() / Math.pow(1024, 3);
            free = drive.getUsableSpace() / Math.pow(1024, 3);
            used = total - free;
            map.put("disk", disk);
            map.put("total", String.valueOf(total));
            map.put("used", String.valueOf(used));
            map.put("free", String.valueOf(free));
            listOfMaps.add(map);
        }
        return listOfMaps;
    }

    public List<Map<String, String>> getOSInfo( ){
        List<Map<String, String>> listOfMaps = new ArrayList<Map<String, String>>();
        Map<String,String> map = new HashMap<String,String>();
        OperatingSystemMXBean os = ( OperatingSystemMXBean ) ManagementFactory.getOperatingSystemMXBean( );
        map.put("name", os.getName( ));
        map.put("arch", os.getArch( ));
        map.put("core", os.getAvailableProcessors( )+"");
        map.put("load", (os.getSystemCpuLoad()*100.0) +"");
        listOfMaps.add(map);
        return listOfMaps;
    }

    public List<Map<String, String>> getMemoryInfo() {
        List<Map<String, String>> listOfMaps = new ArrayList<Map<String, String>>();
        Map<String,String> map = new HashMap<String,String>();

        //자바 힙메모리 크기 확인하는 코드
        MemoryMXBean memory = (MemoryMXBean) ManagementFactory.getMemoryMXBean( );

        MemoryUsage heap = memory.getHeapMemoryUsage();
        map.put("heapMemory", heap.getUsed()/mb+"");
//        System.out.println( "Heap Memory: " + heap.getUsed()/mb+"MB");

        MemoryUsage nonheap = memory.getNonHeapMemoryUsage();
        map.put("nonHeapMemory", nonheap.getUsed()/mb+"");
//        System.out.println( "NonHeap Memory: " + nonheap.getUsed()/mb+"MB");


        //시스템 메모리
        Runtime runtime = Runtime.getRuntime();
        int total = (int)(runtime.totalMemory()/mb);
        int free = (int)(runtime.freeMemory()/mb);
//        int used = total - free;
        map.put("total", total+"");
//        System.out.println("전체 메모리" + total+"MB");
//        System.out.println("사용중인 메모리" + used +"MB");
        map.put("free", free+"");
//        System.out.println("사용가능한 메모리"+free +"MB");


        listOfMaps.add(map);
        return listOfMaps;
    }
}

package com.example.studiozen.Reservation;

import java.util.ArrayList;
import java.util.List;


/*  이 클래스는 추후에 기술될 ThreadPoolQueue, ThreadPoolRunnable를 가지는 쓰레드풀 메인 객체입니다.
 사용자들은 이 클래스를 이용해서 쓰레드풀을 생성 할 수 있습니다.  */
public class ReservationThreadPool {


    private ReservationThreadPoolQueue queue;
    private List<ReservationThreadPoolRunnable> runnableList = new ArrayList<ReservationThreadPoolRunnable>();
    private volatile boolean running = true;
    
    /* 쓰레드풀 초기화 */
    public ReservationThreadPool(int MAX_THREAD_NUM, int MAX_QUEUEU_SIZE){
        queue = new ReservationThreadPoolQueue(MAX_QUEUEU_SIZE);
        for (int i = 0; i < MAX_THREAD_NUM; i++) {
            runnableList.add(new ReservationThreadPoolRunnable(i,queue));
        }
        for (ReservationThreadPoolRunnable r:runnableList  ) {
                new Thread(r).start();
        }
    }

    /* 쓰레드풀 실행  */
    public synchronized void execute(Runnable item) throws Exception{
        if (!running){
            throw new Exception("Thread Pool is not running");
        }
        queue.enqueue(item);
    }

    /* 쓰레드풀 정지 */
    public synchronized void stop() throws InterruptedException {
        running = false;
        for (ReservationThreadPoolRunnable r : runnableList){
            r.stop();
        }
    }

    /* Runnable console 디버깅 플래그 설정 */
    public void toggleDebugWithRunnable(boolean flag){
        for( ReservationThreadPoolRunnable r : runnableList){
            r.toggleDebug(flag);
        }
    }

    /* Queue console 디버깅 플래그 설정 */
    public void toggleDebugWithQueueu(boolean flag){
        queue.toggleDebug(flag);
    }

}

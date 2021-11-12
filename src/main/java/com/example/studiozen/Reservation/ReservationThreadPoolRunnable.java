package com.example.studiozen.Reservation;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/* ThreadPoolRunnable
쓰레드풀에서 실제로 Task를 처리할 Runnable 클래스입니다.
 ThreadPoolQueue에서 Task를 꺼낸 후 처리합니다. */
public class ReservationThreadPoolRunnable implements Runnable{
    // Runnable이란 Thread의 인터페이스화 된 형태 Java에서는 다중 상속이 불가능하여 Thread를 상속 받지 못 하는 경우 implements로 Runnable을 받아 구현하여 처리 할 수 있습니다.

    private int id; // Runnable ID
    private ReservationThreadPoolQueue queue;
    private volatile boolean running = true;
    private boolean DEBUG = false;
    Logger logger = LoggerFactory.getLogger(ReservationThreadPoolRunnable.class);

    //Runnable 초기화
    public ReservationThreadPoolRunnable(int THREAD_ID, ReservationThreadPoolQueue queue) {

        this.id = THREAD_ID;
        this.queue = queue;
        console("ThreadPoolRunnable["+id+"] is created. ");
    }

    /**
     * When an object implementing interface <code>Runnable</code> is used
     * to create a thread, starting the thread causes the object's
     * <code>run</code> method to be called in that separately executing
     * thread.
     * <p>
     * The general contract of the method <code>run</code> is that it may
     * take any action whatsoever.
     *
     * @see Thread#run()
     */
    @Override
    public void run() {
        while (running){
            try {
                Thread.sleep(900000);
                console("ThreadPoolRunnable["+id+"] is working. ");
                for (int i = 0; i < 900000; i++) {
                    logger.info(String.valueOf(i));
                    i++;
                }
                Runnable r = (Runnable) queue.dequeue();
                r.run();
            }catch (InterruptedException e ){
                stop(); // 인터럽트 예외 발생시 해당 Runnable 정지
            }
        }
        console("ThreadPoolRunnable["+id+"] is dead");
    }

    //Runnable 정지
    public void stop(){
        running = false;
        console("ThreadPoolRunnable["+id+"] is stopped.");
    }

    //현재 Runnable 디버깅 설정
    public void toggleDebug(boolean flag){
        this.DEBUG = flag;
    }


    public void console(String msg){
        if( DEBUG){
            System.out.println(msg);
        }
    }



}

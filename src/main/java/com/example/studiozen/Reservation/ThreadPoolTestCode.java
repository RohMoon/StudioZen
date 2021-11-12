package com.example.studiozen.Reservation;

public class ThreadPoolTestCode {

    public static void main(String[] args) {

        // 쓰레드가 5개이고 최대 처리할 아이템 개수는 10인 쓰레드풀 생성

        ReservationThreadPool reservationThreadPool = new ReservationThreadPool(100, 100);

        reservationThreadPool.toggleDebugWithQueueu(true);
        reservationThreadPool.toggleDebugWithRunnable(true);

        // TEST CODE
        try {

            //아이템 100개를 쓰레드풀에 삽입 및 실행
            for (int i = 0; i < 100; i++) {
                Runnable reservationThreadPoolRunnable = new TestRunnable(i);
                reservationThreadPool.execute(reservationThreadPoolRunnable);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        try {
            reservationThreadPool.stop();
        }catch (InterruptedException e){
            System.out.println("ThreadPool is stopped");
        }

    }

}

//테스트할 용도의 Runnable 클래스
class TestRunnable implements Runnable{
    int index;
    public TestRunnable(int i ){
        index = i;
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
        System.out.println(index);
    }
}

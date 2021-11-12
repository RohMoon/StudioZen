package com.example.studiozen.Reservation;

import java.util.LinkedList;


/* 이 클래스는 쓰레드풀 내의 쓰레드에서 공유할 Task 큐입니다.
처리할 Task를 Runnable 형태로 삽입하고 꺼낼 수 있습니다. */
public class ReservationThreadPoolQueue {

    /* item을 저장할 큐 선언 */
    private LinkedList<Object> queue = new LinkedList<Object>();  // Object로 LinkedList 선언
    //LinkedList는 추가 /삭제 등 수정이 빈번하게 일어날 때 사용.
    // 양방향 연결 리스트로 구현되어 있다.
    // 각각의 데이터가 노드로 구성 되어 연결이 되어 있는 구조이다.
    // 각각의 노드는 데이터와 함게 next(다음 노드)와 prev(이전 노드)값을 내부적으로 가지고 있다.
    // 일반적으로는 LinkedList의 장점은 데이터를 추가하거나 삭제 하는것이 원활하다.
    // 어느 위치에서든 추가나 삭제를 할 경우 변경되는 노드만 다시 연결해주면 된다.
    // 사용 예제
    /*
    * // LinkedList<Integer> integer1 = new LinkedList<Integer>();
    *  LinkedList<String> colors = new LinkedList<>();
    * //add() method
    *  color.add("Black");
    *  color.add("White");
    *  color.add(0,"Green");
    *  color.add("Red");
    *
    * //Set() method
    *  color.set(0,"Blue");
    *
    *  System.out.printIn(colors);
    *
    *   ArrayList와 동일하게 List를 구현했기 때문에 add() 메소드로 엘레멘트를 추가할 수 있습니다.
    *   set() 메소드로 기존에 추가된 값을 변경하는 것 역시 가능합니다.
    *   add() 에 인덱스를 지정하지 않으면 가장 끝에 값이 추가됩니다.
    *   LinkedList는 값을 찾아갈 때 처음부터 순차적으로 찾아갑니다.
    *   그래서 값 추가시 순차적으로 탐색할 것 같지만 그렇게 동작하지는 않습니다.
    *   내부적으로 last라는 변수가 마짐가 노드를 가리키고 있어서 이 변수에 바로 연결합니다.
    *   그렇기 때문에 끝 부분에 추가할 때는 순차적인 탐색 없이 마지막에 연결이 가능합니다.
    *   Black 과 White는 순차적으로 추가되고 Green이 가장 앞에 추가되면 Black, White가 한 칸씩 밀립니다.
    *   끝 부분에 다시 Red가 추가되고 가장 앞의 값이 Green에서 Blue로 변경되며 Blue, Black, White, Red 와 같은 결과가 출력됩니다.
    *
    *
    *   LinkedList 엘레멘트 삭제
    *   remove() 메소드로 값을 삭제할 수 있습니다.
    *
    *   String removeColor = color.remove(0);
    * */




    // Queue 자료구조의 종류
    // 대기줄로서 First In First Out하는 관통형태의 자료구조의 최대 사이즈를 30으로 할당.
    // 1차원 배열을 이용한 순차 표현
    // 인덱스를 값으로 가지는 front,rear라는 두개의 변수와 큐의 사이즈를 나타내는 n이라는 변수사용.
    // front. rear를 -1로 초기화하여 큐가 empty임을 나타낸다.  (front == rear일 때 큐는 공백);
    // rear에서 삽입 되므로 rear가 점차 증가하여 rear == n-1인 경우 큐는 full 상태이다.

    /*
    *  문제점
    *  큐에 삽입이 되며 점차 rear가 증가하게 되면 결국 full상태가 된다.
    *  하지만 이때 (큐에 원소가 꽉차있지않을 수도 있다.)
    *  front에서 삭제가 일어났다면 그만큼 공간이 비었기 때문이다.
    *  따라서 full상태가 되었을 때에는 첫번째 원소의 위치를 큐의 [0]번 인덱스부터 위치되게 한뒤 이것을 기준으로 rear의 위치도 다시 정해주어야 한다.
    *  위의 문제로 순차 표현 큐는 많은 비용(큐 원소 이동에 따른 지연시간)이 발생하게 된다.
    * 
    *   해결책 원형큐
    * 
    *  - 큐의 순차표현시 원형큐를 이용하면 원소의 이동없이 이용할 수 있다.
    * empty(공백)
    * - front,rear를 0으로 초기화 한다. 이 때 큐는 비어있는 상태이므로 front == rear는 큐가 empty 임을 나타내는 조건이다.
    * 
    * enqueue(삽입)
    *  - 원소 삽입시 우선 큐가 full인지 확인한 다음 full상태가 아니라면 rear를 1 증가 시킨 후 그 자리에 item을 삽입한다.
    * Full (만원)
    * - full의 상태를 검사하기 위해서는 rear를 증가 시켰을때 front와 같게 된다면 (rear +1 ==front ) full로 처리하면 된다.
    * 그렇게 된다면 항상 큐의 front 가 기리키는 인덱스는 비어있는상태로 유지되는데, 이것을 통해 full과 empty로 구분 가능.
    * 만약 front에 자리까지 원소가 삽입된다면 front==rear 조건이 큐가 empty인지 full인지를 구분하지 못하게 된다.
    * dequeue(삭제)
    * -삭제하기 전 우선 큐가 empty 인지 확인한 다음 empty가 아니라면 front를 1증가 시킨 후 그 자리의 원소를 삭제한다.
    * - 연결 표현(LinkedList)을 이용한 큐 표현은 원소의 삽입과 삭제시 원소들을 이동시킬 필요가 없다.
    * Empty(공백)
    * front, rear가 아무런 노드를 가리키지 않는다면 empty 상태이다.
    * enqueue(삽입), Full (만원)
    * - 삽입시 순차표현과 달리 full(만원)상태 인지를 확인 할 필요가 없다.
    * dequeue (삭제)
    * - 삭제시 큐가 empty상태인지 확인을 해야하며, front를 이용해 마지마 노드를 제거할 때 rear 역시 null 상태로 변경해주어야 한다.
    *
    *  문제점
    * - 다음 노드를 가리키는 링크필드에 대한 추가적인 메모리 사용을 염두해야 한다.
    *
    * */

    /* 큐 최대 사이즈 선언 */
    private int MAX_QUEUE_SIZE = 30;

    /* 디버그를 위한 콘솔 출력 변수 */

    private boolean DEBUG = false;  // Boolean 타입 DEBUG 기본 False로 선언

    public ReservationThreadPoolQueue(int MAX_QUEUE_SIZE){
        System.out.println("MAX_QUEUE_SIZE ========>   "+MAX_QUEUE_SIZE);
        this.MAX_QUEUE_SIZE = MAX_QUEUE_SIZE; // 생성자 함수에 파라미터로 최대값을 받아 사이즈 조정.
        System.out.println("After got Param MAX_QUEUE_SIZE ========>   "+this.MAX_QUEUE_SIZE);
    }


    /* 아이템 삽입 */
    public synchronized void enqueue(Object item) throws  InterruptedException{
        /*
        * Synchronized 멀티 스레드 환경에서 반드시 고려해야할 점인 스레드간 동기화라는 문제
        * 스레드간 서로 공유하고 수정할 수 있는 data가 있는데 스레드간 동기화가 되지 않은 상태에서
        * 멀티스레드 프로그램을 돌리면, data의 안정성과 신뢰성을 보장 할 수 없다.
        *
        * 따라서 data의 tread-safe를 하기 위해 자바에서는 synchronized 키워드를 제공해 스레드간 동기화를 시켜 data의 thread-safe를 가능케합니다.
        *
        * **" 자바에서 지원하는 Synchronized 키워드는 여러개의 스레드가 한개의 자원을 사용하고자 할 때,
        *     현재 데이터를 사용하고 있는 해당 스레드를 제외하고 나머지 스레드들은 데이터에 접근 할 수 없도록 막는 개념"
        *     Synchronized 키워드는 변수와 함수에 사용해서 동기화 할 수있음.
        *     Synchronized 키워드를 너무 남발할시에 프로그램 성능 저하 야기됨.
        *      - Syncronized 키워드를 사용하면 자바 내부적으로 메서드나 변수에 동기화를 위해 block과 unlock을 처리하게 되는데
        *     이러한 처리들이 만약 너무 많아지면 오히려 프로그램 성능저하를 일으킬 수 있다.
        *     (block과 unblock 도 프로그램 내부적으로 어느정도 공수가 들어가는 작업이다).
        *
        *      1. 메서드에 사용 경우                public syncronized void method(){//코드}
        *      2. 객체 변수에 사용하는 경우(block문) public Object obj = new Object();
        *                                          public void exampleMethod() {
        *                                               synchronized (obj){
        *                                                 //코드
        *                                         }
        *                                          }
        *
        *
        * */
        //현재 큐가 최대 사이즈면 멈춤
        while (queue.size()==MAX_QUEUE_SIZE){
            console("enqueue waiting ...");
            wait();  // 갖고 있던 고유 락을 해제하고, 스레드를 잠들게 한다. : 호출하는 스레드가 반드시 고유 락을 갖고 있어야 한다. 다시 말해, synchronized 블록 내에서 호출되어야 한다.
        }

        //현재 큐가 비어있으면 깨워서 일시킴
        if (queue.size()==0){
            console("enqueue notifyall...");
            notifyAll(); //잠들어 있던 스레드 모두를 깨운다. :                                   "
        }

        console("enqueue adding...");
        queue.add(item); // LinkedList로 표현된 큐에 아이템 집어 넣는다.
    }

    /* 아이템 변환 */  // 아이템 삭제
    public synchronized Object dequeue()throws InterruptedException{
        //반환할 아이템이 없으면 멈춤
        while (queue.size() == 0){   // 들어온 처리대상 0 삭제
            console("dequeue wainting");
            wait(); // 스레드 할 일 없으면 기다려
        }
        //반환할 아이템이 가득찼다? 일해라
        if (queue.size()==MAX_QUEUE_SIZE){
            console("dequeue notifyall...");
            notifyAll();  // 스레드 할일 태산이야 일어나 
        }

        console("dequeue removing ...");
        return queue.remove(0); // rear로 들어왔다가 front로 나가니까 0번째 삭제처리해줘

    }

    //디버깅 설정
    public void toggleDebug(boolean flag){
        this.DEBUG = flag;
    } // 디버그 false였던거 flag true

    public void console(String msg){
        if (DEBUG)    // 디버깅 설정 맞으면 화면에 출력 해
            System.out.println(msg);
    }



}

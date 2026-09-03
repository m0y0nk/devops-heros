public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello World from Java");
        try {
            // Keep the container running so it doesn't exit immediately when run detached
            Thread.sleep(Long.MAX_VALUE);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}

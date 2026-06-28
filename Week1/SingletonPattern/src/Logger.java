public class Logger {

    // Step 1: Create only one object
    private static Logger instance;

    // Step 2: Private constructor
    private Logger() {
        System.out.println("Logger Object Created");
    }

    // Step 3: Method to return single object
    public static Logger getInstance() {

        if (instance == null) {
            instance = new Logger();
        }

        return instance;
    }

    public void log(String message) {
        System.out.println("LOG : " + message);
    }

}
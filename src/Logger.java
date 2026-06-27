public class Logger {

    // Step 1: Create only one object
    private static Logger instance;

    // Step 2: Private constructor
    private Logger() {
        System.out.println("Logger Object Created");
    }

    // Step 3: Public method to access object
    public static Logger getInstance() {

        if (instance == null) {
            instance = new Logger();
        }

        return instance;
    }

    // Logging method
    public void log(String message) {
        System.out.println("LOG : " + message);
    }
}
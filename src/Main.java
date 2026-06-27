public class Main {

    public static void main(String[] args) {

        Logger logger1 = Logger.getInstance();
        logger1.log("Application Started");

        Logger logger2 = Logger.getInstance();
        logger2.log("User Logged In");

        Logger logger3 = Logger.getInstance();
        logger3.log("Application Closed");

        System.out.println();

        System.out.println(logger1);
        System.out.println(logger2);
        System.out.println(logger3);

        System.out.println();

        if (logger1 == logger2 && logger2 == logger3) {
            System.out.println("Only one Logger object exists.");
        } else {
            System.out.println("Multiple Logger objects created.");
        }

    }
}
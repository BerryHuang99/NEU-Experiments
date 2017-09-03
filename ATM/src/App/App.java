package App;
import Model.GoldUser;
import Model.RegularUser;
import Model.SilverUser;
import State.*;
import ATM.*;

public class App {
    private Context ctx = new Context();
    private ATM atm = ATM.getInstance();

    public static void main(String[] args) {
        App app = new App();
        app.mock();
        app.init();
    }

    public void init() {
        ctx.initMenu();
    }

    public void mock() {
        atm.registerUser(new RegularUser("test", "test"));
        atm.registerUser(new RegularUser("test1", "test"));
        atm.registerUser(new GoldUser("gold", "test"));
        atm.registerUser(new SilverUser("silver", "test"));
    }


}

package Menu;

import State.Context;
import State.StateType;

import java.util.Scanner;

import static Menu.Common.*;

public class QueryMenu implements Menu {
    private Context ctx = new Context();

    @Override
    public boolean handle(Context ctx) {
        this.ctx = ctx;
        Scanner scanner = new Scanner(System.in);
        Ln(2);
        Title("账户余额查询");
        displayAccountInfo();
        Ln(1);
        Line("按任意键返回！");
        scanner.next();
        ctx.setState(StateType.Main);
        return true;
    }

    private void displayAccountInfo() {
        Line("Username: " + ctx.getLoginedUser().getUsername());
        Line("Account: " + ctx.getLoginedUser().getBalance());
    }
}

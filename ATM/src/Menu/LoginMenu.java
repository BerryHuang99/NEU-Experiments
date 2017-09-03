package Menu;

import ATM.ATM;
import State.Context;
import State.StateType;

import java.util.Scanner;

import static Menu.Common.*;

public class LoginMenu implements Menu {
    @Override
    public boolean handle(Context ctx) {
        Line("请登陆系统:");
        Line("输入用户名：");

        Scanner scanner = new Scanner(System.in);
        String username = scanner.nextLine().trim();

        Line("输入密码：");
        String password = scanner.nextLine();

        ATM atm = ATM.getInstance();

        if (!atm.login(username, password))
            return Error("用户名或密码错误！");

        ctx.setLoginedUser(atm.searchUser(username));
        ctx.setState(StateType.Main);
        return Success("登陆成功！");
    }
}

package Menu;

import State.Context;
import State.StateType;

import java.util.Scanner;

import static Menu.Common.*;

public class DepositMenu implements Menu {
    @Override
    public boolean handle(Context ctx) {
        Ln(2);
        Title("自动存款");
        Line("请输入存款金额:");
        Line("请输入 q 返回菜单！");

        Scanner scanner = new Scanner(System.in);

        try {
            resetScanner();
            String ch = scanner.nextLine();
            if (ch.equals("q")) {
                System.out.println("here");
                ctx.setState(StateType.Main);
                return true;
            }

            double amount = Double.parseDouble(ch);
            if (ctx.getLoginedUser().deposit(amount) ) {
                ctx.setState(StateType.Main);
                return Success("存款成功！");
            } else
                return Error("对不起！取款失败，请重试！");
        } catch (Exception e) {
            System.err.println(e);

            // Once scanner throw error,
            // it should be re-initialized
            resetScanner();
            return Error("输入金额错误！请重新输入！");
        }
    }
}

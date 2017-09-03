package Menu;

import State.Context;
import State.StateType;

import java.util.Scanner;

import static Menu.Common.*;


public class WithdrawMenu implements Menu {
    @Override
    public boolean handle(Context ctx) {
        Ln(2);
        Title("自动取款");
        Line("请输入取款金额:");
        Line("输入 q 返回菜单");

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
            if (ctx.getLoginedUser().withdraw(amount) )
                return Success("取款成功！请取走您的现金！");
            else
                return Error("对不起！取款失败！请重试！");
        } catch (Exception e) {
            System.err.println(e);

            // Once scanner throw error,
            // it should be re-initialized
            resetScanner();
            return Error("对不起！输入金额错误！请重试！");
        }

    }
}

package Menu;

import ATM.ATM;
import Model.User;
import State.Context;
import State.StateType;

import java.util.Scanner;

import static Menu.Common.*;

public class TransferMenu implements Menu {
    @Override
    public boolean handle(Context ctx) {
        Ln(2);
        Title("自动转账");
        Line("请输入转账号与金额");
        Line("输入 q 返回菜单");

        Scanner scanner = new Scanner(System.in);
        try {
            resetScanner();
            Line("输入转账户名:");
            String ch = scanner.nextLine().trim();
            if (ch.equals("q")) {
                System.out.println("here");
                ctx.setState(StateType.Main);
                return true;
            }

            String transferredUsername = ch;
            User transferredUser = ATM.getInstance().searchUser(transferredUsername);

            if (transferredUser == null)
                return Error("转账账户不存在！");

            Line("输入转账金额：");
            double amount = scanner.nextDouble();

            if (ctx.getLoginedUser().transfer(amount) &&
                    transferredUser.deposit(amount) )
                return Success("转账成功！" + "\n" +
                        "Flow: " + ctx.getLoginedUser().getUsername() + " => " + transferredUser.getUsername() + "\n" +
                        "Amount: " + amount);
            else
                return Error("对不起！转账失败！请重试！");

        } catch (Exception e) {
            System.err.println(e);

            // Once scanner throw error,
            // it should be re-initialized
            resetScanner();
            return Error("对不起！输入金额错误！请重新输入！");
        }
    }
}

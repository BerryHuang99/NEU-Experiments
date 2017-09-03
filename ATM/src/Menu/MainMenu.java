package Menu;

import State.Context;
import State.StateType;

import java.util.Scanner;

import static Menu.Common.*;

public class MainMenu implements Menu {
    @Override
    public boolean handle(Context ctx) {
        Ln(2);
        Title("欢迎使用ATM!");
        Line("请选择服务：");
        Line("1. 存款");
        Line("2. 取款");
        Line("3. 查询");
        Line("4. 转账     ");
        Line("5. 退出     ");
        Scanner scanner = new Scanner(System.in);
        try {
            int ch = scanner.nextInt();
            if (ch == 1) {
                ctx.setState(StateType.DEPOSIT);
            }
            else if (ch == 2) {
                ctx.setState(StateType.WITHDRAW);
            }
            else if (ch == 3) {
                ctx.setState(StateType.QUERY);
            }
            else if (ch == 4) {
                ctx.setState(StateType.TRANSFER);
            }
            else if (ch == 5){
                ctx.setState(StateType.LOGOUT);
            }
            else {
                return Error("选择错误！请重新选择！");
            }
        } catch (Exception e) {
            System.err.println(e);
            resetScanner();
            return Error("选择错误！请重新选择！");
        }

        return true;
    }
}

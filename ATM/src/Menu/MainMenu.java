package Menu;

import State.Context;
import State.StateType;

import java.util.Scanner;

import static Menu.Common.*;

public class MainMenu implements Menu {
    @Override
    public boolean handle(Context ctx) {
        Ln(2);
        Title("��ӭʹ��ATM!");
        Line("��ѡ�����");
        Line("1. ��");
        Line("2. ȡ�");
        Line("3. ��ѯ��");
        Line("4. ת��     ");
        Line("5. �˳�     ");
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
                return Error("ѡ�����������ѡ��");
            }
        } catch (Exception e) {
            System.err.println(e);
            resetScanner();
            return Error("ѡ�����������ѡ��");
        }

        return true;
    }
}

package Menu;

import State.Context;
import State.StateType;

import java.util.Scanner;

import static Menu.Common.*;

public class DepositMenu implements Menu {
    @Override
    public boolean handle(Context ctx) {
        Ln(2);
        Title("�Զ����");
        Line("����������:");
        Line("������ q ���ز˵���");

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
                return Success("���ɹ���");
            } else
                return Error("�Բ���ȡ��ʧ�ܣ������ԣ�");
        } catch (Exception e) {
            System.err.println(e);

            // Once scanner throw error,
            // it should be re-initialized
            resetScanner();
            return Error("������������������룡");
        }
    }
}

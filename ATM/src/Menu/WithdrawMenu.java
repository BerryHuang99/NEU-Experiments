package Menu;

import State.Context;
import State.StateType;

import java.util.Scanner;

import static Menu.Common.*;


public class WithdrawMenu implements Menu {
    @Override
    public boolean handle(Context ctx) {
        Ln(2);
        Title("�Զ�ȡ��");
        Line("������ȡ����:");
        Line("���� q ���ز˵�");

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
                return Success("ȡ��ɹ�����ȡ�������ֽ�");
            else
                return Error("�Բ���ȡ��ʧ�ܣ������ԣ�");
        } catch (Exception e) {
            System.err.println(e);

            // Once scanner throw error,
            // it should be re-initialized
            resetScanner();
            return Error("�Բ�����������������ԣ�");
        }

    }
}

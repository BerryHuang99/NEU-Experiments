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
        Title("�Զ�ת��");
        Line("������ת�˺�����");
        Line("���� q ���ز˵�");

        Scanner scanner = new Scanner(System.in);
        try {
            resetScanner();
            Line("����ת�˻���:");
            String ch = scanner.nextLine().trim();
            if (ch.equals("q")) {
                System.out.println("here");
                ctx.setState(StateType.Main);
                return true;
            }

            String transferredUsername = ch;
            User transferredUser = ATM.getInstance().searchUser(transferredUsername);

            if (transferredUser == null)
                return Error("ת���˻������ڣ�");

            Line("����ת�˽�");
            double amount = scanner.nextDouble();

            if (ctx.getLoginedUser().transfer(amount) &&
                    transferredUser.deposit(amount) )
                return Success("ת�˳ɹ���" + "\n" +
                        "Flow: " + ctx.getLoginedUser().getUsername() + " => " + transferredUser.getUsername() + "\n" +
                        "Amount: " + amount);
            else
                return Error("�Բ���ת��ʧ�ܣ������ԣ�");

        } catch (Exception e) {
            System.err.println(e);

            // Once scanner throw error,
            // it should be re-initialized
            resetScanner();
            return Error("�Բ���������������������룡");
        }
    }
}

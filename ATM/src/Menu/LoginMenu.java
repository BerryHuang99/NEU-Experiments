package Menu;

import ATM.ATM;
import State.Context;
import State.StateType;

import java.util.Scanner;

import static Menu.Common.*;

public class LoginMenu implements Menu {
    @Override
    public boolean handle(Context ctx) {
        Line("���½ϵͳ:");
        Line("�����û�����");

        Scanner scanner = new Scanner(System.in);
        String username = scanner.nextLine().trim();

        Line("�������룺");
        String password = scanner.nextLine();

        ATM atm = ATM.getInstance();

        if (!atm.login(username, password))
            return Error("�û������������");

        ctx.setLoginedUser(atm.searchUser(username));
        ctx.setState(StateType.Main);
        return Success("��½�ɹ���");
    }
}

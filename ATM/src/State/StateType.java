package State;

import Menu.*;

public enum StateType {
    WELCOME(new WelcomeMenu()),
    LOGIN(new LoginMenu()),
    Main(new MainMenu()),
    QUERY(new QueryMenu()),
    TRANSFER(new TransferMenu()),
    WITHDRAW(new WithdrawMenu()),
    DEPOSIT(new DepositMenu()),
    LOGOUT(new LoginMenu());

    private Menu menuState;
    StateType(Menu menuState) {
        this.menuState = menuState;
    }

    public Menu getMenuState() {
        return this.menuState;
    }
}

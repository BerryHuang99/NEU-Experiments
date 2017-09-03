package State;

import Menu.*;
import Model.User;

public class Context {
    private StateType stateType = StateType.WELCOME;
    private User loginedUser;

    public void setState(StateType type) {
        this.stateType = type;
    }

    public User getLoginedUser() {
        return loginedUser;
    }

    public void setLoginedUser(User loginedUser) {
        this.loginedUser = loginedUser;
    }

    public boolean menu() {
        return this.stateType.getMenuState().handle(this);
    }

    public void initMenu() {
        while (true)
            menu();
    }
}

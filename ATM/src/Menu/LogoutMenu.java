package Menu;

import State.Context;
import State.StateType;

import static Menu.Common.Success;

public class LogoutMenu implements Menu {
    @Override
    public boolean handle(Context ctx) {
        ctx.setLoginedUser(null);
        ctx.setState(StateType.WELCOME);
        return Success("ÍË³ö³É¹¦£¡");
    }


}

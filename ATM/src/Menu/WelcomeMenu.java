package Menu;

import static Menu.Common.*;

import State.Context;
import State.StateType;

public class WelcomeMenu implements Menu {
    @Override
    public boolean handle(Context ctx) {
        Ln(2);
        Title("ª∂”≠ π”√ATM£°");
        ctx.setState(StateType.LOGIN);
        return true;
    }
}

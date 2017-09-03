package ATM;

import Model.User;

import java.util.HashMap;

public class ATM {
    private static ATM self;
    private HashMap<String, User> users = new HashMap<>();

    private ATM() {}

    public static ATM getInstance() {
        if (self == null) {
            self = new ATM();
        }
        return self;
    }

    public void registerUser(User user) {
        users.put(user.getUsername(), user);
    }

    public User searchUser(String name) {
        return users.get(name);
    }

    public boolean login(String username, String password) {
        User user = users.get(username);
        if (user == null)
            return false;

        if (!user.getPassword().equals(password)
                || !user.getUsername().equals(username))
            return false;

        return true;
    }

}

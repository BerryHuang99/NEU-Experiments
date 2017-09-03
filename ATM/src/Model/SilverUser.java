package Model;

public class SilverUser extends User {
    public SilverUser(String username, String password) {
        super(username, password);

        this.setUserType(UserType.SILVER);
        // 转账手续费
        this.setChargeRate(0.5/100);
    }
}

package Model;

public class GoldUser extends User {
    public GoldUser(String username, String password) {
        super(username, password);

        this.setUserType(UserType.GOLD);
        // 转账手续费
        this.setChargeRate(0);
    }

}

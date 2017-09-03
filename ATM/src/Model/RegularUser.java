package Model;

public class RegularUser extends User {
    public RegularUser(String username, String password) {
        super(username, password);

        this.setUserType(UserType.REGULAR);
        // 转账手续费
        this.setChargeRate(1.5/100);
    }
}

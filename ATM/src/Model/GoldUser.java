package Model;

public class GoldUser extends User {
    public GoldUser(String username, String password) {
        super(username, password);

        this.setUserType(UserType.GOLD);
        // ת��������
        this.setChargeRate(0);
    }

}

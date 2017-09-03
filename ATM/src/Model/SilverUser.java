package Model;

public class SilverUser extends User {
    public SilverUser(String username, String password) {
        super(username, password);

        this.setUserType(UserType.SILVER);
        // ת��������
        this.setChargeRate(0.5/100);
    }
}

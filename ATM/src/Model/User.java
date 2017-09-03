package Model;

public abstract class User {
    private String username;
    private String password;
    private Account account;
    private UserType userType;
    private double chargeRate;

    public User(String username, String password) {
        this.username = username;
        this.password = password;

        this.account = new Account();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getChargeRate() {
        return chargeRate;
    }

    protected void setChargeRate(double chargeRate) {
        this.chargeRate = chargeRate;
    }

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public double getBalance() {
        return this.account.getBalance();
    }

    public boolean withdraw(double amount) {
        return this.account.withdraw(amount);
    }

    public boolean deposit(double amount) {
        return this.account.deposit(amount);
    }

    public boolean transfer(double amount) {
        double total = amount + amount * this.chargeRate;
        return this.account.withdraw(total);
    }

    @Override
    public String toString() {
        return "{ username: " + username + ", " +
                 "password: " + password + "," +
                 "userType: "  + userType + "," +
                 "account: " + account +
                "}";

    }

}

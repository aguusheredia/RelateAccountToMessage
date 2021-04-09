public class AccountWrapper {
    
    public Account account {get; set;}
    public boolean selected {get; set;}

    public AccountWrapper (Account account){
        this.account = account;
        this.selected = false;
    }
}
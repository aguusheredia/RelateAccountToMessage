public class relateAccountToMessageController {
    
    public List <AccountWrapper> accountList {get; set;}
    public String text {get; set;}
    
    public relateAccountToMessageController() {
        accountList = new List <AccountWrapper>();
        
        for (Account account : [
            SELECT id, Phone, Name
            FROM Account
        ]){
            AccountWrapper accountWrapper = new AccountWrapper(account);
            accountWrapper.selected = false;
            accountList.add(accountWrapper);
        }
    }
    
    public void  relateAccountToMessage (){
        if (this.text == '' || this.text == null){
            ApexPages.addMessage(new ApexPages.Message (ApexPages.Severity.ERROR, 'Message required text'));
            return;
        }
        
        if (accountList.size() == 0)
            throw new ListException ('Association need Account');
        
        list <AccountMessageAssociation__c> associations = new List <AccountMessageAssociation__c>();

        Message__c message = new Message__c (Body__c = text);
        insert message;
        
        for (AccountWrapper accountWrapper : accountList){
            
            if(accountWrapper.selected){
                AccountMessageAssociation__c association = new AccountMessageAssociation__c();
                association.message__c = message.id;
                association.Account__c = accountWrapper.account.id;
                
                associations.add(association);
            }
        }

        if (associations.size() == 0)
        ApexPages.addMessage(new ApexPages.Message (ApexPages.Severity.ERROR, 'Message required account'));    
        
        else {
            insert associations;
            ApexPages.addMessage(new ApexPages.Message (ApexPages.Severity.CONFIRM, 'Message Send'));
        }

    }
    
}
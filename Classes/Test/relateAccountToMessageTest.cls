@isTest
private class relateAccountToMessageTest {

    @IsTest static void relateMessagetoAccounts(){
        
        relateAccountToMessageController controller = new relateAccountToMessageController();
        List <AccountWrapper> accounts = new List <AccountWrapper>();

        for (Integer i = 0; i < 5; i++) {
            Account acc = Build.anAccount()
                                .build();
            
            insert acc;
            AccountWrapper accountWrapper = new AccountWrapper (acc);
            accountWrapper.selected = true;

            accounts.add(accountWrapper);
        }

        controller.accountList = accounts;
        controller.text = 'Text test';

        Test.startTest();

        controller.relateAccountToMessage();

        Test.stopTest();

        AccountMessageAssociation__c [] associations = [
                                                        SELECT id, Account__c, Message__c
                                                        FROM AccountMessageAssociation__c
        ];
        
        System.assertEquals(5, associations.size());
    }

    @IsTest static void whenAccountsWrapperAreFalse_DontRelateMessageToAccounts(){

        for (Integer i = 0; i < 10; i++) {
            Account acc = Build.anAccount()
                                .build();
            
            insert acc;
        }

        relateAccountToMessageController controller = new relateAccountToMessageController();
        controller.text = 'Text test';

        Test.startTest();

        controller.relateAccountToMessage();

        Test.stopTest();

        AccountMessageAssociation__c [] associations = [
                                                        SELECT id, Account__c, Message__c
                                                        FROM AccountMessageAssociation__c
        ];
        
        System.assertEquals(0, associations.size());
    }

    @isTest static void whenMessageHasNotText_DontExistAssociation(){
        for (Integer i = 0; i < 10; i++) {
            Account acc = Build.anAccount()
                                .build();
            
            insert acc;
        }

        relateAccountToMessageController controller = new relateAccountToMessageController();

        Test.startTest();

        controller.relateAccountToMessage();

        Test.stopTest();

        AccountMessageAssociation__c [] associations = [
                                                        SELECT id, Account__c, Message__c
                                                        FROM AccountMessageAssociation__c
        ];
        
        System.assertEquals(0, associations.size());
    }

    @IsTest static void whenAccountWrapperListHasNotAccounts_ListHasAnError(){
        
        relateAccountToMessageController controller = new relateAccountToMessageController();
        List <AccountWrapper> accounts = new List <AccountWrapper>();

        controller.text = 'Text test';

        Test.startTest();
        String error;

        try {
            controller.relateAccountToMessage();
        } catch (ListException e) {
            error = e.getMessage();
        }
        Test.stopTest();
        
        System.assertEquals('Association need Account', error);
    }
}
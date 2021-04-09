@isTest 
private class AccountMessageAssociationTest {
    
    @IsTest static void whenRelateAccountToMessage_HasNotErrors(){

        Message__c message = Build.aMessage()
                                    .build();

        Account account = build.anAccount()
                                .build();

        insert message;
        insert account;

        AccountMessageAssociation__c association = Build.anAccountMessageAssociation()
                                                        .withAccount(account)
                                                        .withMessage(message)
                                                        .build();

        Test.startTest();
        Database.SaveResult result = DataBase.insert(association, false);
        Test.stopTest();

        System.assert(result.isSuccess());
        System.assert(result.getErrors().size() == 0);

        AccountMessageAssociation__c associationTest = [
                                                        SELECT id, Message__c, Account__c
                                                        FROM AccountMessageAssociation__c
                                                        WHERE Account__c =: account.Id
                                                        LIMIT 1
        ];

        System.assertEquals(message.Id, associationTest.Message__c);
        
    }

    @IsTest static void differentsAccountsSameMessage(){
        
        List <Account> accounts = new List <Account>();
        list <AccountMessageAssociation__c> associations = new List <AccountMessageAssociation__c>();

        Message__c message = Build.aMessage()
                                    .build();


        for (Integer i = 0; i < 10; i++) {
            Account account = build.anAccount()
                                .build();
            accounts.add(account);
        }

        insert message;
        insert accounts;

        for (Account account : accounts) {
            AccountMessageAssociation__c associationOne = Build.anAccountMessageAssociation()
                                                            .withAccount(account)
                                                            .withMessage(message)
                                                            .build();
            associations.add(associationOne);
        }

        Test.startTest();
        insert associations;
        Test.stopTest();

        AccountMessageAssociation__c [] associationsTest = [
                                                            SELECT id, Message__c, Account__c
                                                            FROM AccountMessageAssociation__c
                                                            WHERE Message__c =: message.Id
        ];
        
        System.assertEquals(10, associationsTest.size());
    }

    @IsTest
    static void whenInsertAssociationWithMessageWithoutAccount_AssociationHasAnError(){
        
        Message__c message = Build.aMessage()
                                    .build();
        
        AccountMessageAssociation__c association = Build.anAccountMessageAssociation()
                                    .withMessage(message)
                                    .build();                                    
                                    
        Test.startTest();
            Database.SaveResult result = DataBase.insert(association, false);
        Test.stopTest();

        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
    }

    static void whenInsertAssociationWithoutMessageWithAccount_AssociationHasAnError(){
        
        Account account = Build.anAccount()
                                .build();
        
        AccountMessageAssociation__c association = Build.anAccountMessageAssociation()
                                    .withAccount(account)
                                    .build();                                    
                                    
        Test.startTest();
            Database.SaveResult result = DataBase.insert(association, false);
        Test.stopTest();

        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
    }
}
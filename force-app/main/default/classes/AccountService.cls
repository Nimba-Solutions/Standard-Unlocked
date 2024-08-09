public with sharing class AccountService {
    public static Account getAccountById(String accountId) {
        return [SELECT Id, Name, Type, Phone, Industry FROM Account WHERE Id = :accountId];
    }
    
    public static Account createAccount(Account newAccount) {
        // Perform any necessary validation or business logic here
        insert newAccount;
        return newAccount;
    }
}
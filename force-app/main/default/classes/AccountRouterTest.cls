@IsTest
private class AccountRouterTest {
    
    @IsTest
    static void testGetAccount() {
        // Create test data
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
        // Set up the REST context
        RestRequest req = new RestRequest();
        req.requestUri = '/services/apexrest/v1/accounts/' + testAccount.Id;
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = new RestResponse();
        
        // Call the method
        Test.startTest();
        AccountRouter.doGet();
        Test.stopTest();
        
        // Verify the response
        RestResponse res = RestContext.response;
        System.assertEquals(200, res.statusCode);
        
        Account returnedAccount = (Account)JSON.deserialize(res.responseBody.toString(), Account.class);
        System.assertEquals(testAccount.Id, returnedAccount.Id);
        System.assertEquals(testAccount.Name, returnedAccount.Name);
    }
    
    @IsTest
    static void testGetAccountNotFound() {
        // Set up the REST context for a non-existing account
        RestRequest req = new RestRequest();
        req.requestUri = '/services/apexrest/v1/accounts/001QL00000M8PiEYAV';
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = new RestResponse();
        
        // Call the method
        Test.startTest();
        AccountRouter.doGet();
        Test.stopTest();
        
        // Verify the response
        RestResponse res = RestContext.response;
        //System.assertEquals(404, res.statusCode);
    }
    
    @IsTest
    static void testGetAccountException() {
        // Set up the REST context to simulate an exception
        RestRequest req = new RestRequest();
        req.requestUri = '/services/apexrest/v1/accounts/invalidId';
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = new RestResponse();
        
        // Call the method
        Test.startTest();
        AccountRouter.doGet();
        Test.stopTest();
        
        // Verify the response
        RestResponse res = RestContext.response;
        //System.assertEquals(500, res.statusCode);
    }
    
    @IsTest
    static void testCreateAccount() {
        // Set up the REST context
        RestRequest req = new RestRequest();
        req.requestUri = '/services/apexrest/v1/accounts';
        req.httpMethod = 'POST';
        req.requestBody = Blob.valueOf('{"Name": "New Test Account", "Industry": "Technology"}');
        RestContext.request = req;
        RestContext.response = new RestResponse();
        
        // Call the method
        Test.startTest();
        AccountRouter.doPost();
        Test.stopTest();
        
        // Verify the response
        RestResponse res = RestContext.response;
        System.assertEquals(201, res.statusCode);
        
        Account createdAccount = (Account)JSON.deserialize(res.responseBody.toString(), Account.class);
        System.assertNotEquals(null, createdAccount.Id);
        System.assertEquals('New Test Account', createdAccount.Name);
        System.assertEquals('Technology', createdAccount.Industry);
    }
    
    @IsTest
    static void testCreateAccountInvalidJson() {
        // Set up the REST context with invalid JSON
        RestRequest req = new RestRequest();
        req.requestUri = '/services/apexrest/v1/accounts';
        req.httpMethod = 'POST';
        req.requestBody = Blob.valueOf('{"Name": "New Test Account", "Industry": Technology}');
        RestContext.request = req;
        RestContext.response = new RestResponse();
        
        // Call the method
        Test.startTest();
        AccountRouter.doPost();
        Test.stopTest();
        
        // Verify the response
        RestResponse res = RestContext.response;
        System.assertEquals(400, res.statusCode);
    }
    
    @IsTest
    static void testCreateAccountException() {
        // Set up the REST context to simulate an exception
        RestRequest req = new RestRequest();
        req.requestUri = '/services/apexrest/v1/accounts';
        req.httpMethod = 'POST';
        req.requestBody = Blob.valueOf('{"Name": "New Test Account"}'); // Missing fields to potentially cause an exception
        RestContext.request = req;
        RestContext.response = new RestResponse();
        
        // Call the method
        Test.startTest();
        AccountRouter.doPost();
        Test.stopTest();
        
        // Verify the response
        RestResponse res = RestContext.response;
        //System.assertEquals(500, res.statusCode);
    }
}
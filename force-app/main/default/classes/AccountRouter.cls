@RestResource(urlMapping='/v1/accounts/*')
global with sharing class AccountRouter {
    
    @HttpGet
    global static void doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        try {
            String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);
            Account account = AccountService.getAccountById(accountId);
            
            if (account != null) {
                res.statusCode = 200;
                res.responseBody = Blob.valueOf(JSON.serialize(account));
            } else {
                res.statusCode = 404;
                res.responseBody = Blob.valueOf(JSON.serialize(new ErrorResponse('Account not found')));
            }
        } catch (Exception e) {
            res.statusCode = 500;
            res.responseBody = Blob.valueOf(JSON.serialize(new ErrorResponse(e.getMessage())));
        }
    }
    
    @HttpPost
    global static void doPost() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        try {
            String jsonBody = req.requestBody.toString();
            Account newAccount = (Account)JSON.deserialize(jsonBody, Account.class);
            
            Account createdAccount = AccountService.createAccount(newAccount);
            
            res.statusCode = 201;
            res.responseBody = Blob.valueOf(JSON.serialize(createdAccount));
        } catch (JSONException e) {
            res.statusCode = 400;
            res.responseBody = Blob.valueOf(JSON.serialize(new ErrorResponse('Invalid JSON format')));
        } catch (Exception e) {
            res.statusCode = 500;
            res.responseBody = Blob.valueOf(JSON.serialize(new ErrorResponse(e.getMessage())));
        }
    }
}
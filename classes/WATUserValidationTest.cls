@isTest
private class WATUserValidationTest
{
    @testSetup static void methodName() 
    {
        Switch__c cohstest = new Switch__c();
        cohstest.Switch__c = false;
        cohstest.name = 'CaseOwnerHistorySwitch';
        insert cohstest;
        
        //Validation rule
        Validation_Rules__c valRule = Validation_Rules__c.getOrgDefaults();
        valRule.Bypass_Rules__c = false;
        insert valRule; 
    }     
        
    static testMethod void WATUserValidationTesting() 
    {
        try
        {
            User adminUser = [SELECT Id FROM User WHERE Profile.Name ='System Administrator' AND isActive = true LIMIT 1];
            Id adminProfileId = [SELECT Id FROM Profile WHERE Name ='System Administrator' LIMIT 1].Id;
            
            // Add a user        
            User user1 = createUser('test3225', adminUser.id, adminProfileId);
            
            // Create a queue
            Group group1 = new Group (
                type='Queue',
                name='Web Assistance Team'
            );
            INSERT group1;
            
            QueueSObject queueSObject1 = new QueueSObject(
                SObjectType='Case',
                QueueId = group1.id
            );
            INSERT queueSObject1;
            
            // Add user to queue
            GroupMember groupMember1 = new GroupMember(
                groupId = group1.id,
                userOrGroupID = user1.id  // user id
            );
            INSERT groupMember1;
            
            // Create several cases
            System.runAs(user1) 
            {
                List<Case> casesCreated = createCases(1, group1.id);
            }
        }
        catch(Exception e)
        {
            system.debug('Error Occured');
        }
    }

    private static List<Case> createCases (Integer numberToCreate, String caseOwnerId, Integer followUpDateFutureDays) 
    {
        List<Case> cases = new List<Case>();
        for (Integer i = 0; i<numberToCreate; i++) 
        {
            Case newCase = new Case(
                subject = 'Case subject ' + i,
                ownerId = caseOwnerId
            );
            if (followUpDateFutureDays > -1) {
                newCase.Follow_Up_Date_Time__c = (Date.today() + followUpDateFutureDays);       
            }
            cases.add(newCase); 
        }
        insert cases; 
        return cases;
    }

    private static List<Case> createCases (Integer numberToCreate, String caseOwnerId) 
    {
        return createCases(numberToCreate, caseOwnerId, -1);
    }
    
    private static User createUser(String uname, Id managerId, Id adminProfileId) 
    {
        User testUser = new User();
        testUser.LastName = uname ;
        testUser.Alias = uname;
        testUser.Email = uname +'@testcc.com';
        testUser.Username = uname +'@testcc.com';
        testUser.CommunityNickname = 'cctest'+ uname;
        testUser.TimeZoneSidKey = 'America/New_York';
        testUser.LocaleSidKey = 'en_US';
        testUser.EmailEncodingKey = 'ISO-8859-1';
        testUser.ProfileId = adminProfileId;
        testUser.LanguageLocaleKey = 'en_US';
        testUser.IsActive = true;
        testUser.ManagerId = managerId;
        INSERT testUser;
        return testUser;
    }
}
public class usertriggerhandler{
    
    @future
    public static void assignPermissionSetTomarketingProfileUsers(Set<Id> userIds)
    {
         System.Debug('Inside future Method');
         Permissionset permset = [SELECT Id, Name FROM PermissionSet WHERE Name = 'SalesConsoleUser' LIMIT 1];
         List<PermissionSetAssignment> newPermissions = new List<PermissionSetAssignment>();
       for(Id userId : userIds)
       {
            PermissionSetAssignment oPermissionSetAssignment = new PermissionSetAssignment();
            oPermissionSetAssignment.PermissionSetId = permset.Id;
            oPermissionSetAssignment.AssigneeId = userId;
            newPermissions.add(oPermissionSetAssignment);
       }
        if(newPermissions != null)
        {
            insert newPermissions;
        }
    }

}
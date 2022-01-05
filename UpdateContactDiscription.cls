public class UpdateContactDiscription implements Database.Batchable<sObject> {
public Database.QueryLocator start(Database.BatchableContext bc){
string query = 'select id,Title ,Account.id, Account.Name, Account.Description from Contact ';
return Database.getQueryLocator(query);
}
public void execute(Database.BatchableContext bc, List<Contact> contacts)
{
for(Contact con : contacts)
{
If(con.Account.id != Null)
{
con.Description = con.Title + ' of ' + con.Account.Name +' : ' + con.Account.Description;
}
update contacts;
}
}
public void finish(Database.BatchableContext bc){
}
}
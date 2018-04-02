public class accountSearch {
//Added for test navaneetha gitupload
//public string accoun {get;set;}
Public list<contact> contactlst{get;set;}
public string accName{get;set;}

Public accountSearch (){
//accountlst = new account();
contactlst = new list<Contact>();
}

Public void search(){
    system.debug('Contacts'+ accName);
    String newSearchText = '%'+accName+'%';
   // accoun = SELECT Id, Name FROM Account WHERE name LIKE '\'%' + accName + '%\'';
    List<Account> accoun = [SELECT Id, Name FROM Account WHERE name LIKE :('%' + accName + '%')];
    system.debug('Contacts'+ accoun);
    if(accoun != null)
    {
        contactlst = [select id, name from contact where  AccountId =: accoun];
        system.debug('Contacts'+contactlst );
    }   
}
    
    
}
public class Dynamicfiltercon {
    Public string selectedname{get;set;}
    public List<Account> acclst{get; set;}
    Public string recnamesearch{get;set;}
    
    Public Dynamicfiltercon(){
        acclst=new List<Account>([SELECT id,name FROM Account]);
    }
     
        Public List<Selectoption> getselectedaccnamefields(){
            List<Selectoption> lstnamesel = new List<selectoption>();
            lstnamesel.add(new selectOption('', '- None -'));
            for(Account acc :[SELECT id,name,phone,type,industry FROM Account]){
            lstnamesel.add(new selectoption(acc.id,acc.name));
            }
            return lstnamesel; 
        }
        
        public void ShowTable()  
    {  
        
       acclst=new List<Account>([SELECT id,name FROM Account WHERE id=:selectedname]);
       system.debug('@@@@acclstvalue:'+acclst);
    } 
    
}
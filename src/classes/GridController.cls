public class GridController { 
List<accountwrapper> accountList = new List<accountwrapper>();
    List<Account> selectedAccounts = new List<Account>();
   public class AccountWrapper {
        public Account acc { get; set; }
        public Boolean isRendered   { get; set; }
    }
 
    
    public List<AccountWrapper> getAccountWrappers() {
    
       List<AccountWrapper> accountWrappersToReturn = new List<AccountWrapper>();
        List<Account> acclist = [SELECT ID, Name, Industry from Account]; 
        
        /*for(Account a : [select Id, Name, Industry from Account])
        accountList.add(new accountwrapper(a));
        return accountList;*/
        
        // iterate over the list of Account
        for (Account acco : acclist ) {
    
            // create a wrapper to allow you to indicate visibility
            AccountWrapper accWrapper = new AccountWrapper();
    
            // stick the Account into the wrapper
           accWrapper.acc = acco ;
            
            // set the boolean field true/false based on condition
            if (acco.Industry == 'Electronics'){
                accWrapper.isRendered = true;
            } else {
                accWrapper.isRendered = false;
            }
            // add the wrapper to the list being returned
           accountList.add(accWrapper);
        }
    
        return accountList;
    
    }
        
     public PageReference getSelected()
    {
        selectedAccounts.clear();
        for(accountwrapper accwrapper : accountList)
        if(accwrapper.isRendered == true)
            selectedAccounts.add(accwrapper.acc);
            return null;
        }
    
 

    
    public List<Account> GetSelectedAccounts()
    {
        if(selectedAccounts.size()>0)
        return selectedAccounts;
        else
        return null;
    }    
        /*public class AccountWrapper {
        public Account acc { get; set; }
        public Boolean isRendered   { get; set; }
        public accountwrapper(Account a)
        {
            acc = a;
            isRendered = false;
        }
    }*/
  }
public with sharing class AddMultipleAccount {

    public PageReference SaveMultipleAccounts() {
        system.debug('==accountList==>'+accountList.size());
        List<Account> insertedAccountRecords = new List<Account>();
        if(accountList !=null && !accountList.isEmpty()){
            for(InnerClassAccountList eachRecord : accountList ){
                Account accTemp = eachRecord.record;
                insertedAccountRecords.add(accTemp);
               
            }
            system.debug('==insertedAccountRecords==>'+insertedAccountRecords.size());
            insert insertedAccountRecords;
        }


        return null;
    }


 public List<InnerClassAccountList> accountList {get;set;}
 public Integer rowToRemove {get;set;}

 public AddMultipleAccount(){
  accountList = new List<InnerClassAccountList>();
  addNewRowToAccList();
 }
 public void removeRowFromAccList(){
  accountList.remove(rowToRemove);
 }

 public void addNewRowToAccList(){
    InnerClassAccountList newRecord = new InnerClassAccountList();
    Account newAccountRecord = new Account();        
    newRecord.record = newAccountRecord;
    newRecord.index = accountList.size();
    accountList.add(newRecord);
    }
    
    

 public class InnerClassAccountList{
        public Integer index {get;set;}
        public Account record {get;set;}
   } 
}
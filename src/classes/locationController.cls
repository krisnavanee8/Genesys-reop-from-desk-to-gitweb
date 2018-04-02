public with sharing class locationController {

   // public String locationList { get; set; }
  // public list<Location__c> locationList= new list<Location__c>();  
    //private list<Location__c> lstrisk = new list<Location__c>();
    //public list<Location__c>getlstrisk(){return lstrisk;}
    public list<Location__c> locationList{get;set;} 
    public locationController()
    { 
        locationList= [Select ID, Country__c, State__c From Location__c] ; 
    } 

}
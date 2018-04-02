trigger Hellowworld on Book__c (before insert) {
 
 book__C [] books = Trigger.New;
 MyHellowworld.applydiscount(books);

}
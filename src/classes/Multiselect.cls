public class Multiselect {

public List<SelectOption> regionList {get;set;}
public List<SelectOption> countryList {get;set;}
public String[] selectedRegion{get;set;}
public String[] selectedCountryIds {get;set;}

public Multiselect (){
        init();
            }

 public void init(){
       regionList = new List<SelectOption>();
        List<SelectOption> pickListValuesregion = getPicklistValues(new Partner_Directory__c(), 'Region__C');
        regionList.addAll(pickListValuesregion);
        system.debug('regionList' + regionList);
       
        countryList = new List<SelectOption>();                      
         List<SelectOption> pickListValuescountry = getPicklistValues(new Partner_Directory__c(), 'Country__C');
        regionList.addAll(pickListValuescountry);           
        
 
 }

 private static list<SelectOption> getPicklistValues(SObject obj, String fld){
        list<SelectOption> options = new list<SelectOption>();
        // Get the object type of the SObject.
        Schema.sObjectType objType = obj.getSObjectType(); 
        // Describe the SObject using its object type.
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();       
        // Get a map of fields for the SObject
        map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap(); 
        // Get the list of picklist values for this field.
        list<Schema.PicklistEntry> values =
            fieldMap.get(fld).getDescribe().getPickListValues();
        // Add these values to the selectoption list.
        for (Schema.PicklistEntry a : values)
        { 
            options.add(new SelectOption(a.getLabel(), a.getValue())); 
        }
        return options;
    }
    
}
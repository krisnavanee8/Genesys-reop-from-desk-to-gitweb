@RestResource(urlMapping='/Cases/*')
global with sharing class CaseManager {

    @HttpGet
    global static Case getCaseById() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        string caseId = request.requestURI.substring(request.requestURI.lastIndexof('/')+1);
        case result = [select casenumber,subject, status,priority from case where id = :caseId];
        return result;
    }
    
    @HttpPost
    global static ID createcase(string subject, string status, string priority){
        case insertcase = new case(Subject =subject, Status = status, Priority = priority);        
        insert insertcase;
        return insertcase.id;
    }
    
    @HttpDelete
    global static void deletecase(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexof('/')+1);
        case delcase = [select id from case where id = :caseId];
        delete delcase;
        
    }
    
    @HttpPut
    global static ID upsertcase(string subject , string status, string priority, string Id){
        case upsertcase = new case(subject = subject, status = status, priority = priority, Id = id);
        // match the case with id if present otherwise insert new case
        // 
        upsert upsertcase;
        //return the caseid 
        return upsertcase.id;
        
    }
    
        @HttpPatch
        global static ID updateCaseFields() {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];
        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        // Iterate through each parameter field and value
        for(String fieldName : params.keySet()) {
            // Set the field and value on the Case sObject
            thisCase.put(fieldName, params.get(fieldName));
        }
        update thisCase;
        return thisCase.Id;
    }  
    
}
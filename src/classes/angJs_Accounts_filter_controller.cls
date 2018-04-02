public class angJs_Accounts_filter_controller { 

    Public string selectedstring{get;set;}
    public static String getlstAccount() { 
        return JSON.serialize([SELECT Id, Name, Type, Phone FROM Account ]); 
    }
}
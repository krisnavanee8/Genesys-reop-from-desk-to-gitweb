//display account record with sno and checkbox  in vf using wrapper class

public class samplewrapper{


    // declare the list get and set method for diplay the list of record in vf
    list<Accountwrapper> lstwrapper = new list<Accountwrapper>();
    public list<Accountwrapper> getlstwrapper(){return lstwrapper;}

    // constructor method for class
    
        public samplewrapper(){
            integer i = 1;
            for(Account acc: [select name,type from account limit 10]){
             
            // declare the wrapper varible for add the additional two fields(sno and checkbox)
            
            Accountwrapper wrap = new Accountwrapper();
            wrap.acc = acc;
            wrap.sno =  i;
            wrap.isselect = false;
            lstwrapper.add(wrap);
            i++;           
            }
        }
    

    // wrappper class

    class accountwrapper{
        public account acc{get;set;
        }
        public integer sno {get;set;}
        public boolean isselect {get;set;}           

    }  

}
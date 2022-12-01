//class is used to create a asmartcontract
import { storage } from "near-sdk-as" ;
class greeting{
    getGreeting(accountId: string): string | null{
        return storage.get<string>(accountId,"Greeting is not available");
    }
    setGreeting(){

    }
}
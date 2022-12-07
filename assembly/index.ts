//class is used to create a asmartcontract
import { storage,Context } from "near-sdk-as" ;
export class greeting{
    getGreeting(accountId: string): string | null{
        return storage.get<string>(accountId,"Greeting is not available");
    }
    setGreeting(greeting:string) : void{
        storage.set(Context.sender,greeting);

    }
}

//namespace

namespace Utility {
    export namespace Fees {
        export function CalculateLateFees(dayslate : number) : number {
            return dayslate * 0.25;
        }
    }

    export function MaxBookAllowed(age:number) : number {
        if(age < 12) {
            return 3;
        }
        else {
            return 10;
        }
    }
    
    function privateFun() : void {
        console.log("This is private");
        
    }
}
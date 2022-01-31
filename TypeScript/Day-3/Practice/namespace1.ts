//namespace example
namespace namespace1 {
    export function ToUpper(str: string): string {
        return str.toUpperCase();
    }
   export function ToLower(str: string): string {
        return str.toLowerCase();
    }
    export function AnnualCalc(fee : number , term : number){
        return fee * term ;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
/* Store a product information in map object. Key will be a product item and value will be the price of that product. 
 * Search the product by product name.*/
namespace CollectionPractice
{
    class PracticeExercise3
    {
        static void Main(string[] args)
        {
            Dictionary<string, int> product = new Dictionary<string, int>();
            product.Add("Mobile",12000);
            product.Add("Laptop",35000);
            product.Add("Charger",1000);
            product.Add("Head Phone",2500);
            product.Add("Airpods",9000);
            Console.WriteLine("Product | Price");
            foreach(KeyValuePair<string,int> kv in product)
            {
                Console.WriteLine(kv.Key + "  "+ kv.Value);
            }
           
            Console.ReadLine();
        }
    }
}

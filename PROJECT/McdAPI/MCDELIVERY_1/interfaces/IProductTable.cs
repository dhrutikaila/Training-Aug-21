using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.Models;

namespace MCDELIVERY_1.interfaces
{
    public interface IProductTable
    {
        List<ProductTable> GetProductTables();

        ProductTable GetProductTable(int id);

        ProductTable PostProductTable(ProductTable product_table);

        ProductTable PutProductTable(ProductTable product_table);

        void DeleteProductTable(ProductTable product_table);
    }
}

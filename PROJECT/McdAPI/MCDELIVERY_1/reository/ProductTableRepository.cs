using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MCDELIVERY_1.interfaces;
using MCDELIVERY_1.Models;
using Microsoft.EntityFrameworkCore;

namespace MCDELIVERY_1.reository
{
    public class ProductTableRepository : IProductTable
    {
        private readonly MCDELIVERY1Context _context;

        public ProductTableRepository(MCDELIVERY1Context context)
        {
            _context = context;
        }

        public void DeleteProductTable(ProductTable product_table)
        {
            _context.ProductTables.Remove(product_table);
            _context.SaveChanges();
        }

        public ProductTable GetProductTable(int id)
        {
            var product = _context.ProductTables.Find(id);
            return product;
        }

        public List<ProductTable> GetProductTables()
        {
            return _context.ProductTables.ToList();
        }
   

        public ProductTable PostProductTable(ProductTable product_table)
        {
            _context.ProductTables.Add(product_table);
            _context.SaveChanges();
            return product_table;
        }

        public ProductTable PutProductTable(ProductTable product_table)
        {
            var ExistProduct = _context.ProductTables.Find(product_table.ProductId);
            if (ExistProduct != null)
            {
                ExistProduct.Name = product_table.Name;
                _context.ProductTables.Update(ExistProduct);
                _context.SaveChanges();
            }
            return product_table;
        }

    }
}



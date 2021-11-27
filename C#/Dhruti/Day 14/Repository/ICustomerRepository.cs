using ToyShop.Models;

namespace ToyShopAPI.Controllers
{
    internal interface ICustomerRepository
    {
        object GetCustomer(int id);
        void DeleteCustomer(object customer);
        void EditCustomer(Customer customer);
        void AddCustomer(Customer customer);
        object GetCustomers();
    }
}
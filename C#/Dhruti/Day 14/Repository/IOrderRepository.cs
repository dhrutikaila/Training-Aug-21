namespace ToyShopAPI.Controllers
{
    internal interface IOrderRepository
    {
        object GetToy(int toy);
        object AddOrder(int customerId, int totalAmount);
    }
}
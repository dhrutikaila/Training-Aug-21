namespace ToyShopAPI.Controllers
{
    public interface IToyRepository
    {
        object GetToys();
        object SearchToy(string productName);
    }
}
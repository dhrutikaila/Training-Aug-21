using Microsoft.AspNetCore.Mvc;
using ZomatoApp.Models;
using ZomatoApp.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using ZomatoApp.DBContext;
using System.Threading.Tasks;

namespace ZomatoApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RestaurantController : ControllerBase
    {

       
        private readonly IRestaurant _Restaurant;
        private readonly IProduct product;
        public RestaurantController(IRestaurant rest, IProduct prod)
        {
            _Restaurant = rest;
            product = prod;
            
        }
        //get all restaurant
        [HttpGet]
        public IEnumerable<Restaurant> GetRestaurents()
        {
            return _Restaurant.GetRestaurants();
        }

        //Add reastaurant
        [HttpPost]
        public string creates([FromBody] Restaurant addUser)
        {

            Restaurant checkRestaurant = _Restaurant.FirstOrDefault(s => s.RestaurantName == addUser.RestaurantName && s.RestaurantCity == addUser.RestaurantCity);
            if (checkRestaurant != null)
                
                return "Restaurant already exists...";
            else
            {
                _Restaurant.Create(addUser);
                Restaurant addedUser = _Restaurant.GetAll().Last();
                return $"Restaurant {addedUser.RestaurantName} is added successfully and your id is {addedUser.RestaurantId}";
            }
        }

        //Get By Id
        [HttpGet("{id}")]
        public ActionResult<Restaurant> GetRestaurents(int id)
        {
            var restaurent = _Restaurant.GetById(id);

            if (restaurent == null)
            {
                return NotFound();
            }
            return restaurent;
        }
        //[HttpGet("{id")]
        //public Task<ActionResult<Restaurant>>  GetProductandRest(int id)
        //{
        //    var datta = (from p in product
        //                 join r in _Restaurant
        //                 on p.RestaurantId equals r.RestaurantId
        //                 select new
        //                 {
        //                     p.ProductId,
        //                     p.ProductName,
        //                     p.Product_price,
        //                     p.Product_Image,
        //                     p.CategoryId,
        //                     p.RestaurantId = id,
        //                     r.RestaurantName
        //                 }).ToList();
        //    //var Product1 = product.GetAll();

          
        //        return datta;
            
        //}
        //delete 
        [HttpDelete("{id}")]
        public IActionResult DeleteRestaurant(int id)
        {
            var restaurant = _Restaurant.GetById(id);
            if (restaurant == null)
            {
                return NotFound();
            }

            _Restaurant.Delete(restaurant);

            return NoContent();
        }

        //Put
        [HttpPut("{id}")]
        public ActionResult<Restaurant> PutRestaurent(int id, Restaurant restaurant)
        {
            try
            {
                _Restaurant.Update(restaurant);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            return GetRestaurents(id);

        }
    }
}

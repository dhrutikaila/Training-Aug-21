using APIProject.Interface;
using APIProject.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIProject.Controllers
{
   
    [ApiController]
    public class UserAddressController : ControllerBase
    {
        private IUserAddress _userAddress;
        public UserAddressController(IUserAddress userAddress)
        {
            _userAddress = userAddress;
        }

        //get all data

        [HttpGet]
        [Route("api/[controller]")]
        public IActionResult GetUsers()
        {
            return Ok(_userAddress.GetAll());
        }

        //get data by id
        [HttpGet]
        [Route("api/[controller]/{id}")]
        public IActionResult GetById(int id)
        {
            var userAddress = _userAddress.GetById(id);
            if (userAddress != null)
            {
                return Ok(userAddress);
            }
            return NotFound($"User with this id {id} was not found");
        }

        //insert data 
        [HttpPost]
        [Route("api/[controller]")]
        public IActionResult GetById(UserAddress userAddress)
        {
            _userAddress.Create(userAddress);
            return Created(HttpContext.Request.Scheme + "://" + HttpContext.Request.Host + HttpContext.Request.Path + "/" + userAddress.UserAddressId
                , userAddress);
        }

        //delete data 
        [HttpDelete]
        [Route("api/[controller]/{id}")]
        public IActionResult DeleteUser(int id)
        {
            var user = _userAddress.GetById(id);
            if (user != null)
            {
                _userAddress.Delete(user);
                return Ok();
            }
            return NotFound($"User with this id {id} was not found");
        }

        //update the data 
        [HttpPatch]
        [Route("api/[controller]/{id}")]
        public IActionResult EditEmergencyContact(int id, UserAddress userAddress)
        {
            var ExistingUser = _userAddress.GetById(id);
            if (ExistingUser != null)
            {
                userAddress.UserAddressId = ExistingUser.UserId;
                _userAddress.Update(id, userAddress);
                return Ok();
            }
            return Ok(userAddress);
        }
    }
}

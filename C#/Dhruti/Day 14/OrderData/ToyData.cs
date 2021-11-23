
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ToyShop.Models;


namespace WebApi1.ToyData
{
    public interface IToyData
    {
        List<Toy> GetToys();

        Toy GetToy(int id);

        //Toy AddToy(Toy toy);

        //void DeleteToy(Toy toy);

        //Toy EditToy(Toy toy);
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Day_14_Assignment.Models;

namespace Day_14_Assignment.ToyData
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

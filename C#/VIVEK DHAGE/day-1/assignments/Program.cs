using System;
using System.Data;

namespace day_one_four
{
    class Program
    {


        static void Main(string[] args)
        {
            Console.WriteLine("Hello there!");

            DataTable st = new DataTable();
            st.Columns.Add("name");
            st.Columns.Add("Address");
            st.Columns.Add("Hindi");
            st.Columns.Add("English");
            st.Columns.Add("Maths");
            st.Columns.Add("Grades");

            Console.WriteLine("enter NAME , ADDRESS, HINDI, ENGLISH, MATHS separated by comma ");



       

            for (int i = 0; i < 5; i++)
            {

                DataRow row = st.NewRow();

                string data = Console.ReadLine();
                string[] value = data.Split(",");
              

                row["Name"] = Convert.ToString(value[0]);
                row["Address"] = Convert.ToString(value[1]);
                row["Hindi"] = Convert.ToInt32(value[2]);
                row["English"] = Convert.ToInt32(value[3]);
                row["Maths"] = Convert.ToInt32(value[4]);
                row["Grades"] = Convert.ToInt32(Convert.ToInt32(value[2])+ Convert.ToInt32(value[3])+ Convert.ToInt32(value[4]))/3;
                st.Rows.Add(row);

                
       

            }
            //["Name"] +"  " + r["Address"] + "  " + r["Hindi"] + "  " + r["English"] + "  " + r["Maths"] + "  " + r["Grades"]

            Console.WriteLine();
            Console.WriteLine("fetched.....");
            Console.WriteLine();
            foreach ( DataRow r in st.Rows)
            { 
                foreach (DataColumn c in st.Columns)
                    Console.WriteLine(r[c]+ " ");

                Console.WriteLine();
            }







        }
    }
}


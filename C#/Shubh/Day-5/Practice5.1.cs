using System;
public class Practice1
{
    public static void Main()
    {
        string[] arr = new string[10];
        int i;
        
        Console.Write("Enter 5 students name :\n");
        for (i = 0; i < 5; i++)
        {
            Console.Write("Student - {0} : ", i);
            arr[i] = Convert.ToString(Console.ReadLine());
        }

        Console.Write("\nStudents' names are: \n");
        for (i = 0; i < 10; i++)
        {
            Console.Write("{0} \n ", arr[i]);
        }
        Console.Write("\n");
    }
}

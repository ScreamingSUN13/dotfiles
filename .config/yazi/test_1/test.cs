// Test script for syntax highlighting
using System;
using System.Collections.Generic;

namespace TestApp
{
    public class Animal
    {
        public string Species { get; set; }

        public Animal(string species)
        {
            Species = species;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            List<int> nums = new List<int> { 1, 2, 3 };
            foreach (int n in nums)
            {
                if (n > 0)
                {
                    Console.WriteLine($"Value: {n}");
                }
            }
        }
    }
}

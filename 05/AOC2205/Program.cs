using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;

namespace AOC2205
{
    class Program
    {
        public static IDictionary<Int32,ArrayList> crates = new Dictionary<Int32,ArrayList>();
        
        static void Main(string[] args)
        {
            var lines = File.ReadLines("C:\\Users\\manti\\Desktop\\projeler\\adventofcode2022\\05\\AOC2205\\5.txt"); //not relative but whatever

            foreach (var line in lines) 
            {
                //parsing crate list
                if (line.Contains("["))
                {
                    for (var i = 0; i <(line.Length + 1)/4 ; i++)
                    {
                        if (line.Substring(i * 4, 3).Trim().Equals(""))
                            continue;
                        String crate;
                        try
                        {
                            crate = line.Substring(i * 4, 4);
                        }
                        catch (Exception e)
                        {
                            //trol
                            crate = line.Substring(i * 4, 3);
                        }
                        Console.WriteLine(crate);
                        if (!crates.ContainsKey(i + 1))
                            crates.Add(i + 1,new ArrayList());
                        
                        crates[i + 1].Insert(0,crate.Trim());
                    }
                } 

                if (line.StartsWith("move"))
                {
                    
                    MatchCollection matches = Regex.Matches(line, @"\d+");
                    var crateFrom = crates[Int32.Parse(matches[1].Value)];
                    var crateTo = crates[Int32.Parse(matches[2].Value)];
                    /*  SOLUTION ONE
                    for (int i = 0; i < Int32.Parse(matches[0].Value); i++)
                    {
                        var item = crateFrom[crateFrom.Count - 1];
                        crateFrom.RemoveAt(crateFrom.Count - 1);
                        crateTo.Add(item);                        
                    }
                    */

                    //Solution 2
                    for (var i = Int32.Parse(matches[0].Value) - 1; i >= 0; i--)
                    {
                        var item = crateFrom[crateFrom.Count - 1 - i];
                        crateFrom.RemoveAt(crateFrom.Count -1 - i);
                        crateTo.Add(item);
                    }
                }
            }

            for (int i = 0; i < crates.Count; i++)
            {
                Console.WriteLine(crates[i+1][crates[i+1].Count - 1]);
            }
        }
    }
}
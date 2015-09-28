using System;
using NDesk.Options;
using System.Collections.Generic;

namespace hc_database
{
    class Program
    {
        static private DatabaseOperation op;
        static private string dbType;

        static void Main(string[] args)
        {
            bool help = false;

            var p = new OptionSet() {
                { "init",       "Initializes a new halcyon database",               v => op = DatabaseOperation.Init },
                { "t|type",     "Specifies the halcyon database type (core, rdb)",  v => dbType = v },
                { "h|?|help",   "Prints this help message",                         v => help = v != null },
            };

            List<string> extra = p.Parse(args);

            if (help)
            {
                Console.WriteLine("Options:");
                p.WriteOptionDescriptions(Console.Out);
                return;
            }

        }
        
    }
}

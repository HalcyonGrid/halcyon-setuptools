using System;
using NDesk.Options;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace hc_database
{
    class Program
    {
        static private bool help = false;
        static private DatabaseOperation op;

        static private string dbType;

        static private string dbHost;
        static private string dbUser;
        static private string dbPass;

        static private OptionSet options = new OptionSet()
        {
            { "init",       "Initializes a new halcyon database",               v => op = DatabaseOperation.Init },
            { "upgrade",    "Upgrades halcyon database",                        v => op = DatabaseOperation.Upgrade },
            { "t|type=",     "Specifies the halcyon database type (core, rdb)",  v => dbType = v },
            { "h|host=",     "Specifies the database hostname",                  v => dbHost = v },
            { "u|user=",     "Specifies the database username",                  v => dbUser = v },
            { "p|password=", "Specifies the database password",                  v => dbPass = v },
            { "?|help",   "Prints this help message",                           v => help = v != null },
        };

        static void Main(string[] args)
        {
            List<string> extra = options.Parse(args);

            if (help || op == DatabaseOperation.None)
            {
                PrintUsage();
                return;
            }

            switch (op)
            {
                case DatabaseOperation.Init:
                    DoInit();
                    break;
            }
        }

        private static void PrintUsage()
        {
            Console.WriteLine("Options:");
            options.WriteOptionDescriptions(Console.Out);
        }

        private static void DoInit()
        {
            if (String.IsNullOrEmpty(dbType))
            {
                PrintUsage();
                return;
            }

            switch (dbType.ToLower())
            {
                case "core":
                    DoInitCore();
                    break;
            }
        }

        private static void DoInitCore()
        {
            if (! VerifyDatabaseParameters())
            {
                PrintUsage();
                return;
            }

            MySqlConnection conn = new MySqlConnection(
                String.Format("Data Source={0};User ID={1};password={2}",
                dbHost, dbUser, dbPass));

            try
            {
                conn.Open();
            }
            catch (MySqlException e)
            {
                Console.Error.WriteLine("Unable to connect to the database: {0}", e.Message);
                return;
            }
            

        }

        /// <summary>
        /// Make sure user filled out host, user, password
        /// </summary>
        /// <returns>True if parameters are filled, false if not</returns>
        private static bool VerifyDatabaseParameters()
        {
            if (String.IsNullOrEmpty(dbHost) || String.IsNullOrEmpty(dbUser) 
                || String.IsNullOrEmpty(dbPass))
            {
                return false;
            }

            return true;
        }
    }
}

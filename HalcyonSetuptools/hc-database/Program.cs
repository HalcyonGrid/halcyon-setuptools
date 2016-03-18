using System;
using NDesk.Options;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

namespace hc_database
{
    class Program
    {
        private static bool help = false;
        private static DatabaseOperation op;

        private static string dbType;

        private static string dbHost;
        private static string dbUser;
        private static string dbPass;
        private static string dbSchema;

        private const string CORE_DEFAULT_SCHEMA_NAME = "inworldz";
        private const string RDB_DEFAULT_SCHEMA_NAME = "inworldz_rdb";

        private const string CORE_SCHEMA_BASE_FILE = "inworldz-core-base.sql";
        private const string RDB_SCHEMA_BASE_FILE = "inworldz-rdb-base.sql";


        private static OptionSet options = new OptionSet()
        {
            { "init",           "Initializes a new halcyon database",               v => op = DatabaseOperation.Init },
            { "upgrade",        "Upgrades a halcyon database",                      v => op = DatabaseOperation.Upgrade },
            { "t|type=",        "Specifies the halcyon database type (core, rdb)",  v => dbType = v.ToLower() },
            { "h|host=",        "Specifies the database hostname",                  v => dbHost = v },
            { "u|user=",        "Specifies the database username",                  v => dbUser = v },
            { "p|password=",    "Specifies the database password",                  v => dbPass = v },
            { "s|schema=",      "Specifies the name of the database schema",        v => dbSchema = v },
            { "?|help",         "Prints this help message",                         v => help = v != null },
        };

        static int Main(string[] args)
        {
            List<string> extra = options.Parse(args);

            if (help || op == DatabaseOperation.None)
            {
                PrintUsage();
                return 1;
            }

            //allow blank passwords
            if (dbPass == null) dbPass = String.Empty;

            switch (op)
            {
                case DatabaseOperation.Init:
                    return DoInit();
            }

            return 1;
        }

        private static void PrintUsage()
        {
            Console.WriteLine();
            Console.WriteLine("Options:");
            options.WriteOptionDescriptions(Console.Out);
        }

        private static int DoInit()
        {
            if (String.IsNullOrEmpty(dbType))
            {
                PrintUsage();
                return 1;
            }

            switch (dbType)
            {
                case "core":
                case "rdb":
                    return DoInitRun();
            }

            Console.Error.WriteLine("Unknown database type: " + dbType);
            return 1;
        }

        private static int DoInitRun()
        {
            if (String.IsNullOrEmpty(dbSchema))
            {
                if (dbType == "core")
                {
                    dbSchema = CORE_DEFAULT_SCHEMA_NAME;
                }
                else if (dbType == "rdb")
                {
                    dbSchema = RDB_DEFAULT_SCHEMA_NAME;
                }
            }

            if (!VerifyDatabaseParameters())
            {
                PrintUsage();
                return 1;
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
                return 1;
            }

            //create the schema if it is missing
            try
            {
                MySqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = String.Format("CREATE DATABASE IF NOT EXISTS {0};", dbSchema);
                cmd.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.Error.WriteLine("Unable to create database schema: {0}", e.Message);
                return 1;
            }

            //for the core database, we'll actually open up and run both the 
            //core file and the RDB file. that way, a user can run both from
            //the same database
            if (dbType == "core")
            {
                try
                {
                    SqlFileRunner coreRunner = new SqlFileRunner(conn, dbSchema, CORE_SCHEMA_BASE_FILE);
                    coreRunner.Run();
                }
                catch (Exception e)
                {
                    Console.Error.WriteLine("Unable to load CORE schema: {0}", e.Message);
                    return 1;
                }
            }
            
            if (dbType == "core" || dbType == "rdb")
            {
                try
                {
                    SqlFileRunner rdbRunner = new SqlFileRunner(conn, dbSchema, RDB_SCHEMA_BASE_FILE);
                    rdbRunner.Run();
                }
                catch (Exception e)
                {
                    Console.Error.WriteLine("Unable to load RDB schema: {0}", e.Message);
                    return 1;
                }
            }
            

            return 0;
        }

        /// <summary>
        /// Make sure user filled out host, user, password
        /// </summary>
        /// <returns>True if parameters are filled, false if not</returns>
        private static bool VerifyDatabaseParameters()
        {
            if (String.IsNullOrEmpty(dbHost) || String.IsNullOrEmpty(dbUser) 
                || String.IsNullOrEmpty(dbSchema))
            {
                return false;
            }

            return true;
        }
    }
}

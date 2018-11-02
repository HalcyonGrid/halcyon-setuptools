using System;
using NDesk.Options;
using MySql.Data.MySqlClient;

namespace hc_database
{
    class Program
    {
        private static bool _help;
        private static DatabaseOperation _op;

        private static string _dbType;

        private static string _dbHost;
        private static string _dbUser;
        private static string _dbPass;
        private static string _dbSchema;

        private const string CoreDefaultSchemaName = "halcyon";
        private const string RdbDefaultSchemaName = "halcyon_rdb";

        private const string CoreSchemaBaseFile = "sql/halcyon-core-base.sql";
        private const string RdbSchemaBaseFile = "sql/halcyon-rdb-base.sql";


        private static OptionSet _options = new OptionSet()
        {
            { "init",           "Initializes a new halcyon database",               v => _op = DatabaseOperation.Init },
            // { "upgrade",        "Upgrades a halcyon database",                      v => _op = DatabaseOperation.Upgrade },
            { "t|type=",        "Specifies the halcyon database type (core, rdb, both)",  v => _dbType = v.ToLower() },
            { "h|host=",        "Specifies the database hostname",                  v => _dbHost = v },
            { "u|user=",        "Specifies the database username",                  v => _dbUser = v },
            { "p|password=",    "Specifies the database password",                  v => _dbPass = v },
            { "s|schema=",      "Specifies the name of the database schema",      v => _dbSchema = v },
            { "?|help",         "Prints this help message",                         v => _help = v != null },
        };

        static int Main(string[] args)
        {
            _options.Parse(args);

            if (_help || _op == DatabaseOperation.None)
            {
                PrintUsage();
                return 1;
            }

            //allow blank passwords
            if (_dbPass == null) _dbPass = String.Empty;

            switch (_op)
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
            _options.WriteOptionDescriptions(Console.Out);
        }

        private static int DoInit()
        {
            if (String.IsNullOrEmpty(_dbType))
            {
                PrintUsage();
                return 1;
            }

            switch (_dbType)
            {
                case "core":
                case "rdb":
                case "both":
                    return DoInitRun();
            }

            Console.Error.WriteLine("Unknown database type: " + _dbType);
            return 1;
        }

        private static int DoInitRun()
        {
            if (String.IsNullOrEmpty(_dbSchema))
            {
                if ((_dbType == "core") || (_dbType == "both"))
                {
                    _dbSchema = CoreDefaultSchemaName;
                }
                else if (_dbType == "rdb")
                {
                    _dbSchema = RdbDefaultSchemaName;
                }
            }

            if (!VerifyDatabaseParameters())
            {
                PrintUsage();
                return 1;
            }

            MySqlConnection conn = new MySqlConnection(
                String.Format("Data Source={0};User ID={1};password={2}",
                _dbHost, _dbUser, _dbPass));

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
                cmd.CommandText = String.Format("CREATE DATABASE IF NOT EXISTS {0};", _dbSchema);
                cmd.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                Console.Error.WriteLine("Unable to create database schema: {0}", e.Message);
                return 1;
            }

            if ((_dbType == "core") || (_dbType == "both"))
            {
                try
                {
                    SqlFileRunner coreRunner = new SqlFileRunner(conn, _dbSchema, CoreSchemaBaseFile);
                    coreRunner.Run();
                }
                catch (Exception e)
                {
                    Console.Error.WriteLine("Unable to load CORE schema: {0}", e.Message);
                    return 1;
                }
            }
            
            if (_dbType == "rdb" || _dbType == "both")
            {
                try
                {
                    SqlFileRunner rdbRunner = new SqlFileRunner(conn, _dbSchema, RdbSchemaBaseFile);
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
            if (String.IsNullOrEmpty(_dbHost) || String.IsNullOrEmpty(_dbUser) 
                || String.IsNullOrEmpty(_dbSchema))
            {
                return false;
            }

            return true;
        }
    }
}

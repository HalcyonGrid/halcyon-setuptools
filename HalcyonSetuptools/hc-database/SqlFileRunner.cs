using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.IO;

namespace hc_database
{
    /// <summary>
    /// Class that runs an SQL structure dump one statement at a time
    /// </summary>
    public class SqlFileRunner
    {
        private string[] _commands;
        private MySqlConnection _conn;

        /// <summary>
        /// Constructs a new runner that will execute the given file
        /// </summary>
        /// <param name="conn">The database connection to execute the commands against</param>
        /// <param name="filePath">The path of the SQL dump that contains the commands to run</param>
        public SqlFileRunner(MySqlConnection conn, string schema, string filePath)
        {
            _conn = conn;
            _conn.ChangeDatabase(schema);

            //try to open the file
            string[] lines = File.ReadAllLines(filePath);
            List<string> filteredLines = new List<string>(lines.Length);

            //filter commented lines
            foreach (var line in lines)
            {
                if (! line.StartsWith("--"))
                {
                    filteredLines.Add(line);
                }
            }

            //join and then split by semicolon which should be one statement
            string joined = String.Join("", filteredLines);
            _commands = joined.Split(new char[] { ';' });
        }

        /// <summary>
        /// Runs the loaded file
        /// </summary>
        public void Run()
        {
            foreach (var command in _commands)
            {
                var cmd = _conn.CreateCommand();
                cmd.CommandText = command;

                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (MySqlException e)
                {
                    throw new Exception(String.Format("Error {0}\nWhile executing query {1}", 
                        e.Message, command), e);
                }
                
            }
        }
    }
}

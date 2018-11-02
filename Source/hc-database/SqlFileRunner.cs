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
        private List<string> _commands = new List<string>();
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
                if (! line.StartsWith("--") && !String.IsNullOrWhiteSpace(line))
                {
                    filteredLines.Add(line);
                }
            }

            //parse the file looking for semicolons or delimiter statements
            string delim = ";";
            char[] delimCharArray = delim.ToCharArray();
            StringBuilder commandSoFar = new StringBuilder();

            foreach (var line in filteredLines)
            {
                if (line.StartsWith("DELIMITER "))
                {
                    delim = line.Split(' ')[1];
                    delimCharArray = delim.ToCharArray();
                    continue;
                }

                for (int i = 0; i < line.Length; i++)
                {
                    if (line[i] == delim[0])
                    {
                        if (i + delim.Length - 1 < line.Length && 
                            line.ToCharArray(i, delim.Length).SequenceEqual(delimCharArray))
                        {
                            //we hit a delimiter
                            _commands.Add(commandSoFar.ToString());
                            commandSoFar.Clear();
                        }
                        else
                        {
                            commandSoFar.Append(line[i]);
                        }
                    }
                    else
                    {
                        commandSoFar.Append(line[i]);
                    }
                }

                commandSoFar.Append("\n");
            }

            if (commandSoFar.Length > 0 && !String.IsNullOrWhiteSpace(commandSoFar.ToString()))
            {
                _commands.Add(commandSoFar.ToString());
            }
        }

        /// <summary>
        /// Runs the loaded file
        /// </summary>
        public void Run()
        {
            for (int i = 0; i < _commands.Count; i++)
            {
                if (String.IsNullOrWhiteSpace(_commands[i]))
                {
                    continue;
                }

                var cmd = _conn.CreateCommand();
                cmd.CommandText = _commands[i];

                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (MySqlException e)
                {
                    string prevCommand = String.Empty;
                    string nextCommand = String.Empty;
                    if (i > 0) prevCommand = _commands[i - 1];
                    if (i+1 < _commands.Count) nextCommand = _commands[i + 1];

                    throw new Exception(String.Format("Error {0}\nWhile executing query {1}\n\nContext:\n{2}\n{3}\n{4}", 
                        e.Message, _commands[i], prevCommand, _commands[i], nextCommand), e);
                }
                
            }
        }
    }
}

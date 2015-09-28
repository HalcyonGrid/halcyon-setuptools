namespace hc_database
{
    /// <summary>
    /// The type of operation to be performed
    /// </summary>
    public enum DatabaseOperation
    {
        /// <summary>
        /// No operation. The user didn't select an option
        /// </summary>
        None,

        /// <summary>
        /// Database initialization
        /// </summary>
        Init,

        /// <summary>
        /// Database upgrade
        /// </summary>
        Upgrade,

    }
}

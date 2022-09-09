using Newtonsoft.Json;
using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spoonacular
{
    public partial class ViewFavorites : System.Web.UI.Page
    {
        public List<string> ids = new List<string>();
        public string combinedString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // User is not supposed to use this webform, redirect to Login
            if (Session.Contents.Count == 0)
            {
                Response.Redirect("Login.aspx");
            }

            // Find user's favorite recipes based on his username
            string query = "select id from favorites where username = @username";
            
            try
            {
                NpgsqlConnection connection = new NpgsqlConnection(Auxiliary.CONNECTION_STRING);
                connection.Open();
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("username", (string)HttpContext.Current.Session["Username"]);
                NpgsqlDataReader dataReader = command.ExecuteReader(); //run query
                while (dataReader.Read())
                {
                    ids.Add(dataReader[0].ToString());
                }
                connection.Close();
            }
            catch
            {
                //do nothing
            }
            combinedString = string.Join(",", ids);
            System.Diagnostics.Debug.WriteLine(combinedString);
        }
    }
}
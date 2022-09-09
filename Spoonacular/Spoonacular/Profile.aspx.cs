using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spoonacular
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // User is not supposed to use this webform, redirect to Login
            if (Session.Contents.Count == 0)
            {
                Response.Redirect("Login.aspx");
            }

            hello.InnerText = "Hello, " + (string)HttpContext.Current.Session["Username"];

            // Find user's info based on his username
            string query = "select first_name, last_name, email from users where username = @username";
            string emaildb = "", first_name = "", last_name = "";
            try
            {
                NpgsqlConnection connection = new NpgsqlConnection(Auxiliary.CONNECTION_STRING);
                connection.Open();
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("username", (string)HttpContext.Current.Session["Username"]);
                NpgsqlDataReader dataReader = command.ExecuteReader(); //run query
                while (dataReader.Read())
                {
                    first_name = dataReader[0].ToString();
                    last_name = dataReader[1].ToString();
                    emaildb = dataReader[2].ToString();
                }
                connection.Close();
            }
            catch
            {
                //do nothing
            }
            name.InnerText = first_name + " " + last_name;
            email.InnerText = emaildb;
        }

        protected void Logout(object sender, EventArgs e)
        {
            // Clear session when user logs out
            Session.Clear();
            Response.Redirect("index.aspx");
        }
    }
}
using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spoonacular
{
    public partial class ViewMeals : System.Web.UI.Page
    {
        public List<string> ids1 = new List<string>();
        public List<string> days1 = new List<string>();
        public List<string> nutrients1 = new List<string>();
        public string combinedString1, combinedString2, combinedString3;

        protected void Page_Load(object sender, EventArgs e)
        {
            // User is not supposed to use this webform, redirect to Login
            if (Session.Contents.Count == 0)
            {
                Response.Redirect("Login.aspx");
            }

            // Find user's favorite recipes based on his username
            string query = "select * from mealplans where username = @username";

            try
            {
                NpgsqlConnection connection = new NpgsqlConnection(Auxiliary.CONNECTION_STRING);
                connection.Open();
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("username", (string)HttpContext.Current.Session["Username"]);
                NpgsqlDataReader dataReader = command.ExecuteReader(); //run query
                while (dataReader.Read())
                {
                    days1.Add(dataReader[1].ToString());
                    days1.Add(dataReader[1].ToString());
                    days1.Add(dataReader[1].ToString());
                    ids1.Add(dataReader[2].ToString());
                    ids1.Add(dataReader[3].ToString());
                    ids1.Add(dataReader[4].ToString());
                    nutrients1.Add(dataReader[1].ToString());
                    nutrients1.Add(dataReader[5].ToString());
                    nutrients1.Add(dataReader[6].ToString());
                    nutrients1.Add(dataReader[7].ToString());
                    nutrients1.Add(dataReader[8].ToString());
                }
                connection.Close();
            }
            catch
            {
                //do nothing
            }

            foreach (string s in days1)
            {
                System.Diagnostics.Debug.WriteLine(s);
            }

            combinedString1 = string.Join(",", ids1);
            combinedString2 = string.Join(",", days1);
            combinedString3 = string.Join("-", nutrients1);
        }
    }
}
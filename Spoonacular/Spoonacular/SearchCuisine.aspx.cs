using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spoonacular
{
    public partial class SearchCuisine : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            result.Text = Request.QueryString["result"].ToString();
            string s = Request.QueryString["id"];
            System.Diagnostics.Debug.WriteLine(s);

            if (s != null)
            {
                // User is not supposed to use this webform, redirect to Login
                if (Session.Contents.Count == 0)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    // Add recipe to favorites
                    string query = "insert into favorites values (@username, @id)";
                    int rowsAffected = -1; //false value
                    try
                    {
                        NpgsqlConnection connection = new NpgsqlConnection(Auxiliary.CONNECTION_STRING);
                        connection.Open();
                        //define query's parameters
                        NpgsqlCommand command = new NpgsqlCommand(query, connection);
                        command.Parameters.AddWithValue("username", (string)HttpContext.Current.Session["Username"]);
                        command.Parameters.AddWithValue("id", s);
                        rowsAffected = command.ExecuteNonQuery(); //run query
                        connection.Close();
                    }
                    catch { }
                    if (rowsAffected == -1)
                    {
                        string notification1 = "You have already added this recipe to your favorites.";
                        Response.Write("<script>alert('" + notification1 + "') ; </script>");
                    }
                    else
                    {
                        string notification1 = "Recipe added to your favorites successfully!";
                        Response.Write("<script>alert('" + notification1 + "') ; </script>");
                    }
                }
            }
        }
    }
}
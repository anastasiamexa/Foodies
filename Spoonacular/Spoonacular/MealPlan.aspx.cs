using HtmlAgilityPack;
using Newtonsoft.Json.Linq;
using Npgsql;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spoonacular
{
    public partial class MealPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // User is not supposed to use this webform, redirect to Login
            if (Session.Contents.Count == 0)
            {
                Response.Redirect("Login.aspx");
            }
        }


        protected void SaveMeal(object sender, EventArgs e)
        {
            // List of Meals objects contents of which will be saved to database
            List<Meals> mealsdb = new List<Meals>();
            // Secondary auxiliary list
            List<List<string>> axlist = new List<List<string>>();

            // Get json string containing the values of second table (meals)
            var json = meals.Value;

            var objects = JArray.Parse(json); // parse as array  
            foreach (JObject root in objects)
            {
                // Save the Day and Id of the second table to the auxiliary list (3 recipes for each day)
                List<string> flag = new List<string>();
                flag.Add((string)root.GetValue("Day"));
                flag.Add((string)root.GetValue("Id"));
                axlist.Add(flag);
            }

            // Get json string containing the values of first table (nutrients)
            var json1 = nutrients.Value;

            var objects1 = JArray.Parse(json1); // parse as array  
            foreach (JObject root in objects1)
            {
                // List containing the ids of the 3 recipes for each day
                List<string> ids = new List<string>();
                foreach (List<string> sublist in axlist)
                {
                    // If days match
                    if (((string)root.GetValue("Day")).Equals(sublist[0]))
                    {
                        // Add the id
                        ids.Add(sublist[1]);
                    }
                }

                // Create the Meals object which is going to be saved in database and add it to the list
                Meals mobject = new Meals((string)HttpContext.Current.Session["Username"], 
                    (string)root.GetValue("Day"), ids[0], ids[1], ids[2], (decimal)root.GetValue("Calories"), 
                    (decimal)root.GetValue("Protein"), (decimal)root.GetValue("Fat"), (decimal)root.GetValue("Carbohydrates"));
                mealsdb.Add(mobject);
            }

            int rowsAffected = -1; // false value
            // Insert or overwrite data in database
            foreach (Meals m in mealsdb)
            {
                string query = "insert into mealplans values (@username, @days, @id1, @id2, @id3, @calories, @protein, @fat, @carbohydrates)" +
                    "on conflict (username, days) do update set id1 = @id1,  id2 = @id2, id3 = @id3,  calories = @calories, protein = @protein,  " +
                    "fat = @fat, carbohydrates = @carbohydrates";
                try
                {
                    NpgsqlConnection connection = new NpgsqlConnection(Auxiliary.CONNECTION_STRING);
                    connection.Open();
                    //define query's parameters
                    NpgsqlCommand command = new NpgsqlCommand(query, connection);
                    command.Parameters.AddWithValue("username", m.username);
                    command.Parameters.AddWithValue("days", m.days);
                    command.Parameters.AddWithValue("id1", m.id1);
                    command.Parameters.AddWithValue("id2", m.id2);
                    command.Parameters.AddWithValue("id3", m.id3);
                    command.Parameters.AddWithValue("calories", m.calories);
                    command.Parameters.AddWithValue("protein", m.protein);
                    command.Parameters.AddWithValue("fat", m.fat);
                    command.Parameters.AddWithValue("carbohydrates", m.carbohydrates);
                    rowsAffected = command.ExecuteNonQuery(); //run query
                    connection.Close();
                }
                catch { break;  }
            }
            if (rowsAffected == -1)
            {
                string notification1 = "Something went wrong, please try again later.";
                Response.Write("<script>alert('" + notification1 + "') ; </script>");
            }
            else
            {
                string notification1 = "Meal plan created successfully!";
                Response.Write("<script>alert('" + notification1 + "') ; </script>");
            }
        }
    }
}
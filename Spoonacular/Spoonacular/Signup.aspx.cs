using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spoonacular
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void SignUpButton_Click(object sender, EventArgs e)
        {
            // Check if user's input is valid
            if (!password.Text.Trim().Equals(confirm.Text.Trim()))
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert(' Passwords must match ')", true);
            else
            {
                // Check database for duplicates (email, username)
                string notification = Auxiliary.CheckForDublicates(email.Text, username.Text);
                if (notification != null)
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + notification + "')", true);
                else
                {
                    // Create salt
                    string salt = Convert.ToBase64String(Auxiliary.GenerateSalt());
                    // Hash password
                    string hashed_password = Auxiliary.HashPassword(password.Text, Convert.FromBase64String(salt));
                    // Create user object
                    User user = new User(firstname.Text, lastname.Text, email.Text, username.Text, hashed_password, salt);
                    if (user.StoreUserInfoToDB() == "done")
                    {
                        Session["Username"] = user.username;
                        Response.Redirect("Profile.aspx");
                    }
                }
            }
        }

    }
}
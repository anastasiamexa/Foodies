using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spoonacular
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear(); //clear session variables 
        }

        protected void LogInButton_Click(object sender, EventArgs e)
        {
            //Check if user's input is valid
            string notification = Auxiliary.IsValidUserInputLogIn(username.Text.Trim(), password.Text.Trim());
            if (notification != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + notification + "')", true);
                return;
            }
            else
            {
                User user = new User(username.Text.Trim());
                //Check if user's credentials match a dababase record
                notification = user.AuthenticateCredentials(password.Text.Trim());
                if (notification != null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + notification + "')", true);
                    return;
                }
                else
                {
                    Session["Username"] = user.username;
                    Response.Redirect("Profile.aspx");
                }
            }
        }
    }
}
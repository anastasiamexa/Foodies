using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spoonacular
{
    public partial class SearchMap : System.Web.UI.Page
    {
        // Creating a dictionary using collection-initializer syntax
        Dictionary<string, string> cuisines = new Dictionary<string, string>
        {
            {"AO", "african"},{"BF", "african"},{"BI", "african"},{"BJ", "african"},{"BW", "african"},{"CD", "african"},{"CF", "african"},{"CG", "african"},
            {"CI", "african"},{"CM", "african"},{"DJ", "african"},{"DZ", "african"},{"EH", "african"},{"ER", "african"},{"ET", "african"},{"GA", "african"},
            {"GH", "african"},{"GM", "african"},{"GN", "african"},{"GQ", "african"},{"GW", "african"},{"KE", "african"},{"LR", "african"},{"LS", "african"},
            {"LY", "african"},{"MA", "african"},{"MG", "african"},{"ML", "african"},{"MR", "african"},{"MW", "african"},{"MZ", "african"},{"NA", "african"},
            {"NE", "african"},{"NG", "african"},{"RW", "african"},{"SD", "african"},{"SL", "african"},{"SN", "african"},{"SO", "african"},{"SS", "african"},
            {"SZ", "african"},{"TD", "african"},{"TG", "african"},{"TN", "african"},{"TZ", "african"},{"UG", "african"},{"ZA", "african"},{"ZM", "african"},
            {"ZW", "african"},{"BS", "caribbean"},{"CU", "caribbean"},{"DO", "caribbean"},{"HT", "caribbean"},{"JM", "caribbean"},{"PR", "caribbean"},
            {"AR", "latin american"},{"BO", "latin american"},{"BR", "latin american"},{"BZ", "latin american"},{"CL", "latin american"},{"CO", "latin american"},
            {"CR", "latin american"},{"EC", "latin american"},{"FK", "latin american"},{"GF", "latin american"},{"GT", "latin american"},{"GY", "latin american"},
            {"HN", "latin american"},{"NI", "latin american"},{"PA", "latin american"},{"PE", "latin american"},{"PY", "latin american"},{"SR", "latin american"},
            {"SV", "latin american"},{"TT", "latin american"},{"UY", "latin american"},{"VE", "latin american"},{"AE", "middle eastern"},{"EG", "middle eastern"},
            {"IL", "middle eastern"},{"IQ", "middle eastern"},{"IR", "middle eastern"},{"JO", "middle eastern"},{"KW", "middle eastern"},{"LB", "middle eastern"},
            {"OM", "middle eastern"},{"PS", "middle eastern"},{"QA", "middle eastern"},{"SA", "middle eastern"},{"SY", "middle eastern"},{"TR", "middle eastern"},
            {"YE", "middle eastern"},{"DK", "nordic"},{"EE", "nordic"},{"FI", "nordic"},{"IS", "nordic"},{"LT", "nordic"},{"LV", "nordic"},{"NO", "nordic"},
            {"SE", "nordic"},{"CN", "chinese"},{"DE", "german"},{"ES", "spanish"},{"FR", "french"},{"GB", "british"},{"GR", "greek"},{"IE", "irish"},{"IN", "indian"},
            {"IT", "italian"},{"JP", "japanese"},{"KR", "korean"},{"MX", "mexican"},{"US", "american"},{"VN", "vietnamese"}
        };

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GetCuisines(object sender, EventArgs e)
        {
            string s = hdnText.Value;
            if (s == "-") // No country selected
            {
                Response.Write("<script>alert('No country selected.')</script>");
            }
            else
            {
                s = s.Substring(1, s.Length - 2);
                // List of selected countries
                List<string> result = s.Split(',').ToList();
                string final = ""; // Create the string with selected countries, used for API call
                foreach (string s1 in result)
                {
                    // Check if country tag exist in countries dictionary
                    if (cuisines.ContainsKey(s1.Substring(1, s1.Length - 2)))
                    {
                        // Add to the final string the cuisine name of this country
                        final = final + cuisines[s1.Substring(1, s1.Length - 2)] + ",";
                    }
                }
                if (!string.IsNullOrEmpty(final))
                {
                    // To remove the comma at the end of the list
                    HiddenField1.Value = final.Remove(final.Length - 1);
                    final = HiddenField1.Value;
                    Response.Redirect(string.Format("~/SearchCuisine.aspx?result={0}", final));
                }
                else
                {
                    Response.Write("<script>alert('This country is not supported.');</script>");
                }
            }
        }
    }
}
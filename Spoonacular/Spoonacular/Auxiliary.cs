using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Spoonacular
{
    public class Auxiliary
    {
        public static readonly string CONNECTION_STRING = "Host=127.0.0.1;Port=5432;User ID=postgres;Password=maxrouso2;Database=foodies;";

        //----Hash Password----
        //================================================================================================================================

        //Generate a salt to hash the user's password.
        public static byte[] GenerateSalt()
        {
            byte[] salt = new byte[32]; //salt length is 32 (can be changed)
            using (var random = new RNGCryptoServiceProvider())
            {
                random.GetNonZeroBytes(salt); //salt
            }
            return salt;
        }

        //Hashes the user's password along with the salt.
        public static string HashPassword(string rawPassword, byte[] salt)
        {
            byte[] password = Encoding.UTF8.GetBytes(rawPassword); //convert to bytes
            byte[] passwordWithSalt = new byte[password.Length + salt.Length];
            for (int i = 0; i < password.Length; i++) //copy password bytes
            {
                passwordWithSalt[i] = password[i];
            }
            for (int i = 0; i < salt.Length; i++) //copy salt bytes
            {
                passwordWithSalt[i + password.Length] = salt[i];
            }
            using (SHA512 shaM = new SHA512Managed())
            {
                return Convert.ToBase64String(shaM.ComputeHash(passwordWithSalt)); //hashed password (with salt)
            }
        }
        //================================================================================================================================

        //----Sign Up----
        //================================================================================================================================

        //Username is pk, email is unique
        public static string CheckForDublicates(string email, string username)
        {
            string query = "select email, username from users";
            List<string> emailsDB = new List<string>(); //store emails 
            List<string> usernamesDB = new List<string>(); //store usernames
            try
            {
                NpgsqlConnection connection = new NpgsqlConnection(CONNECTION_STRING);
                connection.Open();
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                NpgsqlDataReader dataReader = command.ExecuteReader(); //run query
                while (dataReader.Read())
                {
                    emailsDB.Add(dataReader[0].ToString());
                    usernamesDB.Add(dataReader[1].ToString());
                }
                connection.Close();
            }
            catch
            {
                return "An exeption was caught. Please report it.";
            }
            foreach (string emailDB in emailsDB) //check for duplicates (email)
                if (emailDB.Equals(email))
                    return "Email already exists";
            foreach (string usernameDB in usernamesDB) //check for duplicates (username)
                if (usernameDB.Equals(username))
                    return "Username already exists";
            return null;
        }
        //================================================================================================================================

        //----Log In----
        //================================================================================================================================ 

        //Validate user's input.
        public static string IsValidUserInputLogIn(string username, string password)
        {
            if (username.Trim().Length == 0)
                return "Please fill all input fields";
            if (password.Trim().Length < 6)
                return "Password must be at least 6 characters long";
            return null;
        }
        //================================================================================================================================ 
    }
}
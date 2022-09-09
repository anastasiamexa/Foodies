using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Spoonacular
{
    public class Meals
    {
        //----Fields----
        public string username;
        public string days;
        public string id1;
        public string id2;
        public string id3;
        public decimal calories;
        public decimal protein;
        public decimal fat;
        public decimal carbohydrates;

        //----Constructors----
        public Meals(string username, string days, string id1, string id2, string id3, decimal calories, decimal protein, decimal fat, decimal carbohydrates)
        {
            this.username = username;
            this.days = days;
            this.id1 = id1;
            this.id2 = id2;
            this.id3 = id3;
            this.calories = calories;
            this.protein = protein;
            this.fat = fat;
            this.carbohydrates = carbohydrates;
        }
    }
}
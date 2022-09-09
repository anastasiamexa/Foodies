<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MealPlan.aspx.cs" Inherits="Spoonacular.MealPlan" %>

<!DOCTYPE html>
<html style="font-size: 16px;" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Contact Us">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Meal Plan</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="MealPlan.css" media="screen">
    <link rel="stylesheet" href="Table.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <link id="uthemegooglefont" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">

    <meta name="theme-color" content="#ec8700">
    <meta property="og:title" content="ContactUs">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script type="text/javascript" src="https://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
    <script>
        // Get the price per serving of a recipe based on its id
        function getsource(id) {
            var resl="";
            $.getJSON({
                url: "https://api.spoonacular.com/recipes/" + id + "/information?apiKey=0db44aa7a5cf4ff7b85275379c342cae",
                async: false, 
                success: function (res) {
                    resl = res.pricePerServing; 
                }
            });
            return resl;
        }
        // Get recipe information and update the contents of the HTML tables
        function getrecipe(q) {
            // Show the gif
            document.getElementById('burger').style.display = "inherit";
            // Clear the contents of the tables
            $("#dashTable tbody tr").remove(); 
            $("#dashTable1 tbody tr").remove();
            document.getElementById('pricetag').innerHTML = "";
            // Check if user selected daily meal plan or weekly
            var time = document.getElementById('day').value;
            if (document.getElementById('week').checked) {
              time = document.getElementById('week').value;
            }
            var slider1 = $(".slider1").val();
            // Daily plan
            if (time == "day") {
                $.getJSON({
                    // Get a daily meal plan according to the user's criteria (calories, diet)
                    url: "https://api.spoonacular.com/mealplanner/generate?apiKey=0db44aa7a5cf4ff7b85275379c342cae&timeFrame=" + time + "&targetCalories=" + slider1 + "&diet=" + q,
                    success: function (res) {
                        res.meals.forEach((element) => {
                            // Set the contents of the second table
                            var t = document.getElementById("dashTable");
                            var r = document.createElement("TR");
                            r.innerHTML = `
                                                     <tr style="height: 55px;">
                                                        <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell u-table-cell-7">Today</th>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.id}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.title}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.readyInMinutes}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.servings}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${((getsource(element.id) / 100).toFixed(2) * element.servings).toFixed(2)}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell"><a href="${element.sourceUrl}" target="_blank">${element.sourceUrl}</a></td>
                                                        <!--<td class="u-border-2 u-border-grey-30 u-table-cell">${element.sourceUrl}</td>-->
                                                    </tr>
                                            `
                            t.tBodies[0].appendChild(r)
                        });
                        total() // Call total() function to calculate the price
                        // Set the contents of the first table
                        var t = document.getElementById("dashTable1");
                        var r = document.createElement("TR");
                        r.innerHTML = `
                                                     <tr style="height: 55px;">
                                                        <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell u-table-cell-7">Today</th>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${res.nutrients.calories}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${res.nutrients.protein}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${res.nutrients.fat}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${res.nutrients.carbohydrates}</td>
                                                    </tr>
                                            `
                        t.tBodies[0].appendChild(r)
                    }
                });
            }
            // Weekly plan
            else {
                $.getJSON({
                url: "https://api.spoonacular.com/mealplanner/generate?apiKey=0db44aa7a5cf4ff7b85275379c342cae&timeFrame="+time+"&targetCalories="+slider1+"&diet="+q, 
                success: function (res) {
                    res.week.monday.meals.forEach((element) => {
                        // Add to the contents of the second table
                        var t = document.getElementById("dashTable");
                        var r = document.createElement("TR");
                        r.innerHTML = `
                                                     <tr style="height: 55px;">
                                                        <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell">Monday</th>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.id}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.title}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.readyInMinutes}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.servings}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${((getsource(element.id)/ 100).toFixed(2) * element.servings).toFixed(2)}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell"><a href="${element.sourceUrl}" target="_blank">${element.sourceUrl}</a></td>
                                                    </tr>
                                            `
                        t.tBodies[0].appendChild(r)
                    });
                    // Add to the contents of the first table
                    var t = document.getElementById("dashTable1");
                    var r = document.createElement("TR");
                    r.innerHTML = `
                                                <tr style="height: 55px;">
                                                <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell u-table-cell-7">Monday</th>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.monday.nutrients.calories}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.monday.nutrients.protein}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.monday.nutrients.fat}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.monday.nutrients.carbohydrates}</td>
                                            </tr>
                                    `
                    t.tBodies[0].appendChild(r)
                    // Add to the contents of the second table
                    res.week.tuesday.meals.forEach((element) => {
                        var t = document.getElementById("dashTable");
                        var r = document.createElement("TR");
                        r.innerHTML = `
                                                     <tr style="height: 55px;">
                                                        <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell">Tuesday</th>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.id}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.title}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.readyInMinutes}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.servings}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${((getsource(element.id)/ 100).toFixed(2) * element.servings).toFixed(2)}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell"><a href="${element.sourceUrl}" target="_blank">${element.sourceUrl}</a></td>
                                                    </tr>
                                            `
                        t.tBodies[0].appendChild(r)
                    });
                    // Add to the contents of the first table
                    var t = document.getElementById("dashTable1");
                    var r = document.createElement("TR");
                    r.innerHTML = `
                                                <tr style="height: 55px;">
                                                <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell u-table-cell-7">Tuesday</th>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.tuesday.nutrients.calories}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.tuesday.nutrients.protein}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.tuesday.nutrients.fat}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.tuesday.nutrients.carbohydrates}</td>
                                            </tr>
                                    `
                    t.tBodies[0].appendChild(r)
                    // Add to the contents of the second table
                    res.week.wednesday.meals.forEach((element) => {
                        var t = document.getElementById("dashTable");
                        var r = document.createElement("TR");
                        r.innerHTML = `
                                                     <tr style="height: 55px;">
                                                        <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell">Wednesday</th>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.id}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.title}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.readyInMinutes}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.servings}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${((getsource(element.id)/ 100).toFixed(2) * element.servings).toFixed(2)}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell"><a href="${element.sourceUrl}" target="_blank">${element.sourceUrl}</a></td>
                                                    </tr>
                                            `
                        t.tBodies[0].appendChild(r)
                    });
                    // Add to the contents of the first table
                    var t = document.getElementById("dashTable1");
                    var r = document.createElement("TR");
                    r.innerHTML = `
                                                <tr style="height: 55px;">
                                                <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell u-table-cell-7">Wednesday</th>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.wednesday.nutrients.calories}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.wednesday.nutrients.protein}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.wednesday.nutrients.fat}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.wednesday.nutrients.carbohydrates}</td>
                                            </tr>
                                    `
                    t.tBodies[0].appendChild(r)
                    // Add to the contents of the second table
                    res.week.thursday.meals.forEach((element) => {
                        var t = document.getElementById("dashTable");
                        var r = document.createElement("TR");
                        r.innerHTML = `
                                                     <tr style="height: 55px;">
                                                        <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell">Thursday</th>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.id}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.title}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.readyInMinutes}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.servings}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${((getsource(element.id)/ 100).toFixed(2) * element.servings).toFixed(2)}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell"><a href="${element.sourceUrl}" target="_blank">${element.sourceUrl}</a></td>
                                                    </tr>
                                            `
                        t.tBodies[0].appendChild(r)
                    });
                    // Add to the contents of the first table
                    var t = document.getElementById("dashTable1");
                    var r = document.createElement("TR");
                    r.innerHTML = `
                                                <tr style="height: 55px;">
                                                <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell u-table-cell-7">Thursday</th>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.thursday.nutrients.calories}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.thursday.nutrients.protein}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.thursday.nutrients.fat}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.thursday.nutrients.carbohydrates}</td>
                                            </tr>
                                    `
                    t.tBodies[0].appendChild(r)
                    // Add to the contents of the second table
                    res.week.friday.meals.forEach((element) => {
                        var t = document.getElementById("dashTable");
                        var r = document.createElement("TR");
                        r.innerHTML = `
                                                     <tr style="height: 55px;">
                                                        <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell">Friday</th>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.id}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.title}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.readyInMinutes}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.servings}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${((getsource(element.id)/ 100).toFixed(2) * element.servings).toFixed(2)}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell"><a href="${element.sourceUrl}" target="_blank">${element.sourceUrl}</a></td>
                                                    </tr>
                                            `
                        t.tBodies[0].appendChild(r)
                    });
                    // Add to the contents of the first table
                    var t = document.getElementById("dashTable1");
                    var r = document.createElement("TR");
                    r.innerHTML = `
                                                <tr style="height: 55px;">
                                                <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell u-table-cell-7">Friday</th>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.friday.nutrients.calories}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.friday.nutrients.protein}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.friday.nutrients.fat}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.friday.nutrients.carbohydrates}</td>
                                            </tr>
                                    `
                    t.tBodies[0].appendChild(r)
                    // Add to the contents of the second table
                    res.week.saturday.meals.forEach((element) => {
                        var t = document.getElementById("dashTable");
                        var r = document.createElement("TR");
                        r.innerHTML = `
                                                     <tr style="height: 55px;">
                                                        <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell">Saturday</th>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.id}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.title}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.readyInMinutes}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.servings}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${((getsource(element.id)/ 100).toFixed(2) * element.servings).toFixed(2)}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell"><a href="${element.sourceUrl}" target="_blank">${element.sourceUrl}</a></td>
                                                    </tr>
                                            `
                        t.tBodies[0].appendChild(r)
                    });
                    // Add to the contents of the first table
                    var t = document.getElementById("dashTable1");
                    var r = document.createElement("TR");
                    r.innerHTML = `
                                                <tr style="height: 55px;">
                                                <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell u-table-cell-7">Saturday</th>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.saturday.nutrients.calories}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.saturday.nutrients.protein}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.saturday.nutrients.fat}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.saturday.nutrients.carbohydrates}</td>
                                            </tr>
                                    `
                    t.tBodies[0].appendChild(r)
                    // Add to the contents of the second table
                    res.week.sunday.meals.forEach((element) => {
                        var t = document.getElementById("dashTable");
                        var r = document.createElement("TR");
                        r.innerHTML = `
                                                     <tr style="height: 55px;">
                                                        <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell">Sunday</th>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.id}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.title}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.readyInMinutes}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${element.servings}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${((getsource(element.id)/ 100).toFixed(2) * element.servings).toFixed(2)}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell"><a href="${element.sourceUrl}" target="_blank">${element.sourceUrl}</a></td>
                                                    </tr>
                                            `
                        t.tBodies[0].appendChild(r)
                    });
                    // Add to the contents of the first table
                    var t = document.getElementById("dashTable1");
                    var r = document.createElement("TR");
                    r.innerHTML = `
                                                <tr style="height: 55px;">
                                                <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell u-table-cell-7">Sunday</th>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.sunday.nutrients.calories}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.sunday.nutrients.protein}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.sunday.nutrients.fat}</td>
                                                <td class="u-border-2 u-border-grey-30 u-table-cell">${res.week.sunday.nutrients.carbohydrates}</td>
                                            </tr>
                                    `
                    t.tBodies[0].appendChild(r)
                    total() // Call total() function to calculate the price
                }
                });
            }
        }

        // Function to calculate the price
        function total(){
            var table = document.getElementById('dashTable');
            let total = 0 // sum of prices
            // For each recipe
            for (let i = 1; i < table.rows.length; i++){
                // Add to total variable the sum of the prices
                total+=Number(table.rows[i].cells[5].innerText)
            }
            // Show the price rounded to two decimals
            document.getElementById('pricetag').innerHTML = "Total: " + total.toFixed(2) + " $";
            // Show button to save the meal
            document.getElementById('saveplan').style.visibility = "visible";
            // Hide the gif
            document.getElementById('burger').style.display = "none";
        }

        // Function to pass the tables contents to C#
        function GetTableValues() {
            //Create an Array to hold the Table values.
            var meals = new Array();
 
            //Reference the Table.
            var table = document.getElementById("dashTable");
 
            //Loop through Table Rows.
            for (var i = 1; i < table.rows.length; i++) {
                //Reference the Table Row.
                var row = table.rows[i];
 
                //Copy values from Table Cell to JSON object.
                var meal = {};
                meal.Day = row.cells[0].innerHTML;
                meal.Id = row.cells[1].innerHTML;
                meal.Title = row.cells[2].innerHTML;
                meal.Ready = row.cells[3].innerHTML;
                meal.Servings = row.cells[4].innerHTML;
                meal.Price = row.cells[5].innerHTML;
                meal.Link = row.cells[6].innerHTML;
                meals.push(meal);
            }

            //Create an Array to hold the Table values.
            var nutrients = new Array();
 
            //Reference the Table.
            var table1 = document.getElementById("dashTable1");
 
            //Loop through Table Rows.
            for (var i = 1; i < table1.rows.length; i++) {
                //Reference the Table Row.
                var row = table1.rows[i];
 
                //Copy values from Table Cell to JSON object.
                var nutrient = {};
                nutrient.Day = row.cells[0].innerHTML;
                nutrient.Calories = row.cells[1].innerHTML;
                nutrient.Protein = row.cells[2].innerHTML;
                nutrient.Fat = row.cells[3].innerHTML;
                nutrient.Carbohydrates = row.cells[4].innerHTML;
                nutrients.push(nutrient);
            }
            document.getElementById("meals").value = JSON.stringify(meals);
            document.getElementById("nutrients").value = JSON.stringify(nutrients);
        }

        $(function () {
          $(document).scroll(function () {
            var $nav = $(".navbar-fixed-top");
            $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
          });
        });
    </script>
    <style>
        .navbar-fixed-top.scrolled {
          background-color: rgba(232, 236, 230, 0.7) !important;
          transition: background-color 200ms linear;
        }
    </style>
  </head>
<body class="u-body u-xl-mode"><header class="u-clearfix u-header u-sticky u-sticky-fe8d u-header navbar-fixed-top" id="sec-3d90"><div class="u-clearfix u-sheet u-sheet-1">
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
          <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px;">
            <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg class="u-svg-link" viewBox="0 0 24 24"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
              <svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg"><g><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
</g></svg>
            </a>
          </div>
          <div class="u-custom-menu u-nav-container">
            <ul class="u-nav u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="Recipes.aspx" style="padding: 34px 120px;">Recipes</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="MealPlan.aspx" style="padding: 34px 120px;">Meal Plan</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="Wines.aspx" style="padding: 34px 120px;">Wine Pairing</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="Profile.aspx" style="padding: 34px 120px;">Profile</a>
</li></ul>
          </div>
          <div class="u-custom-menu u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
              <div class="u-inner-container-layout u-sidenav-overflow">
                <div class="u-menu-close"></div>
                <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Recipes.aspx">Recipes</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="MealPlan.aspx">Meal Plan</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Wines.aspx">Wine Pairing</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="Profile.aspx">Profile</a>
</li></ul>
              </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
          </div>
        </nav>
        <a style="z-index:9999; position:absolute" href="index.aspx"><img class="u-image u-image-default u-image-1" src="images/foodies.png" alt="" data-image-width="713" data-image-height="272" data-href="438027"/></a>
      </div></header> 
    <section class="u-clearfix u-section-1" id="sec-ee6e">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-align-center u-container-style u-group u-shape-rectangle u-group-1">
          <div class="u-container-layout">
            <h2 class="u-text u-text-default u-text-1">Target calories</h2>
            <h2 class="u-text u-text-default u-text-2">Choose the type of plan you want to create</h2>
            <div class="u-form u-form-1">
              <form action="#" method="POST" class="u-clearfix u-form-horizontal u-form-spacing-15 u-inner-form" style="padding: 15px;" source="email">
                <div class="u-form-group u-form-name u-label-none">
                  <label for="name-ef64" class="u-label">Food</label>
                  <input type="text" placeholder="e.g. vegan" id="diet" name="name" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white u-input-1">
                </div>
                <div class="u-form-group u-form-submit">
                  <a href="#" class="u-btn u-btn-submit u-button-style">Create</a>
                  <input type="submit" value="submit" class="u-form-control-hidden" onclick="getrecipe(document.getElementById('diet').value)"/>
                </div>
              </form>
            </div>
            <h2 class="u-text u-text-default u-text-3">Diet</h2>
            <div class="u-align-left u-clearfix u-custom-html u-custom-html-1">
              <input type="radio" id="day" name="fav_language" value="day" checked/>
              <label for="day">Daily</label>
              <input type="radio" id="week" name="fav_language" value="week">
              <label for="week">Weekly</label>
            </div>
            <div class="u-clearfix u-custom-html u-custom-html-2">
              <style></style>
              <input class="slider1" id="slider1" type="range" value="1500" min="500" max="3500" step="100" oninput="this.nextElementSibling.value = this.value">
              <output for="slider2">1500</output>
            </div>
          </div>
        </div>
          <!-- First table -->
          <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
              <h1 id="pricetag" class="u-text u-text-default"></h1>
              <center><image id="burger" style="display:none; width:20%; height:20%" src="images/hamburger.gif" /></center>
        <div class="u-expanded-width u-table u-table-responsive u-table-1">
          <table id="dashTable1" class="u-table-entity u-table-entity-1">
            <colgroup>
              <col width="15%">
              <col width="15%">
              <col width="15%">
              <col width="15%">
              <col width="15%">
            </colgroup>
            <thead class="u-align-center u-custom-font u-grey-60 u-heading-font u-table-header u-table-header-1">
              <tr style="height: 96px;">
                <th class="u-table-cell">Day</th>
                <th class="u-table-cell">Calories</th>
                <th class="u-table-cell">Protein</th>
                <th class="u-table-cell">Fat</th>
                <th class="u-table-cell">Carbohydrates</th>
              </tr>
            </thead>
            <tbody id="task-row1" class="u-table-alt-palette-4-light-1 u-table-body">
            </tbody>
          </table>
        </div>
      </div>
          <!-- Second table -->
          <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <div class="u-expanded-width u-table u-table-responsive u-table-1">
          <table id="dashTable" class="u-table-entity u-table-entity-1">
            <colgroup>
              <col width="10%">
              <col width="5%">
              <col width="26.3%">
              <col width="10.1%">
              <col width="8%">
              <col width="6.7%">
              <col width="33.9%">
            </colgroup>
            <thead class="u-align-center u-custom-font u-grey-60 u-heading-font u-table-header u-table-header-1">
              <tr style="height: 96px;">
                <th class="u-table-cell">Day</th>
                <th class="u-table-cell">ID</th>
                <th class="u-table-cell">Title</th>
                <th class="u-table-cell">Ready in minutes</th>
                <th class="u-table-cell">Servings</th>
                <th class="u-table-cell">Price</th>
                <th class="u-table-cell">Link</th>
              </tr>
            </thead>
            <tbody id="task-row" class="u-table-alt-palette-4-light-1 u-table-body">
            </tbody>
          </table>
        </div>
      </div>
      </div>
    <form runat="server">
    <div id="saveplan" style="visibility: hidden; float:right; margin-right:270px" class="u-form-group u-form-submit">
        <input type="text" id = "meals" hidden="hidden" runat="server"/>
        <input type="text" id = "nutrients" hidden="hidden" runat="server"/>
        <asp:Button runat="server" class="u-btn u-btn-submit u-button-style" Text="Save" OnClientClick="GetTableValues()" OnClick="SaveMeal"/>
    </div>
    </form>
    </section>
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-18cf"><div class="u-clearfix u-sheet u-sheet-1">
        <img class="u-image u-image-round u-radius-10 u-image-1" src="images/foodies.png" alt="" data-image-width="713" data-image-height="272">
        <img class="u-image u-image-round u-radius-10 u-image-2" src="images/award.png" alt="" data-image-width="300" data-image-height="75">
        <h4 class="u-text u-text-1">Powered by</h4>
        <img class="u-image u-image-round u-radius-10 u-image-3" src="images/spoonacular_150.png" alt="" data-image-width="148" data-image-height="150">
        <h4 class="u-text u-text-2">Spoonacular API</h4>
        <h5 class="u-text u-text-3">© 2022 | foodies.com</h5>
      </div></footer>
</body>
</html>

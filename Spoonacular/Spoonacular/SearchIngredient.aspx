<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchIngredient.aspx.cs" Inherits="Spoonacular.SearchIngredient" %>

<!DOCTYPE html>

<html style="font-size: 16px;" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Contact Us">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Search by Ingredients</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Recipes.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <link id="uthemegooglefont" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    <link id="upagegooglefont" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
    <meta name="theme-color" content="#ec8700">
    <meta property="og:title" content="ContactUs">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script>
        // Get recipe information
        function getrecipe(q) {
            var div = document.getElementById("cards");
            while(div.firstChild && div.removeChild(div.firstChild));
            $.getJSON({
                url: "https://api.spoonacular.com/recipes/complexSearch?apiKey=51637b3ea8954036841261473d938147&number=18&addRecipeInformation=true&addRecipeNutrition=true&query="+q, 
                success: function (res) {
                    // Set the contents of cards in card view
                    res.results.forEach((element) => {
                        var t = document.getElementById("cards");
                        var r = document.createElement('div');
                        r.className = "card";
                        r.innerHTML = `
                                                  <div class="column">
                                                  <img id="picture" src="${element.image}" style="width:100%">
                                                  <h4 id="titles">${element.title}</h4>
                                                  <p id ="info" class="title">${element.nutrition.nutrients[0].amount} kcal, ready in ${element.readyInMinutes}"</p>
                                                  <div style="margin: 24px 0;">
                                                    <a href="SearchIngredient.aspx?id=${element.id}" runat="server"><i class="fa fa-heart"></i></a> 
                                                  </div>
                                                  <p><button onclick="window.open('${element.spoonacularSourceUrl}','_blank')">View More</button></p>
                                                  </div>
                                            `
                        t.appendChild(r) 
                    });
                }
            });
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

.row {
  display: -ms-flexbox; 
  display: flex;
  -ms-flex-wrap: wrap; 
  flex-wrap: wrap;
  padding: 0 4px;
}

/* Create four equal columns that sits next to each other */

.column { 
  -ms-flex: 100%;
  flex: 100%;
  max-width: 100%;
  padding: 0 4px;
}


.column img {
  margin-top: 8px;
  vertical-align: middle;
  width: 100%;
}

/* Responsive layout - makes a two column-layout instead of four columns */
@media screen and (max-width: 800px) {
  .column {
    -ms-flex: 50%;
    flex: 50%;
    max-width: 50%;
  }
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column {
    -ms-flex: 100%;
    flex: 100%;
    max-width: 100%;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  background-color: whitesmoke;
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
}

.title {
  color: grey;
  font-size: 18px;
}

button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: black;
  background-color: #cad9db;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

a {
  text-decoration: none;
  font-size: 22px;
  color: #75969a;
}

a:hover {
  color: #ff9300;
}

button:hover, a:hover {
  opacity: 0.7;
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
    <section class="u-align-center u-clearfix u-gradient u-section-1" id="carousel_c072">
      <p class="u-text u-text-1">What do you want to cook?</p>
      <div class="u-form u-form-1">
        <form action="#" method="POST" class="u-clearfix u-form-horizontal u-form-spacing-15 u-inner-form" style="padding: 15px;" source="email">
          <div class="u-form-group u-form-name u-label-none">
            <label for="name-ef64" class="u-label">Name</label>
            <input id="search" type="text" placeholder="e.g. pasta" id="name-ef64" name="Title" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white u-input-1" required=""/>
          </div>
          <div class="u-form-group u-form-submit">
            <a href="#" class="u-btn u-btn-submit u-button-style">Search</a>
            <input onclick="getrecipe(document.getElementById('search').value)" id="btn" type="submit" value="submit" class="u-form-control-hidden" runat="server"/>
          </div>
        </form>
      </div>
      <div class="u-container-style u-expanded-width u-group u-palette-4-light-1 u-shape-rectangle u-group-1">
        <div class="u-container-layout u-container-layout-1">
            <div id="cards" class="row"> 
            </div>
        </div>
      </div>
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

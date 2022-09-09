<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewFavorites.aspx.cs" Inherits="Spoonacular.ViewFavorites" %>

<!DOCTYPE html>

<html style="font-size: 16px;" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Contact Us">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Favorites</title>
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
    <script>
        // Get information for each of the users favorite recipes
        function getfavorites() {
            $("#favoritesTable tbody tr").remove();
            var idstring = "<%= combinedString %>";
            const myarray = idstring.split(",");
            for (let i = 0; i < myarray.length; i++) {
                $.getJSON({
                    url: "https://api.spoonacular.com/recipes/" + myarray[i] + "/information?apiKey=daaf1b61d738414098c19be9e86af886", 
                    success: function (res) {
                        var t = document.getElementById("favoritesTable");
                        var r = document.createElement("TR");
                        r.innerHTML = `
                                                        <tr style="height: 55px;>
                                                        <th class="u-border-2 u-border-grey-30 u-first-column u-palette-2-base u-table-cell u-table-cell-7">${res.title}</th>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${res.readyInMinutes}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${res.servings}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell">${(res.pricePerServing / 100).toFixed(2)}</td>
                                                        <td class="u-border-2 u-border-grey-30 u-table-cell"><a href="${res.sourceUrl}" target="_blank">${res.sourceUrl}</a></td>
                                                    </tr>
                                            `
                        t.tBodies[0].appendChild(r)
                    }
                });
            }
        }
        window.onload = getfavorites;

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
          <br /><br />
         <h2 class="u-text u-text-default u-text-2">Showing your favorite recipes</h2>
          <!-- First table -->
        <div class="u-expanded-width u-table u-table-responsive u-table-1">
          <table id="favoritesTable" class="u-table-entity u-table-entity-1">
            <colgroup>
              <col width="15%">
              <col width="15%">
              <col width="15%">
              <col width="15%">
              <col width="15%">
            </colgroup>
            <thead class="u-align-center u-custom-font u-grey-60 u-heading-font u-table-header u-table-header-1">
              <tr style="height: 96px;">
                <th class="u-table-cell">Title</th>
                <th class="u-table-cell">Ready in Minutes</th>
                <th class="u-table-cell">Servings</th>
                <th class="u-table-cell">Price per Serving</th>
                <th class="u-table-cell">Link</th>
              </tr>
            </thead>
            <tbody class="u-table-alt-palette-4-light-1 u-table-body">
            </tbody>
          </table>
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

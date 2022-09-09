<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchMap.aspx.cs" Inherits="Spoonacular.SearchMap" %>

<!DOCTYPE html>

<html style="font-size: 16px;" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Contact Us">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Search by Cuisines</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
    <link rel="stylesheet" href="SearchMap.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <link id="uthemegooglefont" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    <meta name="theme-color" content="#ec8700">
    <meta property="og:title" content="ContactUs">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
    <script>
        $(function () {
          $(document).scroll(function () {
            var $nav = $(".navbar-fixed-top");
            $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
          });
        });
    </script>
    <style>
            @import 'https://fonts.googleapis.com/css?family=Lato';

            body {
                font-family: Lato;
                font-size: 15px;
            }

            * {
                -webkit-box-sizing: border-box;
                    -moz-box-sizing: border-box;
                        box-sizing: border-box;
            }

            h1 {
                font-size: 1.5em;
                font-weight: 400;
                text-align: center;
            }

            #chartdiv {
                max-width: 1100px;
                height: 400px;
                border: 1px solid #ddd;
                margin: 0 auto;
            }

            #info {
                max-width: 1100px;
                border: 1px solid #ddd;
                margin: 10px auto;
                padding: 5px 8px;
            }

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
    <section class="u-clearfix u-palette-4-light-1 u-section-1" id="sec-5071">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-clearfix u-expanded-width u-gutter-0 u-layout-wrap u-layout-wrap-1">
          <div class="u-layout" style="">
            <div class="u-layout-row" style="">
              <div class="u-align-center u-container-style u-layout-cell u-left-cell u-size-28 u-size-xs-60 u-white u-layout-cell-1" src="" data-animation-name="customAnimationIn" data-animation-duration="1000" data-animation-direction="">
                <div class="u-container-layout u-container-layout-1">
                  <h2 class="u-align-left u-text u-text-default u-text-1"> Food Around the <span class="u-text-palette-1-light-1">World Map</span> with Recipes to Explore
                  </h2>
                  <p class="u-align-left u-text u-text-2"> From Asian cuisine to American dishes, the maps offer an in-depth look at various cuisines from all around the globe. It showcases not only the age-old classics known to all but smaller and less-known delicacies from countries that aren’t in the spotlight (yet might have hidden gems).<br>
                    <br>Scroll down below to explore the world atlas of taste and see what it has to offer or try navigating their food map yourself here.
                  </p>
                  <h2 class="u-align-left u-subtitle u-text u-text-default u-text-palette-4-dark-1 u-text-3">Click on the countries you want to select, using the map below.</h2>
                </div>
              </div>
              <div class="u-align-center u-container-style u-image u-image-default u-layout-cell u-right-cell u-size-32 u-size-xs-60 u-image-1" src="" data-image-width="1920" data-image-height="1080">
                <div class="u-border-5 u-border-palette-2-light-1 u-container-layout u-valign-middle u-container-layout-2" src=""></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <script src="https://www.amcharts.com/lib/3/ammap.js"></script>
        <script src="https://www.amcharts.com/lib/3/maps/js/worldLow.js"></script>
        <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
        <br><br>
        <div style="background-color:whitesmoke" id="chartdiv"></div>
        <div style="background-color:whitesmoke" id="info">Seletced countries: <span id="selected" runat="server">-</span></div>
        <script>
            function ChangeDiv() {
                var div = document.getElementById("selected");
                var hdn = document.getElementById("hdnText");
                hdn.value = div.innerHTML;
            }
            /**
            * Create the map
            */
            var map = AmCharts.makeChart("chartdiv", {
                "type": "map",
                "theme": "light",
                "projection": "eckert3",
                "dataProvider": {
                "map": "worldLow",
                "getAreasFromMap": true
                },
                "areasSettings": {
                "selectedColor": "#CC0000",
                "selectable": true
                },
                /**
                * Add click event to track country selection/unselection
                */
                "listeners": [{
                    "event": "clickMapObject",
                    "method": function(e) {
      
                      // Ignore any click not on area
                      if (e.mapObject.objectType !== "MapArea")
                        return;
      
                      var area = e.mapObject;
      
                      // Toggle showAsSelected
                      area.showAsSelected = !area.showAsSelected;
                      e.chart.returnInitialColor(area);
      
                      // Update the list
                      document.getElementById("selected").innerHTML = JSON.stringify(getSelectedCountries());
                    }
                }]
            });

            /**
            * Function which extracts currently selected country list.
            * Returns array consisting of country ISO2 codes
            */
            function getSelectedCountries() {
                var selected = [];
                for(var i = 0; i < map.dataProvider.areas.length; i++) {
                if(map.dataProvider.areas[i].showAsSelected)
                    selected.push(map.dataProvider.areas[i].id);
                }
                return selected;
            }
        </script>
        <form runat="server">
            <asp:HiddenField ID="hdnText" runat="server" ClientIDMode="Static" />
            <center><b><asp:Button runat="server" id="btnLogin" class="u-active-palette-4-light-1 u-btn u-btn-round u-button-style u-hover-palette-4-light-1 u-palette-4-base u-radius-50 u-btn-1" Text="ENTER" OnClick="GetCuisines" OnClientClick="ChangeDiv()" /></b></center>
            <asp:HiddenField ID="HiddenField1" runat="server" />
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

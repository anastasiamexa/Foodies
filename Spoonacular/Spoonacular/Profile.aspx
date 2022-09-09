<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Spoonacular.Profile" %>

<!DOCTYPE html>

<html style="font-size: 16px;" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta charset="utf-8"/>
    <meta name="keywords" content="Contact Us"/>
    <meta name="description" content=""/>
    <meta name="page_type" content="np-template-header-footer-from-plugin"/>
    <title>Profile</title>
    <link rel="stylesheet" href="nicepage.css" media="screen"/>
<link rel="stylesheet" href="Profile.css" media="screen"/>
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <link id="uthemegooglefont" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i"/>
    <link id="upagegooglefont" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|PT+Sans+Caption:400,700|Allerta:400"/>
    <meta name="theme-color" content="#ec8700"/>
    <meta property="og:title" content="ContactUs"/>
    <meta property="og:description" content=""/>
    <meta property="og:type" content="website"/>
    <script>
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
    <section class="u-align-center u-clearfix u-image u-section-1" id="carousel_a9fc" data-image-width="1980" data-image-height="1320">
      <div class="u-clearfix u-sheet u-valign-bottom-sm u-valign-bottom-xs u-sheet-1">
        <h2 class="u-text u-text-1" data-animation-name="customAnimationIn" data-animation-duration="1000">Profile</h2>
        <div class="u-clearfix u-expanded-width u-layout-wrap u-layout-wrap-1">
          <div class="u-gutter-0 u-layout">
            <div class="u-layout-row">
              <div class="u-align-center u-container-style u-layout-cell u-palette-2-base u-size-22 u-layout-cell-1" data-animation-name="customAnimationIn" data-animation-duration="1000">
                <div class="u-container-layout u-container-layout-1">
                  <div class="u-image u-image-circle u-preserve-proportions u-image-1"  data-image-width="490" data-image-height="490"></div>
                  <h3 id="hello" class="u-align-center u-custom-font u-text u-text-2" runat="server"> Hello, username</h3>
                  <h4 class="u-align-left u-custom-font u-text u-text-3">Name:</h4>
                  <h4 id="name" class="u-align-left u-custom-font u-text u-text-4" runat="server">Username Username</h4>
                  <h4 class="u-align-left u-custom-font u-text u-text-5">E-mail:</h4>
                  <h4 id="email" class="u-align-left u-custom-font u-text u-text-6" runat="server">email</h4><br /><br />
                    <form runat="server"><center><asp:Button class="u-active-white u-border-active-palette-2-base u-border-hover-palette-2-base u-border-none u-btn u-btn-round u-button-style u-hover-palette-4-base u-palette-2-base u-radius-50 u-text-active-white u-text-black u-text-hover-white" ID="LogoutBtn" Text="LOGOUT" onClick="Logout" runat="server"/></center></form>
                </div>
              </div>
              <div class="u-align-center u-container-style u-layout-cell u-size-38 u-layout-cell-2" data-animation-name="customAnimationIn" data-animation-duration="1000">
                <div class="u-container-layout u-container-layout-2">
                  <h4 class="u-custom-font u-text u-text-7">View your favorite recipes or your meal plans.</h4>
                  <a href="ViewFavorites.aspx" class="u-active-white u-border-active-palette-2-base u-border-hover-palette-2-base u-border-none u-btn u-btn-round u-button-style u-hover-palette-4-base u-palette-2-base u-radius-50 u-text-active-white u-text-black u-text-hover-white u-btn-1">VIEW FAVORITE RECIPES</a>
                  <a href="ViewMeals.aspx" class="u-active-white u-border-active-palette-2-base u-border-hover-palette-2-base u-border-none u-btn u-btn-round u-button-style u-hover-palette-4-base u-palette-2-base u-radius-50 u-text-active-white u-text-black u-text-hover-white u-btn-2">VIEW MEAL PLANS</a>
                </div>
              </div>
            </div>
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

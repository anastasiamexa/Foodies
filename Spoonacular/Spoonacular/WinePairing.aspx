<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WinePairing.aspx.cs" Inherits="Spoonacular.WinePairing" %>

<!DOCTYPE html>

<html style="font-size: 16px;" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Contact Us">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Wine Pairing</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
    <link rel="stylesheet" href="Wines.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <link id="uthemegooglefont" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    <meta name="theme-color" content="#ec8700">
    <meta property="og:title" content="ContactUs">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script>
        // Get recommended wine
        function getwine(q){
            $.getJSON({
                url:"https://api.spoonacular.com/food/wine/pairing?apiKey=a94520b4cba649cab8ce0dcf4abfa3f6&food="+q,
                success: function (res) {
                    document.getElementById("foodresult").innerHTML = res.pairingText
                }
            });
        }

        // Get recommended food
        function getfood(q){
            $.getJSON({
                url:"https://api.spoonacular.com/food/wine/dishes?apiKey=a94520b4cba649cab8ce0dcf4abfa3f6&wine="+q,
                success: function (res) {
                    document.getElementById("wineresult").innerHTML = res.text
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
    <section class="u-align-center-lg u-align-center-md u-align-center-xl u-align-left-sm u-align-left-xs u-clearfix u-palette-4-light-3 u-section-1" data-image-width="2000" data-image-height="1333" id="sec-9285">
      <div class="u-container-style u-expanded-width u-group u-white u-group-1">
        <div class="u-container-layout u-container-layout-1">
          <h2 class="u-text u-text-default u-text-1" data-animation-name="customAnimationIn" data-animation-duration="1000">Wine Pairing</h2>
          <p class="u-align-center u-text u-text-2" data-animation-name="customAnimationIn" data-animation-duration="1000"> Wine pairing is not only about matching food and wine solely for their excellence, but also to maximize the value that each component brings to the whole experience.</p>
        </div>
      </div>
      <div class="u-clearfix u-gutter-10 u-layout-wrap u-palette-4-light-3 u-layout-wrap-1">
        <div class="u-gutter-0 u-layout">
          <div class="u-layout-row">
            <div class="u-size-20 u-size-30-md">
              <div class="u-layout-col">
                <div class="u-align-left u-container-style u-layout-cell u-left-cell u-size-30 u-layout-cell-1" data-animation-name="customAnimationIn" data-animation-duration="1000" data-animation-direction="">
                  <div class="u-container-layout u-container-layout-2">
                    <h3 class="u-text u-text-default u-text-3">Search an ingredient, food or cuisine</h3>
                    <div class="u-form u-form-1">
                      <form action="#" method="POST" class="u-clearfix u-form-horizontal u-form-spacing-15 u-inner-form" style="padding: 15px;" source="email">
                        <div class="u-form-group u-form-name u-label-none">
                          <label for="name-ef64" class="u-label">Food</label>
                          <input type="text" placeholder="e.g. steak" id="searchfood" name="name" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white u-input-1" required="">
                        </div>
                        <div class="u-form-group u-form-submit">
                          <a href="#" class="u-btn u-btn-submit u-button-style">Search</a>
                          <input onclick="getwine(document.getElementById('searchfood').value)" type="submit" value="submit" class="u-form-control-hidden">
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
                <div class="u-align-left u-container-style u-layout-cell u-left-cell u-size-30 u-layout-cell-2">
                  <div class="u-container-layout u-container-layout-3">
                    <p id="foodresult" class="u-text u-text-4"></p>
                  </div>
                </div>
              </div>
            </div>
            <div class="u-size-20 u-size-30-md">
              <div class="u-layout-row">
                <div class="u-align-left u-container-style u-image u-layout-cell u-size-60 u-image-1" src="" data-image-width="150" data-image-height="98">
                  <div class="u-container-layout u-valign-top u-container-layout-4" src=""></div>
                </div>
              </div>
            </div>
            <div class="u-size-20 u-size-60-md">
              <div class="u-layout-col">
                <div class="u-align-left u-container-style u-layout-cell u-right-cell u-size-30 u-layout-cell-4" data-animation-name="customAnimationIn" data-animation-duration="1000">
                  <div class="u-container-layout u-container-layout-5">
                    <h3 class="u-text u-text-default u-text-5">Search the type of wine</h3>
                    <div class="u-form u-form-2">
                      <form action="#" method="POST" class="u-clearfix u-form-horizontal u-form-spacing-15 u-inner-form" style="padding: 15px;" source="email">
                        <div class="u-form-group u-form-name u-label-none">
                          <label for="name-ef64" class="u-label">Wine</label>
                          <input type="text" placeholder="e.g. merlot" id="searchwine" name="name" class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white u-input-2" required="">
                        </div>
                        <div class="u-form-group u-form-submit">
                          <a href="#" class="u-btn u-btn-submit u-button-style"> Search</a>
                          <input onclick="getfood(document.getElementById('searchwine').value)" type="submit" value="submit" class="u-form-control-hidden">
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
                <div class="u-align-left u-container-style u-layout-cell u-right-cell u-size-30 u-layout-cell-5">
                  <div class="u-container-layout u-container-layout-6">
                    <p id="wineresult" class="u-text u-text-6"></p>
                  </div>
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

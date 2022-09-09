<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="Spoonacular.Recipes" %>

<!DOCTYPE html>

<html style="font-size: 16px;" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Contact Us">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Recipes</title>
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
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script>
        // Get random recipes to show in the slide show
        function gettoday(){
            $.getJSON({
                url:"https://api.spoonacular.com/recipes/random?limitLicense=true&number=6&apiKey=a94520b4cba649cab8ce0dcf4abfa3f6",
                success: function (res) {
                    document.getElementById('image1').src = res.recipes[0].image;
                    document.getElementById('image2').src = res.recipes[1].image;
                    document.getElementById('image3').src = res.recipes[2].image;
                    document.getElementById('image4').src = res.recipes[3].image;
                    document.getElementById('image5').src = res.recipes[4].image;
                    document.getElementById('image6').src = res.recipes[5].image;
                }
            });
        }
        // Call function on page load
        window.onload = gettoday;

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
<body class="u-body u-xl-mode">
    <header class="u-clearfix u-header u-sticky u-sticky-fe8d u-header navbar-fixed-top" id="sec-3d90"><div class="u-clearfix u-sheet u-sheet-1">
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
    <section class="u-align-center u-clearfix u-section-2" id="carousel_0567">
      <div class="u-expanded-width u-palette-4-light-1 u-shape u-shape-rectangle u-shape-1"></div>
      <div class="u-clearfix u-gutter-50 u-layout-wrap u-layout-wrap-1">
        <div class="u-layout">
          <div class="u-layout-row">
            <div class="u-size-30 u-size-60-md">
              <div class="u-layout-col">
                <div class="u-container-style u-hover-feature u-layout-cell u-left-cell u-radius-25 u-shape-round u-size-40 u-white u-layout-cell-1">
                  <div class="u-container-layout u-container-layout-1">
                    <div class="u-image u-image-circle u-image-1" data-image-width="667" data-image-height="1000"></div>
                    <p class="u-text u-text-1">Search by ingredients</p>
                    <p class="u-text u-text-2"> Just enter ingredients into our recipe search engine and we'll instantly return a list of tasty recipes for you to enjoy.</p>
                    <a href="SearchIngredient.aspx" class="u-active-black u-align-center u-border-none u-btn u-btn-round u-button-style u-hover-black u-palette-4-dark-1 u-radius-50 u-text-active-white u-text-hover-white u-btn-1">Search</a>
                  </div>
                </div>
                <div class="u-container-style u-layout-cell u-left-cell u-size-20 u-layout-cell-2">
                  <div class="u-container-layout u-container-layout-2"></div>
                </div>
              </div>
            </div>
            <div class="u-size-30 u-size-60-md">
              <div class="u-layout-col">
                <div class="u-container-style u-layout-cell u-palette-4-light-1 u-right-cell u-size-20 u-layout-cell-3">
                  <div class="u-container-layout u-container-layout-3">
                    <h2 class="u-custom-font u-font-raleway u-text u-text-palette-1-base u-text-3">Looking for a recipe?</h2>
                    <p class="u-text u-text-4">You can search for recipes either by ingredients or by cuisines.</p>
                  </div>
                </div>
                <div class="u-container-style u-hover-feature u-layout-cell u-radius-25 u-right-cell u-shape-round u-size-40 u-white u-layout-cell-4">
                  <div class="u-container-layout u-container-layout-4">
                    <div class="u-border-7 u-border-palette-1-base u-image u-image-circle u-image-2" data-image-width="603" data-image-height="1178"></div>
                    <p class="u-text u-text-5">Search by cuisines</p>
                    <p class="u-text u-text-6"> Browse our recipes by world cuisine and find the perfect recipe to satisfy your craving.<br>
                    </p>
                    <a href="SearchMap.aspx" class="u-active-black u-align-center u-border-none u-btn u-btn-round u-button-style u-hover-black u-palette-4-dark-1 u-radius-50 u-text-active-white u-text-hover-white u-btn-2">SEARCH</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-image u-section-3" id="carousel_d371" data-image-width="1980" data-image-height="1214">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <h2 class="u-custom-font u-font-raleway u-text u-text-1">Gallery</h2>
        <h5 class="u-custom-font u-font-montserrat u-text u-text-2">Take a look to be inspired.</h5>
        <div id="carousel-8627" data-interval="5000" data-u-ride="carousel" class="u-carousel u-expanded-width u-slider u-slider-1">
          <ol class="u-absolute-hcenter u-carousel-indicators u-carousel-indicators-1">
            <li data-u-target="#carousel-8627" class="u-active u-active-palette-2-base u-palette-5-dark-2 u-shape-circle" data-u-slide-to="0" style="width: 10px; height: 10px;"></li>
            <li data-u-target="#carousel-8627" class="u-active-palette-2-base u-palette-5-dark-2 u-shape-circle" data-u-slide-to="1" style="width: 10px; height: 10px;"></li>
          </ol>
          <div class="u-carousel-inner" role="listbox">
            <div class="u-active u-align-center u-carousel-item u-container-style u-slide">
              <div class="u-container-layout u-container-layout-1">
                <div class="u-gallery u-layout-grid u-lightbox u-no-transition u-show-text-on-hover u-gallery-1">
                  <div class="u-gallery-inner u-gallery-inner-1">
                    <div class="u-effect-fade u-gallery-item">
                      <div class="u-back-slide" data-image-width="1000" data-image-height="1500">
                        <img id="image1" class=" u-expanded" src="">
                      </div>
                      <div class="u-over-slide u-shading u-over-slide-1">
                        <h3 class="u-gallery-heading"></h3>
                        <p class="u-gallery-text"></p>
                      </div>
                    </div>
                    <div class="u-effect-fade u-gallery-item">
                      <div class="u-back-slide" data-image-width="500" data-image-height="750">
                        <img id="image2" class=" u-expanded" src="">
                      </div>
                      <div class="u-over-slide u-shading u-over-slide-2">
                        <h3 class="u-gallery-heading"></h3>
                        <p class="u-gallery-text"></p>
                      </div>
                    </div>
                    <div class="u-effect-fade u-gallery-item">
                      <div class="u-back-slide" data-image-width="600" data-image-height="750">
                        <img id="image3" class=" u-expanded" src="">
                      </div>
                      <div class="u-over-slide u-shading u-over-slide-3">
                        <h3 class="u-gallery-heading"></h3>
                        <p class="u-gallery-text"></p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="u-carousel-item u-container-style u-expanded-width u-slide">
              <div class="u-container-layout u-container-layout-2">
                <div class="u-gallery u-layout-grid u-lightbox u-no-transition u-show-text-on-hover u-gallery-2">
                  <div class="u-gallery-inner u-gallery-inner-2">
                    <div class="u-effect-fade u-gallery-item">
                      <div class="u-back-slide" data-image-width="720" data-image-height="1080">
                        <img id="image4" class="u-back-image u-expanded" src="">
                      </div>
                      <div class="u-over-slide u-shading u-over-slide-4">
                        <h3 class="u-gallery-heading"></h3>
                        <p class="u-gallery-text"></p>
                      </div>
                    </div>
                    <div class="u-effect-fade u-gallery-item">
                      <div class="u-back-slide" data-image-width="500" data-image-height="750">
                        <img id="image5" class="u-back-image u-expanded" src="">
                      </div>
                      <div class="u-over-slide u-shading u-over-slide-5">
                        <h3 class="u-gallery-heading"></h3>
                        <p class="u-gallery-text"></p>
                      </div>
                    </div>
                    <div class="u-effect-fade u-gallery-item">
                      <div class="u-back-slide" data-image-width="720" data-image-height="1080">
                        <img id="image6" class="u-back-image u-expanded u-back-image-6" src="">
                      </div>
                      <div class="u-over-slide u-shading u-over-slide-6">
                        <h3 class="u-gallery-heading"></h3>
                        <p class="u-gallery-text"></p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <a class="u-carousel-control u-carousel-control-prev u-hover-palette-1-base u-icon-circle u-palette-2-base u-spacing-10 u-text-body-alt-color u-carousel-control-1" href="#carousel-8627" role="button" data-u-slide="prev">
            <span aria-hidden="true">
              <svg viewBox="0 0 477.175 477.175"><path d="M145.188,238.575l215.5-215.5c5.3-5.3,5.3-13.8,0-19.1s-13.8-5.3-19.1,0l-225.1,225.1c-5.3,5.3-5.3,13.8,0,19.1l225.1,225
                    c2.6,2.6,6.1,4,9.5,4s6.9-1.3,9.5-4c5.3-5.3,5.3-13.8,0-19.1L145.188,238.575z"></path></svg>
            </span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="u-carousel-control u-carousel-control-next u-hover-palette-1-base u-icon-circle u-palette-2-base u-spacing-10 u-text-body-alt-color u-carousel-control-2" href="#carousel-8627" role="button" data-u-slide="next">
            <span aria-hidden="true">
              <svg viewBox="0 0 477.175 477.175"><path d="M360.731,229.075l-225.1-225.1c-5.3-5.3-13.8-5.3-19.1,0s-5.3,13.8,0,19.1l215.5,215.5l-215.5,215.5
                    c-5.3,5.3-5.3,13.8,0,19.1c2.6,2.6,6.1,4,9.5,4c3.4,0,6.9-1.3,9.5-4l225.1-225.1C365.931,242.875,365.931,234.275,360.731,229.075z"></path></svg>
            </span>
            <span class="sr-only">Next</span>
          </a>
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

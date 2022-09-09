<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Spoonacular.index" %>

<!DOCTYPE html>

<html style="font-size: 16px;" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Home page</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
    <link rel="stylesheet" href="Page-1.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <link id="uthemegooglefont" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    <link id="upagegooglefont" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700|Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Roboto+Condensed:300,300i,400,400i,700,700i">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script>
        // Get random trivia
        function gettrivia(){
            $.getJSON({
                url:"https://api.spoonacular.com/food/trivia/random?apiKey=a94520b4cba649cab8ce0dcf4abfa3f6",
                success: function (res) {
                    // Change the HTML text to the resulted text
                    document.getElementById("trivia").innerHTML = res.text
                }
            });
        }
        window.onload = gettrivia;

        $(function () {
          $(document).scroll(function () {
            var $nav = $(".navbar-fixed-top");
            $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
          });
        });
    </script>
    <meta name="theme-color" content="#ec8700">
    <meta property="og:title" content="Home page">
    <meta property="og:description" content="">
    <meta property="og:type" content="website">
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
    <section class="u-clearfix u-palette-4-light-2 u-section-1" id="sec-2b03">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-border-15 u-border-palette-4-light-1 u-image u-image-circle u-preserve-proportions u-image-1" data-image-width="150" data-image-height="100" data-animation-name="customAnimationIn" data-animation-duration="1500" data-animation-delay="0"></div>
        <div class="u-border-20 u-border-palette-4-light-3 u-image u-image-circle u-image-2" data-image-width="1412" data-image-height="1000" data-animation-name="customAnimationIn" data-animation-duration="750" data-animation-delay="500"></div>
        <div class="u-image u-image-circle u-image-3" data-image-width="100" data-image-height="150" data-animation-name="customAnimationIn" data-animation-duration="750" data-animation-delay="250"></div>
        <div class="u-shape u-shape-svg u-text-palette-4-base u-shape-1" data-animation-name="customAnimationIn" data-animation-duration="1250" data-animation-delay="500">
          <svg class="u-svg-link" preserveAspectRatio="none" viewBox="0 0 160 160" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-525f"></use></svg>
          <svg class="u-svg-content" viewBox="0 0 160 160" x="0px" y="0px" id="svg-525f" style="enable-background:new 0 0 160 160;"><path d="M80,30c27.6,0,50,22.4,50,50s-22.4,50-50,50s-50-22.4-50-50S52.4,30,80,30 M80,0C35.8,0,0,35.8,0,80s35.8,80,80,80
	s80-35.8,80-80S124.2,0,80,0L80,0z"></path></svg>
        </div>
        <div class="u-shape u-shape-svg u-text-palette-4-dark-1 u-shape-2" data-animation-name="customAnimationIn" data-animation-duration="750" data-animation-delay="500">
          <svg class="u-svg-link" preserveAspectRatio="none" viewBox="0 0 160 160" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1186"></use></svg>
          <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xml:space="preserve" class="u-svg-content" viewBox="0 0 160 160" x="0px" y="0px" id="svg-1186" style="enable-background:new 0 0 160 160;"><path d="M80,30c27.6,0,50,22.4,50,50s-22.4,50-50,50s-50-22.4-50-50S52.4,30,80,30 M80,0C35.8,0,0,35.8,0,80s35.8,80,80,80
	s80-35.8,80-80S124.2,0,80,0L80,0z"></path></svg>
        </div>
        <div class="u-align-left u-container-style u-group u-shape-rectangle u-group-1" data-animation-name="customAnimationIn" data-animation-duration="1500" data-animation-delay="750">
          <div class="u-container-layout u-valign-bottom u-container-layout-1">
            <h2 class="u-custom-font u-font-oswald u-text u-text-palette-4-dark-1 u-text-1">The only recipe and meal planning app you will ever need</h2>
            <h5 class="u-text u-text-2">Create your account now to get full access to our services.</h5>
            <a href="Signup.aspx" class="u-active-palette-4-light-1 u-btn u-btn-round u-button-style u-hover-palette-4-light-1 u-palette-4-base u-radius-50 u-btn-1">SIGN UP</a>
          </div>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-palette-4-base u-section-2" id="carousel_3fef">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h3 class="u-text u-text-palette-4-light-3 u-text-1"> We provide a variety of recipes matching your appetite</h3>
        <div class="u-expanded-width u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-container-style u-list-item u-radius-25 u-repeater-item u-shape-round u-video-cover u-white u-list-item-1">
              <div class="u-container-layout u-similar-container u-container-layout-1"><span class="u-icon u-icon-circle u-palette-4-light-2 u-spacing-25 u-text-palette-4-base u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 52.966 52.966" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-557d"></use></svg><svg class="u-svg-content" viewBox="0 0 52.966 52.966" x="0px" y="0px" id="svg-557d" style="enable-background:new 0 0 52.966 52.966;"><path d="M51.704,51.273L36.845,35.82c3.79-3.801,6.138-9.041,6.138-14.82c0-11.58-9.42-21-21-21s-21,9.42-21,21s9.42,21,21,21
	c5.083,0,9.748-1.817,13.384-4.832l14.895,15.491c0.196,0.205,0.458,0.307,0.721,0.307c0.25,0,0.499-0.093,0.693-0.279
	C52.074,52.304,52.086,51.671,51.704,51.273z M21.983,40c-10.477,0-19-8.523-19-19s8.523-19,19-19s19,8.523,19,19
	S32.459,40,21.983,40z"></path></svg></span>
                <h4 class="u-align-center u-text u-text-default u-text-palette-4-base u-text-2">Search</h4>
                <p class="u-align-center u-text u-text-3">Browse through thousands of recipes based on your preferences and choose the one that suits you best.</p>
              </div>
            </div>
            <div class="u-align-center u-container-style u-list-item u-radius-25 u-repeater-item u-shape-round u-video-cover u-white u-list-item-2">
              <div class="u-container-layout u-similar-container u-container-layout-2"><span class="u-icon u-icon-circle u-palette-4-light-2 u-spacing-25 u-text-palette-4-base u-icon-2"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 60 60" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-3d86"></use></svg><svg class="u-svg-content" viewBox="0 0 60 60" x="0px" y="0px" id="svg-3d86" style="enable-background:new 0 0 60 60;"><g><path d="M57,4h-7V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H19V1c0-0.553-0.447-1-1-1h-7c-0.553,0-1,0.447-1,1v3H3
		C2.447,4,2,4.447,2,5v11v43c0,0.553,0.447,1,1,1h54c0.553,0,1-0.447,1-1V16V5C58,4.447,57.553,4,57,4z M43,2h5v3v3h-5V5V2z M12,2h5
		v3v3h-5V5V2z M4,6h6v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h22v3c0,0.553,0.447,1,1,1h7c0.553,0,1-0.447,1-1V6h6v9H4V6z
		 M4,58V17h52v41H4z"></path><path d="M38,23h-7h-2h-7h-2h-9v9v2v7v2v9h9h2h7h2h7h2h9v-9v-2v-7v-2v-9h-9H38z M31,25h7v7h-7V25z M38,41h-7v-7h7V41z M22,34h7v7h-7
		V34z M22,25h7v7h-7V25z M13,25h7v7h-7V25z M13,34h7v7h-7V34z M20,50h-7v-7h7V50z M29,50h-7v-7h7V50z M38,50h-7v-7h7V50z M47,50h-7
		v-7h7V50z M47,41h-7v-7h7V41z M47,25v7h-7v-7H47z"></path>
</g></svg></span>
                <h4 class="u-align-center u-text u-text-default u-text-palette-4-base u-text-4"> Meal plan</h4>
                <p class="u-align-center u-text u-text-5">Plan your daily or weekly meals. ​Using meal plans is a great way to save money and cook healthier.<br>
                  <span class="u-text-grey-25">Members only</span>
                </p>
              </div>
            </div>
            <div class="u-align-center u-container-style u-list-item u-radius-25 u-repeater-item u-shape-round u-video-cover u-white u-list-item-3">
              <div class="u-container-layout u-similar-container u-container-layout-3"><span class="u-icon u-icon-circle u-palette-4-light-2 u-spacing-25 u-text-palette-4-base u-icon-3"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 51.997 51.997" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-4342"></use></svg><svg class="u-svg-content" viewBox="0 0 51.997 51.997" x="0px" y="0px" id="svg-4342" style="enable-background:new 0 0 51.997 51.997;"><g><path d="M51.911,16.242C51.152,7.888,45.239,1.827,37.839,1.827c-4.93,0-9.444,2.653-11.984,6.905
		c-2.517-4.307-6.846-6.906-11.697-6.906c-7.399,0-13.313,6.061-14.071,14.415c-0.06,0.369-0.306,2.311,0.442,5.478
		c1.078,4.568,3.568,8.723,7.199,12.013l18.115,16.439l18.426-16.438c3.631-3.291,6.121-7.445,7.199-12.014
		C52.216,18.553,51.97,16.611,51.911,16.242z M49.521,21.261c-0.984,4.172-3.265,7.973-6.59,10.985L25.855,47.481L9.072,32.25
		c-3.331-3.018-5.611-6.818-6.596-10.99c-0.708-2.997-0.417-4.69-0.416-4.701l0.015-0.101C2.725,9.139,7.806,3.826,14.158,3.826
		c4.687,0,8.813,2.88,10.771,7.515l0.921,2.183l0.921-2.183c1.927-4.564,6.271-7.514,11.069-7.514
		c6.351,0,11.433,5.313,12.096,12.727C49.938,16.57,50.229,18.264,49.521,21.261z"></path><path d="M15.999,7.904c-5.514,0-10,4.486-10,10c0,0.553,0.447,1,1,1s1-0.447,1-1c0-4.411,3.589-8,8-8c0.553,0,1-0.447,1-1
		S16.551,7.904,15.999,7.904z"></path>
</g></svg></span>
                <h4 class="u-align-center u-text u-text-default u-text-palette-4-base u-text-6">Favorites</h4>
                <p class="u-align-center u-text u-text-7">Are you craving a recipe more than others? Add it to your favorites for easy access.<br>
                  <span class="u-text-grey-25">Members only</span>
                  <br>
                </p>
              </div>
            </div>
            <div class="u-align-center u-container-style u-list-item u-radius-25 u-repeater-item u-shape-round u-video-cover u-white u-list-item-4">
              <div class="u-container-layout u-similar-container u-container-layout-4"><span class="u-file-icon u-icon u-icon-circle u-palette-4-light-2 u-spacing-25 u-text-palette-4-base u-icon-4"><img src="images/1.png" alt=""></span>
                <h4 class="u-align-center u-text u-text-default u-text-palette-4-base u-text-8">Wine pairing</h4>
                <p class="u-align-center u-text u-text-9">Need a wine recommendation? We know which wine is best suited for your meal.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-clearfix u-section-3" id="sec-65ae">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-clearfix u-layout-wrap u-layout-wrap-1">
          <div class="u-layout">
            <div class="u-layout-row">
              <div class="u-align-left u-container-style u-layout-cell u-size-19 u-layout-cell-1">
                <div class="u-container-layout u-valign-middle u-container-layout-1">
                  <h3 class="u-custom-font u-font-montserrat u-text u-text-palette-4-base u-text-1" data-animation-name="counter" data-animation-event="scroll" data-animation-duration="3000">5000+</h3>
                </div>
              </div>
              <div class="u-container-style u-layout-cell u-size-41 u-layout-cell-2">
                <div class="u-container-layout u-container-layout-2">
                  <h2 class="u-custom-font u-font-montserrat u-text u-text-palette-4-base u-text-2">There are more than 5000 recipes to choose from. ​Get a taste for another culture through its cuisine.</h2>
                </div>
              </div>
            </div>
          </div>
        </div>
        <p class="u-text u-text-grey-50 u-text-3"> African cuisine is a mix of ingredients such as cereal grains, vegetables, meat products, and locally available fruits.&nbsp;The traditional preparation features mostly milk, curd, and whey products in some parts of the continent.&nbsp;If you’re looking for a food adventure, then let’s try to explore more about this cuisine and find out why more people are interested to try it.</p>
        <h4 class="u-text u-text-default u-text-palette-4-light-1 u-text-4">African</h4>
        <p class="u-text u-text-grey-50 u-text-5"> Latin America is a highly diverse area of land whose nations have varying cuisines. Some items typical of Latin American cuisine include maize-based dishes arepas, pupusas, tacos, tamales, tortillas and various salsas and other condiments (guacamole, pico de gallo, mole, chimichurri, chili, aji, pebre).</p>
        <h4 class="u-text u-text-default u-text-palette-4-light-1 u-text-6"> Latin&nbsp;<br>American
        </h4>
        <p class="u-text u-text-grey-50 u-text-7"> The Caribbean food has a distinct flavor and rich history. To decode its secrets, one must first give a respectful nod to the presence of its most vital ingredients:&nbsp;​r<b>
            <span style="font-weight: 400;">ice</span>
            <span style="font-weight: 400;">, plantains</span>
            <span style="font-weight: 400;">, beans, cassava, cilantro (coriander), bell peppers, chickpeas, tomatoes, sweet potatoes, and coconut</span></b>&nbsp;among others.
        </p>
        <h4 class="u-text u-text-default u-text-palette-4-light-1 u-text-8"> Caribbean</h4>
        <p class="u-text u-text-grey-50 u-text-9">While Middle Eastern food encompasses a variety of cuisines, it’s generally characterized by fragrant and copious spices, nuts, olive oil, and creamy elements. Mutton, lamb, and goat are traditional meats. Chicken, camel, beef, fish, and pork are also used, but less frequently.</p>
        <h4 class="u-text u-text-default u-text-palette-4-light-1 u-text-10"> Middle<br>Eastern
        </h4>
        <p class="u-text u-text-grey-50 u-text-11"> Traditional Scandinavian cuisine features a variety of simple, yet classic flavor profiles which when combined, produce hearty and satisfying meals. One highly recognizable characteristic of Scandinavian food is their&nbsp;p<b>
            <span style="font-weight: 400;">reference</span>
            <span style="font-weight: 400;">for cooking methods such as preserving, drying, smoking, salting and pickling.</span></b>
        </p>
        <h4 class="u-text u-text-default u-text-palette-4-light-1 u-text-12"> Nordic</h4>
        <p class="u-text u-text-grey-50 u-text-13"> Each cuisine involves food preparation in a particular style, of food and drink of particular types, to produce individually consumed items or distinct meals.​ A cuisine is primarily influenced by the ingredients that are available locally or through trade. Some of the most popular cuisines are Greek, French, Italian, American, Chinese, Japanese, etc.</p>
        <h4 class="u-text u-text-palette-4-light-1 u-text-14"> Individual<br>Cuisines
        </h4>
      </div>
    </section>
    <section class="u-align-center-md u-align-center-sm u-align-center-xs u-align-right-lg u-align-right-xl u-clearfix u-image u-section-4" id="carousel_6f34" data-image-width="1280" data-image-height="720">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-align-left u-container-style u-group u-shape-rectangle u-group-1">
          <div class="u-container-layout u-container-layout-1">
            <h2 class="u-custom-font u-font-roboto-condensed u-text u-text-1">
              <span class="u-text-palette-3-base"></span>Food from around the <span class="u-text-palette-3-base"> World</span>
              <span class="u-text-palette-3-base"></span>
            </h2>
            <h5 class="u-text u-text-2">Serve tradition on a plate.</h5>
          </div>
        </div>
        <div class="u-image u-image-circle u-image-1" data-image-width="150" data-image-height="112" data-animation-name="customAnimationIn" data-animation-duration="750" data-animation-delay="250"></div>
      </div>
    </section>
    <section class="u-clearfix u-palette-4-light-2 u-section-5" id="carousel_3946">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-border-15 u-border-palette-4-light-1 u-expanded-width-xs u-image u-image-circle u-preserve-proportions u-image-1" data-image-width="150" data-image-height="150">
          <div class="u-preserve-proportions-child" style="padding-top: 100%;"></div>
        </div>
        <div class="u-container-style u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-group u-radius-50 u-shape-round u-white u-group-1">
          <div class="u-container-layout u-valign-middle u-container-layout-1">
            <h4 class="u-align-center u-text u-text-palette-4-base u-text-1"> Explore more kinds of recipes</h4>
            <p class="u-align-center u-text u-text-2"> Whether you crave sweet, savory, decadent or healthy, we have hundreds of top-rated dessert recipes to satisfy your taste buds. Furthermore, here you can get cocktails, smoothies and coffee recipes to refresh yourself.&nbsp;<br>
            </p>
            <a href="Recipes.aspx" class="u-active-palette-4-light-1 u-btn u-btn-round u-button-style u-hover-palette-4-light-1 u-palette-4-base u-radius-50 u-btn-1"> Check them out</a>
          </div>
        </div>
        <div class="u-border-14 u-border-white u-image u-image-circle u-image-2" data-image-width="150" data-image-height="150"></div>
        <div class="u-shape u-shape-svg u-text-palette-4-dark-1 u-shape-1">
          <svg class="u-svg-link" preserveAspectRatio="none" viewBox="0 0 160 160" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1186"></use></svg>
          <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xml:space="preserve" class="u-svg-content" viewBox="0 0 160 160" x="0px" y="0px" id="svg-1186" style="enable-background:new 0 0 160 160;"><path d="M80,30c27.6,0,50,22.4,50,50s-22.4,50-50,50s-50-22.4-50-50S52.4,30,80,30 M80,0C35.8,0,0,35.8,0,80s35.8,80,80,80
	s80-35.8,80-80S124.2,0,80,0L80,0z"></path></svg>
        </div>
        <div class="u-shape u-shape-svg u-text-palette-4-light-1 u-shape-2">
          <svg class="u-svg-link" preserveAspectRatio="none" viewBox="0 0 160 160" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-525f"></use></svg>
          <svg class="u-svg-content" viewBox="0 0 160 160" x="0px" y="0px" id="svg-525f" style="enable-background:new 0 0 160 160;"><path d="M80,30c27.6,0,50,22.4,50,50s-22.4,50-50,50s-50-22.4-50-50S52.4,30,80,30 M80,0C35.8,0,0,35.8,0,80s35.8,80,80,80
	s80-35.8,80-80S124.2,0,80,0L80,0z"></path></svg>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-6" id="carousel_d32d">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-align-left u-container-style u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-group u-group-1">
          <div class="u-container-layout u-valign-middle u-container-layout-1">
            <h3 class="u-text u-text-default u-text-1"> What we offer. </h3>
            <p class="u-text u-text-2">Our mission is to brighten up your life by providing an easy way to manage your food habbits and lifestyle.</p>
          </div>
        </div>
        <div class="u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-container-style u-list-item u-repeater-item">
              <div class="u-container-layout u-similar-container u-valign-bottom u-container-layout-2">
                <h4 class="u-text u-text-palette-4-base u-text-3">01.&nbsp;Create daily plan</h4>
                <p class="u-text u-text-4">With a click of a button, we offer you a daily meal plan. In addition, the cost and calories are calculated.</p>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item u-video-cover">
              <div class="u-container-layout u-similar-container u-valign-bottom u-container-layout-3">
                <h4 class="u-text u-text-palette-4-base u-text-5">02.&nbsp;Create weekly plan</h4>
                <p class="u-text u-text-6">Don't want to repeat the same process everyday? Create a weekly meal plan.<br>
                  <br>
                </p>
              </div>
            </div>
            <div class="u-container-style u-list-item u-repeater-item u-video-cover">
              <div class="u-container-layout u-similar-container u-valign-bottom u-container-layout-4">
                <h4 class="u-text u-text-palette-4-base u-text-7">03.&nbsp;Add a recipe to your favorites</h4>
                <p class="u-text u-text-8">Did you find a recipe that is appealing to your taste? Add it to your favorites for quicker access.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-palette-4-light-2 u-section-7" id="carousel_d839">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-border-15 u-border-palette-4-light-1 u-image u-image-circle u-image-1" data-image-width="1200" data-image-height="1000"></div>
        <div class="u-align-center u-container-style u-expanded-width-xs u-group u-radius-50 u-shape-round u-white u-group-1">
          <div class="u-container-layout u-valign-middle u-container-layout-1">
            <h2 class="u-text u-text-palette-4-base u-text-1"> How to Pair Food and Wine</h2>
            <p class="u-text u-text-2"> For all foodies - and even casual wine drinkers - pairing a nice glass of wine with a delicious plate of food can be the combination that sends your taste buds into orbit. But how do you do it?</p>
            <a href="Wines.aspx" class="u-active-palette-4-light-1 u-border-none u-btn u-btn-round u-button-style u-hover-palette-4-light-1 u-palette-4-base u-radius-50 u-btn-1">FIND A WINE</a>
          </div>
        </div>
        <div class="u-shape u-shape-svg u-text-palette-4-dark-1 u-shape-1">
          <svg class="u-svg-link" preserveAspectRatio="none" viewBox="0 0 160 160" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1186"></use></svg>
          <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xml:space="preserve" class="u-svg-content" viewBox="0 0 160 160" x="0px" y="0px" id="svg-1186" style="enable-background:new 0 0 160 160;"><path d="M80,30c27.6,0,50,22.4,50,50s-22.4,50-50,50s-50-22.4-50-50S52.4,30,80,30 M80,0C35.8,0,0,35.8,0,80s35.8,80,80,80
	s80-35.8,80-80S124.2,0,80,0L80,0z"></path></svg>
        </div>
        <div class="u-shape u-shape-svg u-text-palette-4-light-1 u-shape-2">
          <svg class="u-svg-link" preserveAspectRatio="none" viewBox="0 0 160 160" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-525f"></use></svg>
          <svg class="u-svg-content" viewBox="0 0 160 160" x="0px" y="0px" id="svg-525f" style="enable-background:new 0 0 160 160;"><path d="M80,30c27.6,0,50,22.4,50,50s-22.4,50-50,50s-50-22.4-50-50S52.4,30,80,30 M80,0C35.8,0,0,35.8,0,80s35.8,80,80,80
	s80-35.8,80-80S124.2,0,80,0L80,0z"></path></svg>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-valign-middle u-section-8" id="carousel_8874">
      <div class="u-expanded-width u-palette-4-light-1 u-shape u-shape-rectangle u-shape-1"></div>
      <div class="u-clearfix u-layout-wrap u-layout-wrap-1">
        <div class="u-layout">
          <div class="u-layout-row">
            <div class="u-align-center-md u-align-center-sm u-align-center-xs u-align-left-lg u-align-left-xl u-container-style u-layout-cell u-size-26-lg u-size-30-xl u-size-60-md u-size-60-sm u-size-60-xs u-layout-cell-1">
              <div class="u-container-layout u-valign-middle-lg u-valign-middle-md u-valign-middle-sm u-valign-middle-xs u-container-layout-1">
                <div class="u-border-14 u-border-white u-image u-image-circle u-image-1" data-image-width="571" data-image-height="864" data-animation-name="customAnimationIn" data-animation-duration="1000" data-animation-direction=""></div>
              </div>
            </div>
            <div class="u-align-center-md u-align-center-sm u-align-center-xs u-container-style u-layout-cell u-size-30-xl u-size-34-lg u-size-60-md u-size-60-sm u-size-60-xs u-white u-layout-cell-2">
              <div class="u-container-layout u-valign-middle-lg u-valign-middle-xl u-container-layout-2">
                <div class="u-align-center u-border-20 u-border-palette-4-light-1 u-container-style u-group u-radius-50 u-shape-round u-group-1">
                  <div class="u-container-layout u-valign-middle u-container-layout-3"><span class="u-icon u-icon-circle u-text-palette-4-light-1 u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 95.333 95.332" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-4676"></use></svg><svg class="u-svg-content" viewBox="0 0 95.333 95.332" x="0px" y="0px" id="svg-4676" style="enable-background:new 0 0 95.333 95.332;"><g><g><path d="M30.512,43.939c-2.348-0.676-4.696-1.019-6.98-1.019c-3.527,0-6.47,0.806-8.752,1.793    c2.2-8.054,7.485-21.951,18.013-23.516c0.975-0.145,1.774-0.85,2.04-1.799l2.301-8.23c0.194-0.696,0.079-1.441-0.318-2.045    s-1.035-1.007-1.75-1.105c-0.777-0.106-1.569-0.16-2.354-0.16c-12.637,0-25.152,13.19-30.433,32.076    c-3.1,11.08-4.009,27.738,3.627,38.223c4.273,5.867,10.507,9,18.529,9.313c0.033,0.001,0.065,0.002,0.098,0.002    c9.898,0,18.675-6.666,21.345-16.209c1.595-5.705,0.874-11.688-2.032-16.851C40.971,49.307,36.236,45.586,30.512,43.939z"></path><path d="M92.471,54.413c-2.875-5.106-7.61-8.827-13.334-10.474c-2.348-0.676-4.696-1.019-6.979-1.019    c-3.527,0-6.471,0.806-8.753,1.793c2.2-8.054,7.485-21.951,18.014-23.516c0.975-0.145,1.773-0.85,2.04-1.799l2.301-8.23    c0.194-0.696,0.079-1.441-0.318-2.045c-0.396-0.604-1.034-1.007-1.75-1.105c-0.776-0.106-1.568-0.16-2.354-0.16    c-12.637,0-25.152,13.19-30.434,32.076c-3.099,11.08-4.008,27.738,3.629,38.225c4.272,5.866,10.507,9,18.528,9.312    c0.033,0.001,0.065,0.002,0.099,0.002c9.897,0,18.675-6.666,21.345-16.209C96.098,65.559,95.376,59.575,92.471,54.413z"></path>
</g>
</g></svg></span>
                    <p id="trivia" class="u-text u-text-1"><br>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-18cf"><div class="u-clearfix u-sheet u-sheet-1">
        <img class="u-image u-image-round u-radius-10 u-image-1" src="images/foodies-5.png" alt="" data-image-width="713" data-image-height="272">
        <img class="u-image u-image-round u-radius-10 u-image-2" src="images/award.png" alt="" data-image-width="300" data-image-height="75">
        <h4 class="u-text u-text-1">Powered by</h4>
        <img class="u-image u-image-round u-radius-10 u-image-3" src="images/spoonacular_150.png" alt="" data-image-width="148" data-image-height="150">
        <h4 class="u-text u-text-2">Spoonacular API</h4>
        <h5 class="u-text u-text-3">© 2022 | foodies.com</h5>
      </div></footer><span style="height: 64px; width: 64px; margin-left: 0px; margin-right: auto; margin-top: 0px; background-image: none; right: 20px; bottom: 20px" class="u-back-to-top u-icon u-icon-circle u-opacity u-opacity-85 u-palette-1-base u-spacing-15" data-href="#">
        <svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 551.13 551.13"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1d98"></use></svg>
        <svg class="u-svg-content" enable-background="new 0 0 551.13 551.13" viewBox="0 0 551.13 551.13" xmlns="http://www.w3.org/2000/svg" id="svg-1d98"><path d="m275.565 189.451 223.897 223.897h51.668l-275.565-275.565-275.565 275.565h51.668z"></path></svg>
    </span>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Spoonacular.Login" %>

<!DOCTYPE html>

<html style="font-size: 16px;" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Log in, sign up">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Login</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
    <link rel="stylesheet" href="Login.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <link id="uthemegooglefont" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    <link id="upagegooglefont" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Oswald:200,300,400,500,600,700">
    <meta name="theme-color" content="#ec8700">
    <meta property="og:title" content="Login">
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
    <section class="u-align-center u-clearfix u-image u-section-1" id="sec-2d2e" data-image-width="1920" data-image-height="1200">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-custom-font u-font-montserrat u-text u-text-default u-text-palette-2-base u-text-1" data-animation-name="customAnimationIn" data-animation-duration="1000">Login Form</h2>
        <div class="u-align-center u-border-11 u-border-no-left u-border-no-right u-border-no-top u-border-palette-2-base u-container-style u-custom-border u-expanded-width-xs u-group u-palette-4-light-1 u-shape-rectangle u-group-1" data-animation-name="customAnimationIn" data-animation-duration="1000" data-animation-direction="">
          <div class="u-container-layout u-valign-bottom u-container-layout-1">
            <div class="u-form u-login-control u-form-1">
              <form action="#" method="POST" class="u-clearfix u-form-custom-backend u-form-spacing-10 u-form-vertical u-inner-form" source="custom" name="form" style="padding: 0px;" runat="server">
                <div class="u-form-group u-form-name u-label-top">
                  <label for="username" class="u-label u-label-1">Username *</label>
                  <asp:TextBox placeholder="Enter your Username" id="username" name="username" class="u-border-8 u-border-white u-input u-input-rectangle u-radius-50 u-white u-input-1" required="" runat="server"> </asp:TextBox>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="username" ErrorMessage="Please enter valid username" ForeColor="Red" ValidationExpression="(?![\s.]+$)[a-zA-Z0-9]{1,30}">  </asp:RegularExpressionValidator>
                </div>
                <div class="u-form-group u-form-password u-label-top">
                  <label for="password" class="u-label u-label-2">Password *</label>
                  <asp:TextBox type="password" placeholder="Enter your Password" id="password" name="password" class="u-border-8 u-border-white u-input u-input-rectangle u-radius-50 u-white u-input-2" required="" runat="server"> </asp:TextBox>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="password" ErrorMessage="Please enter valid password" ForeColor="Red" ValidationExpression="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$">  </asp:RegularExpressionValidator>
                </div>
                <div class="u-align-left u-form-group u-form-submit u-label-top">
                  <asp:Button id="LogInButton" class="u-form-control-hidden" Text="Submit" onClick="LogInButton_Click" runat="server"/>
                  <a href="#" class="u-active-white u-border-none u-btn u-btn-round u-btn-submit u-button-style u-hover-white u-palette-2-base u-radius-50 u-text-active-palette-2-base u-text-hover-palette-2-base u-btn-1">Login</a>
                </div>
              </form>
            </div>
            <div class="u-align-center-xs u-container-style u-expanded-width u-group u-white u-group-2">
              <div class="u-container-layout u-container-layout-2">
                <a href="Signup.aspx" class="u-border-1 u-border-active-palette-2-light-2 u-border-hover-palette-2-light-2 u-btn u-button-style u-login-control u-login-create-account u-none u-text-active-palette-2-light-2 u-text-hover-palette-2-light-2 u-text-palette-2-base u-btn-2">Don't have an account?</a>
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

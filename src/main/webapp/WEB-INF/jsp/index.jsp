<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<html lang="en">


<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="keywords" content="HTML5 Template" />
  <meta name="description" content="EVS- Easy vehicle service" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <title>EVS - Easy Vehicle Service</title>

  <!-- Favicon -->
  <link rel="shortcut icon" href='<c:url value="login/images/evslogo.png"/>' />

  <!-- bootstrap -->
  <link rel="stylesheet" type="text/css" href='<c:url value="landingpage/css/bootstrap.min.css"/>'/>

  <!-- flaticon -->
  <link rel="stylesheet" type="text/css" href='<c:url value="landingpage/css/flaticon.css"/>'/>

  <!-- mega menu -->
  <link rel="stylesheet" type="text/css" href='<c:url value="landingpage/css/mega-menu/mega_menu.css"/>'/>

  <!-- font awesome -->
  <link rel="stylesheet" type="text/css" href='<c:url value="landingpage/css/font-awesome.min.css"/>'/>

  <!-- owl-carousel -->
  <link rel="stylesheet" type="text/css" href='<c:url value="landingpage/css/owl-carousel/owl.carousel.css"/>'/>

  <!-- magnific-popup -->
  <link rel="stylesheet" type="text/css" href='<c:url value="landingpage/css/magnific-popup/magnific-popup.css"/>'/>

  <!-- revolution -->
  <link rel="stylesheet" type="text/css" href='<c:url value="landingpage/revolution/css/settings.css"/>'/>

  <!-- main style -->
  <link rel="stylesheet" type="text/css" href='<c:url value="landingpage/css/style.css"/>' />

  <!-- responsive -->
  <link rel="stylesheet" type="text/css" href='<c:url value="landingpage/css/responsive.css"/>' />

  <!-- Style customizer -->
  <link rel="stylesheet" href="#" data-style="styles" />
  <link rel="stylesheet" type="text/css" href='<c:url value="landingpage/css/style-customizer.css"/>'/>

  <!-- Google Tag Manager -->
  <script>(function (w, d, s, l, i) {
    w[l] = w[l] || []; w[l].push({
      'gtm.start':
        new Date().getTime(), event: 'gtm.js'
    }); var f = d.getElementsByTagName(s)[0],
      j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
        '../../../www.googletagmanager.com/gtm5445.html?id=' + i + dl; f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-557RCPW');</script>
  <!-- End Google Tag Manager -->

</head>

<body>

  <!-- Google Tag Manager (noscript) -->
  <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-557RCPW" height="0" width="0"
      style="display:none;visibility:hidden"></iframe></noscript>
  <!-- End Google Tag Manager (noscript) -->

  <!--=================================
  loading -->

  <div id="loading">
    <div id="loading-center">
      <img src='<c:url value="landingpage/images/evslogo.png"/>' alt="">
    </div>
  </div>

  <!--=================================
  loading -->


  <!--=================================
 header -->

  <header id="header" class="defualt">
    <div class="topbar">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-md-12">
            <div class="topbar-left text-lg-left text-center">
              <ul class="list-inline">
                <li> <i class="fa fa-envelope-o"> </i> support@evs.com</li>
                <li> <i class="fa fa-clock-o"></i> Mon - Sat 8.00 - 18.00. Sunday CLOSED</li>
              </ul>
            </div>
          </div>
          <div class="col-lg-6 col-md-12">
            <div class="topbar-right text-lg-right text-center">
              <ul class="list-inline">
                <li> <i class="fa fa-phone"></i> (+91) 123 456 7890</li>
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                <li><a href="#"><i class="fa fa-youtube-play"></i></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!--=================================
 mega menu -->

    <div class="menu">
      <!-- menu start -->
      <nav id="menu" class="mega-menu">
        <!-- menu list items container -->
        <section class="menu-list-items">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <!-- menu logo -->
                <ul class="menu-logo">
                  <li>
                    <a href="index.evs"><img id="" src='<c:url value="landingpage/images/evslogo.png"/>'  alt="logo" style="width: 40px; height: 20px;"> </a>
                  </li>
                </ul>
                <!-- menu links -->
                <ul class="menu-links">
                  <!-- active class -->
                  <li class="active"><a href="EVS.evs"> Home
                      <!--<i class="fa fa-angle-down fa-indicator"></i>--></a>

                  </li>
                  <li><a href="login.evs"> Login / Signup </a></li>
                </ul>
              </div>
            </div>
          </div>
        </section>
      </nav>
      <!-- menu end -->
    </div>
  </header>

  <!--=================================
 header -->


  <!--=================================
 rev slider -->
  <section class="slider">
    <div id="rev_slider_2_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="car-dealer-03"
      style="margin:0px auto;background-color:transparent;padding:0px;margin-top:0px;margin-bottom:0px;">
      <!-- START REVOLUTION SLIDER 5.2.6 fullwidth mode -->
      <div id="rev_slider_2_1" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.2.6">
        <ul>
          <!-- SLIDE  -->
          <li data-index="rs-5" data-transition="fade" data-slotamount="default" data-hideafterloop="0"
            data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="default"
            data-thumb='<c:url value="landingpage/revolution/assets/100x50_3176d-road-bg.jpg"/>'data-rotate="0" data-saveperformance="off"
            data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6=""
            data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
            <!-- MAIN IMAGE -->
            <img src='<c:url value="landingpage/revolution/assets/3176d-road-bg.jpg"/>' alt="" data-bgposition="center center" data-bgfit="cover"
              data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
            <!-- LAYERS -->

            <!-- LAYER NR. 1 -->
            <div class="tp-caption   tp-resizeme" id="slide-5-layer-6" data-x="center" data-hoffset="" data-y="270"
              data-width="['auto']" data-height="['auto']" data-transform_idle="o:1;"
              data-transform_in="y:[-100%];z:0;rZ:35deg;sX:1;sY:1;skX:0;skY:0;s:800;e:Power4.easeInOut;"
              data-transform_out="opacity:0;s:300;" data-mask_in="x:0px;y:0px;" data-start="1400" data-splitin="chars"
              data-splitout="none" data-responsive_offset="on" data-elementdelay="0.05"
              style="z-index: 5; white-space: nowrap; font-size: 30px; line-height: 30px; font-weight: 400; color: rgba(255, 255, 255, 1.00);font-family:Roboto;text-align:center;text-transform:uppercase;">
              Welcome to the India's First </div>

            <!-- LAYER NR. 2 -->
            <div class="tp-caption   tp-resizeme" id="slide-5-layer-7" data-x="center" data-hoffset="" data-y="center"
              data-voffset="-140" data-width="['auto']" data-height="['auto']" data-transform_idle="o:1;"
              data-transform_in="y:[-100%];z:0;rZ:35deg;sX:1;sY:1;skX:0;skY:0;s:800;e:Power4.easeInOut;"
              data-transform_out="opacity:0;s:300;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="1700"
              data-splitin="chars" data-splitout="none" data-responsive_offset="on" data-elementdelay="0.05"
              style="z-index: 6; white-space: nowrap; font-size: 70px; line-height: 70px; font-weight: 700; color: rgba(255, 255, 255, 1.00);font-family:Roboto;text-align:center;text-transform:uppercase;">
              Vehicle Service website</div>

            <!-- LAYER NR. 3 -->
            <div class="tp-caption button red tp-resizeme" id="slide-5-layer-10" data-x="center" data-hoffset=""
              data-y="bottom" data-voffset="130" data-width="['auto']" data-height="['auto']" data-transform_idle="o:1;"
              data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:300;e:Power0.easeIn;"
              data-style_hover="c:rgba(0, 0, 0, 1.00);bg:rgba(255, 255, 255, 1.00);"
              data-transform_in="y:bottom;s:600;e:Power2.easeInOut;" data-transform_out="opacity:0;s:300;"
              data-start="3300" data-splitin="none" data-splitout="none" data-responsive_offset="on"
              style="z-index: 7; white-space: nowrap; font-size: 14px; line-height: 18px; font-weight: 400; color: rgba(255, 255, 255, 1.00);font-family:Open Sans;text-align:center;text-transform:uppercase;background-color:rgba(219, 45, 46, 1.00);padding:12px 20px 12px 20px;border-color:rgba(0, 0, 0, 1.00);outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
              learn more </div>

            <!-- LAYER NR. 4 -->
            <div class="tp-caption   tp-resizeme" id="slide-5-layer-12" data-x="right" data-hoffset="70" data-y="center"
              data-voffset="135" data-width="['none','none','none','none']" data-height="['none','none','none','none']"
              data-transform_idle="o:1;" data-transform_in="x:-50px;opacity:0;s:800;e:Power2.easeInOut;"
              data-transform_out="opacity:0;s:300;" data-start="620" data-responsive_offset="on" style="z-index: 8;">
              <img src='<c:url value="landingpage/revolution/assets/4f45e-07-bmw-s2.png"/>' alt="" data-ww="auto" data-hh="auto" data-no-retina>
            </div>

            <!-- LAYER NR. 5 -->
            <div class="tp-caption   tp-resizeme" id="slide-5-layer-11" data-x="120" data-y="center" data-voffset="130"
              data-width="['none','none','none','none']" data-height="['none','none','none','none']"
              data-transform_idle="o:1;" data-transform_in="x:50px;opacity:0;s:800;e:Power2.easeInOut;"
              data-transform_out="opacity:0;s:300;" data-start="200" data-responsive_offset="on" style="z-index: 9;">
              <img src='<c:url value="landingpage/revolution/assets/e13ec-06-audi-s2.png"/>' alt="" data-ww="auto" data-hh="auto" data-no-retina>
            </div>
          </li>
          <!-- SLIDE  -->
          <li data-index="rs-6" data-transition="fade" data-slotamount="default" data-hideafterloop="0"
            data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="default"
            data-thumb='<c:url value="landingpage/revolution/assets/100x50_3176d-road-bg.jpg"/>' data-rotate="0" data-saveperformance="off"
            data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6=""
            data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
            <!-- MAIN IMAGE -->
            <img src='<c:url value="landingpage/revolution/assets/3176d-road-bg.jpg"/>' alt="" data-bgposition="center center" data-bgfit="cover"
              data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
            <!-- LAYERS -->

            <!-- LAYER NR. 1 -->
            <div class="tp-caption   tp-resizeme" id="slide-6-layer-4" data-x="3" data-y="center" data-voffset="50"
              data-width="['none','none','none','none']" data-height="['none','none','none','none']"
              data-transform_idle="o:1;" data-transform_in="x:50px;opacity:0;s:1500;e:Power3.easeOut;"
              data-transform_out="opacity:0;s:300;" data-start="2060" data-responsive_offset="on" style="z-index: 5;">
              <img src='<c:url value="landingpage/revolution/assets/74231-04-audi.png"/>' alt="" data-ww="auto" data-hh="auto" data-no-retina> </div>

            <!-- LAYER NR. 2 -->
            <div class="tp-caption   tp-resizeme" id="slide-6-layer-5" data-x="right" data-hoffset="-10" data-y="center"
              data-voffset="60" data-width="['none','none','none','none']" data-height="['none','none','none','none']"
              data-transform_idle="o:1;" data-transform_in="x:-50px;opacity:0;s:1500;e:Power3.easeOut;"
              data-transform_out="opacity:0;s:300;" data-start="2060" data-responsive_offset="on" style="z-index: 6;">
              <img src='<c:url value="landingpage/revolution/assets/35261-05-honda.png"/>' alt="" data-ww="auto" data-hh="auto" data-no-retina>
            </div>

            <!-- LAYER NR. 3 -->
            <div class="tp-caption   tp-resizeme" id="slide-6-layer-6" data-x="center" data-hoffset="" data-y="270"
              data-width="['auto']" data-height="['auto']" data-transform_idle="o:1;"
              data-transform_in="y:[-100%];z:0;rZ:35deg;sX:1;sY:1;skX:0;skY:0;s:300;e:Power4.easeInOut;"
              data-transform_out="opacity:0;s:300;" data-mask_in="x:0px;y:0px;" data-start="3260" data-splitin="chars"
              data-splitout="none" data-responsive_offset="on" data-elementdelay="0.05"
              style="z-index: 7; white-space: nowrap; font-size: 30px; line-height: 30px; font-weight: 400; color: rgba(255, 255, 255, 1.00);font-family:Roboto;text-align:center;text-transform:uppercase;">
              We have everything </div>

            <!-- LAYER NR. 4 -->
            <div class="tp-caption   tp-resizeme" id="slide-6-layer-7" data-x="center" data-hoffset="" data-y="center"
              data-voffset="-140" data-width="['auto']" data-height="['auto']" data-transform_idle="o:1;"
              data-transform_in="y:[-100%];z:0;rZ:35deg;sX:1;sY:1;skX:0;skY:0;s:300;e:Power4.easeInOut;"
              data-transform_out="opacity:0;s:300;" data-mask_in="x:0px;y:0px;s:inherit;e:inherit;" data-start="4290"
              data-splitin="chars" data-splitout="none" data-responsive_offset="on" data-elementdelay="0.05"
              style="z-index: 8; white-space: nowrap; font-size: 70px; line-height: 70px; font-weight: 700; color: rgba(255, 255, 255, 1.00);font-family:Roboto;text-align:center;text-transform:uppercase;">
              Your car needs! </div>

            <!-- LAYER NR. 5 -->
            <div class="tp-caption button red  tp-resizeme" id="slide-6-layer-10" data-x="center" data-hoffset=""
              data-y="bottom" data-voffset="140" data-width="['auto']" data-height="['auto']" data-transform_idle="o:1;"
              data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:300;e:Power0.easeIn;"
              data-style_hover="c:rgba(0, 0, 0, 1.00);bg:rgba(255, 255, 255, 1.00);"
              data-transform_in="y:bottom;s:600;e:Power2.easeInOut;" data-transform_out="opacity:0;s:300;"
              data-start="5329.8614501953" data-splitin="none" data-splitout="none" data-responsive_offset="on"
              data-end="8999.8614501953"
              style="z-index: 9; white-space: nowrap; font-size: 14px; line-height: 18px; font-weight: 400; color: rgba(255, 255, 255, 1.00);font-family:Open Sans;text-align:center;text-transform:uppercase;background-color:rgba(219, 45, 46, 1.00);padding:12px 20px 12px 20px;border-color:rgba(0, 0, 0, 1.00);outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
              learn more </div>

            <!-- LAYER NR. 6 -->
            <div class="tp-caption   tp-resizeme" id="slide-6-layer-3" data-x="right" data-hoffset="159" data-y="center"
              data-voffset="81" data-width="['none','none','none','none']" data-height="['none','none','none','none']"
              data-transform_idle="o:1;" data-transform_in="x:-50px;opacity:0;s:1500;e:Power3.easeOut;"
              data-transform_out="opacity:0;s:300;" data-start="1220" data-responsive_offset="on" style="z-index: 10;">
              <img src='<c:url value="landingpage/revolution/assets/ec416-03-huydai.png"/>' alt="" data-ww="auto" data-hh="auto" data-no-retina>
            </div>

            <!-- LAYER NR. 7 -->
            <div class="tp-caption   tp-resizeme" id="slide-6-layer-2" data-x="202" data-y="center" data-voffset="80"
              data-width="['none','none','none','none']" data-height="['none','none','none','none']"
              data-transform_idle="o:1;" data-transform_in="x:50px;opacity:0;s:1500;e:Power3.easeOut;"
              data-transform_out="opacity:0;s:300;" data-start="1200" data-responsive_offset="on" style="z-index: 11;">
              <img src='<c:url value="landingpage/revolution/assets/1fa45-02-bmw.png"/>' alt="" data-ww="auto" data-hh="auto" data-no-retina> </div>

            <!-- LAYER NR. 8 -->
            <div class="tp-caption   tp-resizeme" id="slide-6-layer-1" data-x="center" data-hoffset="" data-y="center"
              data-voffset="100" data-width="['none','none','none','none']" data-height="['none','none','none','none']"
              data-transform_idle="o:1;"
              data-transform_in="z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;s:670;e:Power3.easeInOut;"
              data-transform_out="opacity:0;s:300;" data-start="500" data-responsive_offset="on" style="z-index: 12;">
              <img src='<c:url value="landingpage/revolution/assets/95515-o1-kia.png"/>' alt="" data-ww="auto" data-hh="auto" data-no-retina> </div>
          </li>
        </ul>
        <div class="tp-bannertimer tp-bottom" style="visibility: hidden !important;"></div>
      </div>
    </div>
  </section>

  <!--=================================
  rev slider -->


  <!--=================================
 welcome -->

  <section class="welcome-block objects-car page-section-ptb white-bg">
    <div class="objects-left left"><img class="img-fluid objects-1" src='<c:url value="landingpage/images/objects/01.jpg"/>' alt=""></div>
    <div class="objects-right right"><img class="img-fluid objects-2" src='<c:url value="landingpage/images/objects/02.jpg"/>' alt=""></div>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-title">
            <span>Welcome to our website</span>
            <h2>EVS - Easy Vehicle Service</h2>
            <div class="separator"></div>
            <p>We provide the best vehicle serivices. We provide all the facilities which is required for your vehicle <strong>On-road and Off-road</strong>.</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-3 col-md-6">
          <div class="feature-box text-center">
            <div class="icon">
              <i class="glyph-icon flaticon-beetle"></i>
            </div>
            <div class="content">
              <h6>Price Comparison</h6>
              <p>We provide the price comparison between garages.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="feature-box text-center">
            <div class="icon">
              <i class="glyph-icon flaticon-interface-1"></i>
            </div>
            <div class="content">
              <h6>Inventory Management</h6>
              <p>You can see the weather the part of your vehicle is available or not.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="feature-box text-center">
            <div class="icon">
              <i class="glyph-icon flaticon-key"></i>
            </div>
            <div class="content">
              <h6>Vehicle History</h6>
              <p>We save all your vehicle maintenace history and remind you when needed.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6">
          <div class="feature-box text-center">
            <div class="icon">
              <i class="glyph-icon flaticon-wallet"></i>
            </div>
            <div class="content">
              <h6>appointment scheduling</h6>
              <p>We provide scheduling for your convinence.</p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="halp-call text-center">
            <img class="img-fluid" src='<c:url value="landingpage/images/team/01.jpg"/>' alt="">
            <span>Have any question ?</span>
            <h2 class="text-red">(+91) 123 456 7890</h2>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!--=================================
 welcome -->

  <!--=================================
 Counter -->

  <section class="counter counter-style-1 light page-section-ptb">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-md-6 text-center">
          <div class="counter-block">
            <i class="glyph-icon flaticon-beetle"></i>
            <h6 class="text-black">Garages Registered </h6>
            <b class="timer" data-to="${ng }" data-speed="3000"></b>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="counter-block">
            <i class="glyph-icon flaticon-interface"></i>
            <h6 class="text-black">Employees</h6>
            <b class="timer" data-to="${nes}" data-speed="3000"></b>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="counter-block">
            <i class="glyph-icon flaticon-circle"></i>
            <h6 class="text-black">Happy Customer</h6>
            <b class="timer" data-to="${nc }" data-speed="3000"></b>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="counter-block">
            <i class="glyph-icon flaticon-cup"></i>
            <h6 class="text-black">Services</h6>
            <b class="timer" data-to="${ns }" data-speed="3000"></b>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!--=================================
 Counter -->


  <hr class="gray">

  <!--=================================
 testimonial -->

  <section class="testimonial-1 white-bg page page-section-ptb">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-title">
            <span>What Our Happy Clients say about us</span>
            <h2>our Testimonial </h2>
            <div class="separator"></div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="owl-carousel" data-items="3" data-md-items="3" data-sm-items="2" data-xs-items="1"
            data-space="20">
            <div class="item">
              <div class="testimonial-block text-center">
                <div class="testimonial-image">
                  <img class="img-fluid" src='<c:url value="landingpage/images/testimonial/01.jpg"/>' alt="">
                </div>
                <div class="testimonial-box">
                  <div class="testimonial-avtar">
                    <img class="img-fluid" src='<c:url value="landingpage/images/team/01.jpg"/>' alt="">
                    <h6>Alice Williams</h6>
                    <span>Auto Dealer</span>
                  </div>
                  <div class="testimonial-content">
                    <p>It has survived not only five centuries. lorem Ipsum is simply dummy text of the printin a galley
                      of type and bled it to make a type specimen book.</p>
                    <i class="fa fa-quote-right"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="testimonial-block text-center">
                <div class="testimonial-image">
                  <img class="img-fluid" src='<c:url value="landingpage/images/testimonial/02.jpg"/>' alt="">
                </div>
                <div class="testimonial-box">
                  <div class="testimonial-avtar">
                    <img class="img-fluid" src='<c:url value="landingpage/images/team/02.jpg"/>' alt="">
                    <h6>Michael Bean</h6>
                    <span>Car Dealer</span>
                  </div>
                  <div class="testimonial-content">
                    <p>A galley of type and bled it to make a type specimen book. Ipsum is simply dummy text of the
                      printin It has survived not only five centuries.</p>
                    <i class="fa fa-quote-right"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="testimonial-block text-center">
                <div class="testimonial-image">
                  <img class="img-fluid" src='<c:url value="landingpage/images/testimonial/03.jpg"/>' alt="">
                </div>
                <div class="testimonial-box">
                  <div class="testimonial-avtar">
                    <img class="img-fluid" src='<c:url value="landingpage/images/team/03.jpg"/>' alt="">
                    <h6>Felica Queen</h6>
                    <span>Auto Dealer</span>
                  </div>
                  <div class="testimonial-content">
                    <p>Text of the printin a galley of type and bled it to a type specimen book. It has survived not
                      only five centuries make Lorem Ipsum is simply dummy.</p>
                    <i class="fa fa-quote-right"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="testimonial-block text-center">
                <div class="testimonial-image">
                  <img class="img-fluid" src='<c:url value="landingpage/images/testimonial/04.jpg"/>' alt="">
                </div>
                <div class="testimonial-box">
                  <div class="testimonial-avtar">
                    <img class="img-fluid" src='<c:url value="landingpage/images/team/04.jpg"/>' alt="">
                    <h6>Sara Lisbon</h6>
                    <span>Customer</span>
                  </div>
                  <div class="testimonial-content">
                    <p>Printin a galley of type and bled It has survived not lorem Ipsum is simply dummy text of the it
                      to make a type specimen book only five centuries.</p>
                    <i class="fa fa-quote-right"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!--=================================
 testimonial -->


  <!--=================================
 footer -->

  <footer class="footer bg-2 bg-overlay-black-90">
    
    <!--=================================
 contact -->

<section class="contact page-section-ptb white-bg">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
         <div class="section-title">
           <span>We'd	 Love to Hear From You</span>
           <h2>LET'S GET IN TOUCH!</h2>
           <div class="separator"></div>
         </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-3 col-md-6">
       <div class="contact-box text-center">
          <i class="fa fa-map-marker"></i>
          <h5>Address</h5>
          <p>Ahmedabad</p>
        </div>
      </div>
      <div class="col-lg-3 col-md-6">
       <div class="contact-box text-center">
          <i class="fa fa-phone"></i>
          <h5>Phone</h5>
          <p> (+91) 123 456 7890</p>
        </div>
      </div>
      <div class="col-lg-3 col-md-6">
       <div class="contact-box text-center">
          <i class="fa fa-envelope-o"></i>
          <h5>Email</h5>
          <p> support@evs.com</p>
        </div>
      </div>
      <div class="col-lg-3 col-md-6">
       <div class="contact-box text-center">
          <i class="fa fa-fax"></i>
          <h5>Fax</h5>
          <p>(+91) 123 456 7890</p>
        </div>
      </div>
    </div>
    <div class="page-section-ptb">
      <div class="row">
       <div class="col-lg-8 col-sm-12">
       <div class="gray-form">
         <div id="formmessage">Success/Error Message Goes Here</div>
           <form class="form-horizontal" id="contactform" role="form" method="post" action="#">
            <div class="contact-form row">
              <div class="col-lg-4 col-sm-12">
               <div class="form-group">
                 <input id="name" type="text" placeholder="Name*" class="form-control"  name="name">
               </div> 
             </div> 
             <div class="col-lg-4 col-sm-12">
               <div class="form-group">
                 <input type="email" placeholder="Email*" class="form-control" name="email">
                </div>
              </div>
              <div class="col-lg-4 col-sm-12">
                <div class="form-group">
                  <input type="text" placeholder="Phone*" class="form-control" name="phone">
                </div>
              </div>
              <div class="col-md-12">
                 <div class="form-group">
                   <textarea class="form-control input-message" placeholder="Comment*" rows="7" name="message"></textarea>
                 </div>
              </div>
              <div class="col-md-12">
                 <input type="hidden" name="action" value="sendEmail"/>
                 <button id="submit" name="submit" type="submit" value="Send" class="button red"> Send your message </button>
               </div>
              </div>
          </form>
          <div id="ajaxloader" style="display:none"><img class="center-block" src='<c:url value="landingpage/images/ajax-loader.gif"/>' alt=""></div> 
           </div> 
       </div>
      <div class="col-lg-4 col-sm-12 mt-lg-0 mt-4">
        <div class="opening-hours gray-bg mt-sm-0">
          <h6>opening hours</h6>
          <ul class="list-style-none">
            <li><strong>Sunday</strong> <span class="text-red"> closed</span></li>
            <li><strong>Monday</strong> <span> 9:00 AM to 9:00 PM</span></li>
            <li><strong>Tuesday </strong> <span> 9:00 AM to 9:00 PM</span></li>
            <li><strong>Wednesday </strong> <span> 9:00 AM to 9:00 PM</span></li>
            <li><strong>Thursday </strong> <span> 9:00 AM to 9:00 PM</span></li>
            <li><strong>Friday </strong> <span> 9:00 AM to 9:00 PM</span></li>
            <li><strong>Saturday </strong> <span> 9:00 AM to 9:00 PM</span></li>
          </ul>
        </div>
      </div>
     </div>
 </div>
   <div class="row">
     <div class="col-md-4">
       <div class="feature-box-3">
          <div class="icon">
            <i class="fa fa-clock-o"></i>
          </div>
          <div class="content">
            <h6>opening hours </h6>
            <p>Voluptatem accusanoremque sed ut perspiciatis unde omnis iste natus error sit laudantium, totam rem aperiam. </p>
          </div>
         </div>
     </div>
     <div class="col-md-4">
       <div class="feature-box-3">
          <div class="icon">
            <i class="fa fa-support"></i>
          </div>
          <div class="content">
            <h6>Our Support Center </h6>
            <p>Iste natus error sit sed ut perspiciatis unde omnis voluptatem laudantium, totam rem aperiam. </p>
          </div>
         </div>
     </div>
     <br/>
     <div class="col-md-4">
       <div class="feature-box-3">
          <div class="icon">
            <i class="fa fa-info"></i>
          </div>
          <div class="content">
            <h6>Some Information </h6>
            <p>Totam rem aperiam sed ut perspiciatis unde omnis iste natus error sit voluptatem laudantium.</p>
          </div>
         </div>
     </div>
   </div>
   <div class="copyright">
    <div class="row">
      <div class="col-lg-6 col-md-12">
        <div class="text-lg-left text-center">
          <p>©Copyright 2020 website Developed by <a href="#"
              target="_blank">EVS-team</a></p>
        </div>
      </div>
      <div class="col-lg-6 col-md-12">
        <ul class="list-inline text-lg-right text-center">
          <li><a href="#">privacy policy </a> | </li>
          <li><a href="#">terms and conditions </a> |</li>
          <li><a href="#">contact us </a></li>
        </ul>
      </div>
    </div>
  </div>
  </div>
  
</section>

<!--=================================
 contact -->
  </footer>

  <!--=================================
 footer -->

  <!--=================================
 back to top -->

  <div class="car-top">
    <span><img src='<c:url value="landingpage/images/car.png"/>' alt=""></span>
  </div>

  <!--=================================
 back to top -->

  <!--=================================
 jquery -->

  <!-- jquery  -->
  <script type="text/javascript" src='<c:url value="landingpage/js/jquery-3.3.1.min.js"/>'></script>

  <!-- bootstrap -->
  <script type="text/javascript" src='<c:url value="landingpage/js/popper.js"/>'></script>
  <script type="text/javascript" src='<c:url value="landingpage/js/bootstrap.min.js"/>'></script>

  <!-- mega-menu -->
  <script type="text/javascript" src='<c:url value="landingpage/js/mega-menu/mega_menu.js"/>'></script>

  <!-- appear -->
  <script type="text/javascript" src='<c:url value="landingpage/js/jquery.appear.js"/>'></script>

  <!-- counter -->
  <script type="text/javascript" src='<c:url value="landingpage/js/counter/jquery.countTo.js"/>'></script>

  <!-- owl-carousel -->
  <script type="text/javascript" src='<c:url value="landingpage/js/owl-carousel/owl.carousel.min.js"/>'></script>

  <!-- select -->
  <script type="text/javascript" src='<c:url value="landingpage/js/select/jquery-select.js"/>'></script>

  <!-- magnific popup -->
  <script type="text/javascript" src='<c:url value="landingpage/js/magnific-popup/jquery.magnific-popup.min.js"/>'></script>

  <!-- revolution -->
  <script type="text/javascript" src='<c:url value="landingpage/revolution/js/jquery.themepunch.tools.min.js"/>'></script>
  <script type="text/javascript" src='<c:url value="landingpage/revolution/js/jquery.themepunch.revolution.min.js"/>'></script>
  <!-- SLIDER REVOLUTION 5.0 EXTENSIONS  (Load Extensions only on Local File Systems !  The following part can be removed on Server for On Demand Loading) -->
  <script type="text/javascript" src='<c:url value="landingpage/revolution/js/extensions/revolution.extension.actions.min.js"/>'></script>
  <script type="text/javascript" src='<c:url value="landingpage/revolution/js/extensions/revolution.extension.carousel.min.js"/>'></script>
  <script type="text/javascript" src='<c:url value="landingpage/revolution/js/extensions/revolution.extension.kenburn.min.js"/>'></script>
  <script type="text/javascript" src='<c:url value="landingpage/revolution/js/extensions/revolution.extension.layeranimation.min.js"/>'></script>
  <script type="text/javascript" src='<c:url value="landingpage/revolution/js/extensions/revolution.extension.migration.min.js"/>'></script>
  <script type="text/javascript" src='<c:url value="landingpage/revolution/js/extensions/revolution.extension.navigation.min.js"/>'></script>
  <script type="text/javascript" src='<c:url value="landingpage/revolution/js/extensions/revolution.extension.parallax.min.js"/>'></script>
  <script type="text/javascript" src='<c:url value="landingpage/revolution/js/extensions/revolution.extension.slideanims.min.js"/>'></script>
  <!-- <script type="text/javascript" src="revolution/js/extensions/revolution.extension.video.min.js"></script> -->

  <!-- style customizer  -->
  <script type="text/javascript" src='<c:url value="landingpage/js/style-customizer.js"/>'></script>

  <!-- custom -->
  <script type="text/javascript" src='<c:url value="landingpage/js/custom.js"/>'></script>

  <script type="text/javascript">
    (function ($) {
      "use strict";

      var tpj = jQuery;
      var revapi2;
      tpj(document).ready(function () {
        if (tpj("#rev_slider_2_1").revolution == undefined) {
          revslider_showDoubleJqueryError("#rev_slider_2_1");
        } else {
          revapi2 = tpj("#rev_slider_2_1").show().revolution({
            sliderType: "standard",
            sliderLayout: "fullwidth",
            dottedOverlay: "none",
            delay: 9000,
            navigation: {
              keyboardNavigation: "off",
              keyboard_direction: "horizontal",
              mouseScrollNavigation: "off",
              mouseScrollReverse: "default",
              onHoverStop: "off",
              bullets: {
                enable: true,
                hide_onmobile: false,
                style: "hermes",
                hide_onleave: false,
                direction: "horizontal",
                h_align: "center",
                v_align: "bottom",
                h_offset: 0,
                v_offset: 50,
                space: 10,
                tmp: ''
              }
            },
            visibilityLevels: [1240, 1024, 778, 480],
            gridwidth: 1570,
            gridheight: 1000,
            lazyType: "none",
            shadow: 0,
            spinner: "spinner3",
            stopLoop: "off",
            stopAfterLoops: -1,
            stopAtSlide: -1,
            shuffle: "off",
            autoHeight: "off",
            disableProgressBar: "on",
            hideThumbsOnMobile: "off",
            hideSliderAtLimit: 0,
            hideCaptionAtLimit: 0,
            hideAllCaptionAtLilmit: 0,
            debugMode: false,
            fallbacks: {
              simplifyAll: "off",
              nextSlideOnWindowFocus: "off",
              disableFocusListener: false,
            }
          });
        }
      });
    })(jQuery);

  </script>

</body>

<!-- Mirrored from themes.potenzaglobalsolutions.com/html/cardealer/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 20 Apr 2020 18:01:58 GMT -->

</html>
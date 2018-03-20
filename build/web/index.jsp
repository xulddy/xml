<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>

<html>
    <head>
        <title>${title}</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>GETTING STARTED WITH BRACKETS</title>
        <meta name="description" content="An interactive getting started guide for Brackets.">
        <script src="/layout/scripts/script.js"></script>
        <!--        <link rel="stylesheet" href="main.css">-->

        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css"
              integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ=="
              crossorigin=""/>
        <!-- Make sure you put this AFTER Leaflet's CSS -->
        <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"
                integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw=="
        crossorigin=""></script>

        <style>
            #mapid { height: 500px; }
        </style>
    </head>
    <body id="top">
     
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <div class="wrapper row0">
            <div id="topbar" class="hoc clear"> 
                <!-- ################################################################################################ -->
                <div class="fl_left">
                    <ul class="faico clear">
                        <li><a class="faicon-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a class="faicon-pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
                        <li><a class="faicon-twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a class="faicon-dribble" href="#"><i class="fa fa-dribbble"></i></a></li>
                        <li><a class="faicon-linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a class="faicon-google-plus" href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a class="faicon-rss" href="#"><i class="fa fa-rss"></i></a></li>
                    </ul>
                </div>
                <div class="fl_right">
                    <ul class="nospace inline pushright">
                        <li><i class="fa fa-user"></i> <a href="#">Register</a></li>
                        <li><i class="fa fa-sign-in"></i> <a href="#">Login</a></li>
                    </ul>
                </div>
                <!-- ################################################################################################ -->
            </div>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- Top Background Image Wrapper -->
        <div class="bgded overlay" style="background-image:url('http://www.thuecanho.com/theme/alberlethu2016/images/home/02.png');height: 466px;"> 
            <!-- ################################################################################################ -->
      <jsp:include page="map.jsp"></jsp:include>
              
            <!-- ################################################################################################ -->
            <!-- ################################################################################################ -->
            <!-- ################################################################################################ -->
            <div id="pageintro" class="hoc clear"> 
                <!-- ################################################################################################ -->
                <article>
                    
                </article>
                <!-- ################################################################################################ -->
            </div>
            <!-- ################################################################################################ -->
        </div>
        <!-- End Top Background Image Wrapper -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <div class="wrapper row3">
            <main class="hoc container clear"> 
                <!-- main body -->
                <!-- main body -->
                <!-- ################################################################################################ -->
                <div class="content three_quarter first"> 
                    <!-- ################################################################################################ -->
                    <div id="gallery">
                        <figure>
                            <header class="heading">
                                <h1>Bán bất động sản, bán nhà đất giá rẻ tại Hà Nội</h1>
                                <div class="page-desciption">
                                    Thông tin rao vặt, mua bán nhà đất, bất động sản giá rẻ, uy tín tại Hà Nội. Hàng ngàn tin đăng mua bán nhà ở, đất trống, căn hộ, mặt bằng cập nhật liên tục 24h tại Mogi.vn Hà Nội
                                </div>
                            </header>

                            <c:import url="${pageContext.request.contextPath}/GetXML?id=${uri}" var="listItem"></c:import>
                                <div class="list-view">
                                <x:parse xml="${listItem}" var="myXML" ></x:parse>
                                <x:forEach select="$myXML/listItem/item" var="item">

                                    <div class="list-view-item clearfix ">
                                        <div class="list-view-image">

                                            <a href="${pageContext.request.contextPath}/DetailServlet?id=<x:out select="$item/url"></x:out>">
                                                <img src="<x:out select="$item/image"></x:out>">
                                                </a>

                                                <!--                                            <span class="gallery-image-total">
                                                                                                <span><i class="icon icon-image"></i>1</span>
                                                                                                <span><i class="icon icon-clip"></i>0</span>
                                                                                                <span><i class="icon icon-plan"></i>4</span>
                                                                                            </span>-->
                                                <span class="list-view-price">  Giá : <x:out select="$item/price"></x:out></span>
                                            </div>
                                            <div class="list-view-content">
                                                <div class="content">
                                                    <div class="title2">
                                                        <a href="${pageContext.request.contextPath}/DetailServlet?id=<x:out select="$item/url"></x:out>">
                                                        <h2><x:out select="$item/title"></x:out></h2>
                                                        </a></div>
                                                    <div class="title1">

                                                    <x:out select="$item/location"></x:out>
                                                    </div>
                                                    <div class="room">
                                                        <!--                                                        <span><i class="fa fa-bed"></i> 2</span>
                                                                                                                <span class="bathroom"><i class="fa fa-bath"></i> 2</span>-->
                                                        <span><i class="icon icon-acreage"></i> <x:out select="$item/area"></x:out></span>
                                                    </div>
                                                    <div class="summary">

                                                    <x:out select="$item/description" escapeXml="false"></x:out>
                                                    </div>
                                                </div>
                                                <span class="date"></span>
                                                <div class="list-view-agent">
                                                    <div class="agent-content">
                                                        <img src="/content/images/avatar.png" alt="">
                                                        <span class="agent-name"></span>
                                                        <div class="agent-mobile hidden-xs">
                                                        </div>
                                                    </div>

                                                    <div class="favorite "><i id="2451054" class="fa fa-heart"></i></div>

                                                </div>
                                            </div>
                                        </div>
                                </x:forEach>
                            </div>

                        </figure>
                    </div>
                    <!-- ################################################################################################ -->
                    <!-- ################################################################################################ -->

                    <!-- ################################################################################################ -->
                </div>
                <!-- ################################################################################################ -->
                <!-- ################################################################################################ -->
                <div class="sidebar one_quarter "> 
                    <!-- ################################################################################################ -->
                    <h6>Menu</h6>
                    <jsp:include page="menu.jsp"></jsp:include>

                    <!-- ################################################################################################ -->
                </div>
                <!-- ################################################################################################ -->
                <!-- / main body -->
                <div class="clear"></div>
            </main>
        </div>

        <div class="wrapper row5">
            <div id="copyright" class="hoc clear"> 
                <!-- ################################################################################################ -->
                <p class="fl_left">Copyright &copy; 2016 - All Rights Reserved - <a href="#">Domain Name</a></p>
                <p class="fl_right">Template by <a target="_blank" href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
                <!-- ################################################################################################ -->
            </div>
        </div>
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
        <!-- JAVASCRIPTS -->
        <script src="layout/scripts/jquery.min.js"></script>
        <script src="layout/scripts/jquery.backtotop.js"></script>
        <script src="layout/scripts/jquery.mobilemenu.js"></script>
    </body>
</html>
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

        <script>
            var images = [];
            function showModel(id) {
                var modal = document.getElementById('myModal');
                var img = document.getElementById(id);
                var modalImg = document.getElementById("img01");
                var captionText = document.getElementById("caption");

                modal.style.display = "block";
                modalImg.src = img.src;

                var span = document.getElementsByClassName("close")[0];
                span.onclick = function () {
                    modal.style.display = "none";
                }
            }
        </script>
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
            <div class="wrapper row1">
                <header id="header" class="hoc clear"> 
                    <!-- ################################################################################################ -->
                    <div id="logo" class="fl_left">
                        <h1><a href="${pageContext.request.contextPath}/IndexServlet">Bất Động Sản</a></h1>
                    </div>
                    <nav id="mainav" class="fl_right">

                    </nav>
                    <!-- ################################################################################################ -->
                </header>
            </div>
            <!-- ################################################################################################ -->
            <!-- ################################################################################################ -->
            <!-- ################################################################################################ -->
            <div id="pageintro" class="hoc clear"> 
                <!-- ################################################################################################ -->

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
                <div class="content three_quarter first"> 
                    <!-- ################################################################################################ -->
                    <c:import url="${pageContext.request.contextPath}/GetDetail?id=${uri}" var="listItem"></c:import>

                    <x:parse xml="${listItem}" var="myXML" ></x:parse>

                        <h1><x:out select="$myXML/detail/title"></x:out></h1>
                        Khu vực : 
                        <a href='${pageContext.request.contextPath}/IndexServlet?id=<x:out select="$myXML/detail/desc"></x:out>'>
                        <x:out select="$myXML/detail/location"></x:out>
                        </a>
                        <p>
                            Giá cả :     <x:out select="$myXML/detail/price"></x:out>
                        Diện tích : <x:out select="$myXML/detail/area"></x:out>
                        </p>
                        <h1>Thông tin mô tả</h1>
                        <p>
                        <x:out select="$myXML/detail/content" escapeXml="false"></x:out>
                        </p>
                        <div id="gallery">
                            <figure>
                                <header class="heading">Thông tin Ảnh</header>
                                <ul class="nospace clear">

                                <x:forEach select="$myXML/detail/images/image"  var="item" varStatus="loop">

                                    <script>
                                        images.push('<x:out select="$item/url"></x:out>');
                                        </script>
                                        <li class="one_quarter  
                                        <c:if test="${loop.index !=0 && loop.index %3 ==0 }">
                                            first
                                        </c:if>">

                                        <img id="myImg${loop.index+1}" class="myImg" src="<x:out select="$item/url"></x:out>" alt="Trolltunga, Norway" width="300" height="200"
                                             onclick ="showModel('myImg${loop.index+1}')"
                                             >

                                    </li>
                                </x:forEach>


                            </ul>
                            <!-- The Modal -->
                            <div id="myModal" class="modal">

                                <!-- The Close Button -->
                                <span class="close">&times;</span>

                                <!-- Modal Content (The Image) -->
                                <img class="modal-content" id="img01">

                                <!-- Modal Caption (Image Text) -->
                                <div id="caption"></div>
                            </div>

                        </figure>
                    </div>
                    <h1>Thông tin dự án & Đặc điểm bất động sản</h1>
                    <div class="scrollable">
                        <table>
                            <thead>
                                <tr>
                                    <th>Tiêu Đề</th>
                                    <th>Nội Dung</th>
                                </tr>
                            </thead>
                            <x:forEach select="$myXML/detail/landdetail/lands" var="item">
                                <tr>
                                    <td><x:out select="$item/header"></x:out></td>
                                    <td><x:out select="$item/content"></x:out></td>
                                    </tr>
                            </x:forEach>

                        </table>

                        <h1>Thông tin Liên hệ</h1>
                        <div class="scrollable">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Tiêu Đề</th>
                                        <th>Nội Dung</th>
                                    </tr>
                                </thead>
                                <x:forEach select="$myXML/detail/landlorddetail/lands" var="item">
                                    <tr>
                                        <td><x:out select="$item/header"></x:out></td>
                                        <td><x:out select="$item/content"></x:out></td>
                                        </tr>
                                </x:forEach>

                            </table>
                        </div>
                        <p>
                            <x:out select="$myXML/detail/type" escapeXml="false"></x:out>
                            </p>
                            <!-- ################################################################################################ -->
                        </div>
                    </div>

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
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->

        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->

        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->

        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->

        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->

        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
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
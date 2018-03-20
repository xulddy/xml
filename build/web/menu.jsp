<%-- 
    Document   : menu
    Created on : Mar 19, 2018, 11:07:03 PM
    Author     : tan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="sdb_holder">
    <ul>

        <li><a href="${pageContext.request.contextPath}/IndexServlet?id=nha-dat-ban">Nhà Đất bán</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/IndexServlet?id=/nha-dat-ban">Bán căn hộ chung cư</a></li>
                <li><a href="${pageContext.request.contextPath}/IndexServlet?id=/ban-nha-rieng">Bán nhà riêng</a></li>
                <li><a href="${pageContext.request.contextPath}/IndexServlet?id=/ban-nha-biet-thu-lien-ke" class="haslink ">Bán nhà biệt thự, liền kề</a></li>
                <li><a href="${pageContext.request.contextPath}/IndexServlet?id=/ban-nha-mat-pho" class="haslink ">Bán nhà mặt phố</a></li>
                <li><a href="${pageContext.request.contextPath}/IndexServlet?id=/ban-dat-nen-du-an class="haslink ">Bán đất nền dự án</a></li>
                <li><a href="${pageContext.request.contextPath}/IndexServlet?id=/ban-dat" class="haslink ">Bán đất</a></li>
                <li><a href="${pageContext.request.contextPath}/IndexServlet?id=/ban-trang-trai-khu-nghi-duong" class="haslink ">Bán trang trại, khu nghỉ dưỡng</a></li>
                <li><a href="${pageContext.request.contextPath}/IndexServlet?id=/ban-kho-nha-xuong" class="haslink ">Bán kho, nhà xưởng</a></li>
                <li><a href="${pageContext.request.contextPath}/IndexServlet?id=/ban-loai-bat-dong-san-khac" class="haslink ">Bán loại bất động sản khác</a></li>
            </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/IndexServlet?id=/nha-dat-cho-thue">Nhà đất cho thuê</a>
            <ul>
                <a href="${pageContext.request.contextPath}/IndexServlet?id=/cho-thue-can-ho-chung-cu">Cho thuê căn hộ chung cư</a>
                <a href="${pageContext.request.contextPath}/IndexServlet?id=/cho-thue-nha-rieng">Cho thuê nhà riêng</a>
                <a href="${pageContext.request.contextPath}/IndexServlet?id=/cho-thue-nha-mat-pho">Cho thuê nhà mặt phố</a>
                <a href="${pageContext.request.contextPath}/IndexServlet?id=/cho-thue-nha-tro-phong-tro">Cho thuê nhà trọ, phòng trọ</a>
                <a href="${pageContext.request.contextPath}/IndexServlet?id=/cho-thue-van-phong">Cho thuê văn phòng</a>
                <a href="${pageContext.request.contextPath}/IndexServlet?id=/cho-thue-cua-hang-ki-ot">Cho thuê cửa hàng - ki ốt</a>
                <a href="${pageContext.request.contextPath}/IndexServlet?id=/cho-thue-kho-nha-xuong-dat">Cho thuê kho, nhà xưởng, đất</a>
                <a href="${pageContext.request.contextPath}/IndexServlet?id=/cho-thue-loai-bat-dong-san-khac">Cho thuê loại bất động sản khác</a>
                
            </ul>
        </li>
    
    </ul>
</nav>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jd" uri="/WEB-INF/TLD/custom.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<!--[if IE 8]><html class="ie8" lang="en"><![endif]-->
<!--[if IE 9]><html class="ie9" lang="en"><![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- start: HEAD -->
<head>
    <!-- start: META -->
    <meta charset="utf-8" />
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="" name="description" />
    <meta content="" name="author" />
    <meta name="renderer" content="webkit"/>

    <!-- start: MAIN CSS -->
    <link rel="stylesheet" href="${ctx}/resources/plugins/bootstrap-3.3.5-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/bootstrap-3.3.5-dist/css/bootstrap-expand.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/DataTables/media/css/jquery.dataTables.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/DataTables/media/css/DT_bootstrap.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/iCheck/skins/all.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/perfect-scrollbar/src/perfect-scrollbar.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/animate.css/animate.min.css">
    <!-- end: MAIN CSS -->
    <!-- start: CSS REQUIRED FOR SUBVIEW CONTENTS -->
    <link rel="stylesheet" href="${ctx}/resources/plugins/summernote/dist/summernote.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/fullcalendar/fullcalendar/fullcalendar.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/toastr/toastr.min.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/uploadify/uploadify.css" />
    <link rel="stylesheet" href="${ctx}/resources/plugins/jQuery-Validation-Engine-master/css/validationEngine.jquery.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/select2-master/dist/css/select2.min.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/select2-bootstrap/dist/select2-bootstrap.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="${ctx}/resources/plugins/sweetalert-master/dist/sweetalert.css">
    <!-- end: CSS REQUIRED FOR THIS SUBVIEW CONTENTS-->
    <!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
    <link rel="stylesheet" href="${ctx}/resources/plugins/bootstrap-social-buttons/bootstrap-social.css">
    <!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
    <!-- start: CORE CSS -->
    <link rel="stylesheet" href="${ctx}/resources/css/styles.css">
    <link rel="stylesheet" href="${ctx}/resources/css/styles-responsive.css">
    <link rel="stylesheet" href="${ctx}/resources/css/plugins.css">
    <link rel="stylesheet" href="${ctx}/resources/css/themes/theme-default.css" type="text/css" id="skin_color">
    <link rel="stylesheet" href="${ctx}/resources/css/print.css" type="text/css" media="print"/>
    <link rel="stylesheet" href="${ctx}/resources/css/quick-layout.css">
    <!-- end: CORE CSS -->
    <link rel="shortcut icon" href="favicon.ico" />
    <!--[if lt IE 9]>
    <script src="${ctx}/resources/plugins/respond.min.js"></script>
    <script src="${ctx}/resources/plugins/excanvas.min.js"></script>
    <script src="${ctx}/resources/plugins/jQuery/jquery-1.11.1.min.js"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src="${ctx}/resources/plugins/jQuery/jquery-2.1.1.min.js"></script>
    <!--<![endif]-->
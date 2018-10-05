<%@ page language="java" pageEncoding="utf-8" %>
<jsp:include page="../../../common/portals-header.jsp"></jsp:include>
<title>自定义tag示例</title>
</head>
<!-- end: HEAD -->
<!-- start: BODY -->
<body>
<div class="container mt30">
    <div class="col-md-12">
        <div class="panel panel-white">
            <div class="panel-heading">
                <h4 class="panel-title">自定义TAG示例 <span class="">一行3列</span></h4>
                <div class="panel-tools">
                    <div class="dropdown">
                        <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                            <i class="fa fa-cog"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <form class="form-horizontal">
                    <!-- 自定义标签 -->

                    <jd:lable id="username" col="3" lable="一二三四五六七八九十">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                    </jd:lable>

                    <!-- 解析后的标签 -->
                    <div class="col-xxxl-3 col-lg-4 col-sm-6 col-xs-12">
                        <div class="form-group"><label class="col-sm-3 control-label ell" for="name">一二三四五六七八九十：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                            </div>
                        </div>
                    </div>

                    <jd:lable id="name" col="3" lable="一二三四五六七八">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                    </jd:lable>
                    <jd:lable id="name" col="3" lable="一二三四五六">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                    </jd:lable>
                    <jd:lable id="name" col="3" lable="一二三四">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                    </jd:lable>
                    <jd:lable id="name" col="3" lable="一二">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                    </jd:lable>
                </form>
            </div>
        </div>
        <div class="panel panel-white">
            <div class="panel-heading">
                <h4 class="panel-title">自定义TAG示例 <span class="">一行2列</span></h4>
                <div class="panel-tools">
                    <div class="dropdown">
                        <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                            <i class="fa fa-cog"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <form class="form-horizontal">
                    <jd:lable id="name" col="2" lable="一二三四五六七八九十">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                    </jd:lable>
                    <jd:lable id="name" col="2" lable="一二三四五六七八">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                    </jd:lable>
                    <jd:lable id="name" col="2" lable="一二三四五六">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                    </jd:lable>
                    <jd:lable id="name" col="2" lable="一二三四">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                    </jd:lable>
                </form>
            </div>
        </div>
        <div class="panel panel-white">
            <div class="panel-heading">
                <h4 class="panel-title">自定义TAG示例 <span class="">一行1列</span></h4>
                <div class="panel-tools">
                    <div class="dropdown">
                        <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                            <i class="fa fa-cog"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <form class="form-horizontal">
                    <jd:lable id="name" col="1" lable="一二三四五六七八九十">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                    </jd:lable>
                    <jd:lable id="name" col="1" lable="一二三四五六七八">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                    </jd:lable>
                    <jd:lable id="name" col="1" lable="一二三四五六">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Text Field">
                    </jd:lable>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../../common/portals-bottom.jsp"></jsp:include>
</body>
<!-- end: BODY -->
</html>


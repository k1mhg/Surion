<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html lang="ko">
<%@ include file="../common/front_header.jsp" %>
<style>
	body{
		background: #fff !important;
	}

	#my_page_right{
		padding: 35px 30px;
	}


	#navLink a:nth-child(${pageview}){
		color: red !important;
	}
</style>
<body>
<%@ include file="../common/header.jsp" %>
<div class="suriSize">
    <div class="container">
        <div class="row justify-content-between" style="min-height: 500px;">
            <%@ include file="../common/communiSidebar.jsp" %>
			<div class="col-lg-9" id="my_page_right">
			<div class="inner-main-body p-2 p-sm-3 collapse forum-content show">
                <div class="card mb-2">
                    <div class="card-body p-2 p-sm-3">
                        <div class="media forum-item">
                            <a href="#" data-toggle="collapse" data-target=".forum-content"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="mr-3 rounded-circle" width="50" alt="User"></a>
                            <div class="media-body">
                                <h6><a href="#" data-toggle="collapse" data-target=".forum-content" class="text-body">Realtime fetching data</a></h6>
                                <p class="text-secondary">
                                    lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet
                                </p>
                                <!-- <p class="text-muted"><a href="javascript:void(0)">drewdan</a> replied  --><span class="text-secondary font-weight-bold">13 minutes ago</span><p></p>
                            </div>
                            <div class="text-muted small text-center align-self-center">
                                <span class="d-none d-sm-inline-block"><i class="fa-light fa-thumbs-up"></i> 19</span>
                                <span class="like"><i class="far fa-comment ml-2"></i> 3</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-2">
                    <div class="card-body p-2 p-sm-3">
                        <div class="media forum-item">
                            <a href="#" data-toggle="collapse" data-target=".forum-content"><img src="https://bootdey.com/img/Content/avatar/avatar2.png" class="mr-3 rounded-circle" width="50" alt="User"></a>
                            <div class="media-body">
                                <h6><a href="#" data-toggle="collapse" data-target=".forum-content" class="text-body">Laravel 7 database backup</a></h6>
                                <p class="text-secondary">
                                    lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet
                                </p>
                                <!-- <p class="text-muted"><a href="javascript:void(0)">jlrdw</a> replied  --><span class="text-secondary font-weight-bold">3 hours ago</span><p></p>
                            </div>
                            <div class="text-muted small text-center align-self-center">
                                <span><i class="fa-light fa-thumbs-up"></i> 18</span>
                                <span class="like"><i class="far fa-comment ml-2"></i> 1</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-2">
                    <div class="card-body p-2 p-sm-3">
                        <div class="media forum-item">
                            <a href="#" data-toggle="collapse" data-target=".forum-content"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" class="mr-3 rounded-circle" width="50" alt="User"></a>
                            <div class="media-body">
                                <h6><a href="#" data-toggle="collapse" data-target=".forum-content" class="text-body">Http client post raw content</a></h6>
                                <p class="text-secondary">
                                    lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet
                                </p>
                                <!-- <p class="text-muted"><a href="javascript:void(0)">ciungulete</a> replied --> <span class="text-secondary font-weight-bold">7 hours ago</span><p></p>
                            </div>
                            <div class="text-muted small text-center align-self-center">
                                <span><i class="fa-light fa-thumbs-up"></i> 32</span>
                                <span class="like"><i class="far fa-comment ml-2"></i> 2</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-2">
                    <div class="card-body p-2 p-sm-3">
                        <div class="media forum-item">
                            <a href="#" data-toggle="collapse" data-target=".forum-content"><img src="https://bootdey.com/img/Content/avatar/avatar4.png" class="mr-3 rounded-circle" width="50" alt="User"></a>
                            <div class="media-body">
                                <h6><a href="#" data-toggle="collapse" data-target=".forum-content" class="text-body">Top rated filter not working</a></h6>
                                <p class="text-secondary">
                                    lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet
                                </p>
                                <!-- <p class="text-muted"><a href="javascript:void(0)">bugsysha</a> replied --> <span class="text-secondary font-weight-bold">11 hours ago</span><p></p>
                            </div>
                            <div class="text-muted small text-center align-self-center">
                                <span class="d-none d-sm-inline-block"><i class="fa-light fa-thumbs-up"></i> 49</span>
                                <span class="like"><i class="far fa-comment ml-2"></i> 9</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-2">
                    <div class="card-body p-2 p-sm-3">
                        <div class="media forum-item">
                            <a href="#" data-toggle="collapse" data-target=".forum-content"><img src="https://bootdey.com/img/Content/avatar/avatar5.png" class="mr-3 rounded-circle" width="50" alt="User"></a>
                            <div class="media-body">
                                <h6><a href="#" data-toggle="collapse" data-target=".forum-content" class="text-body">Create a delimiter field</a></h6>
                                <p class="text-secondary">
                                    lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet
                                </p>
                                <!-- <p class="text-muted"><a href="javascript:void(0)">jackalds</a> replied  --><span class="text-secondary font-weight-bold">12 hours ago</span><p></p>
                            </div>
                            <div class="text-muted small text-center align-self-center">
                                <span class="d-none d-sm-inline-block"><i class="fa-light fa-thumbs-up"></i> 65</span>
                                <span class="like"><i class="far fa-comment ml-2"></i> 10</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-2">
                    <div class="card-body p-2 p-sm-3">
                        <div class="media forum-item">
                            <a href="#" data-toggle="collapse" data-target=".forum-content"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="mr-3 rounded-circle" width="50" alt="User"></a>
                            <div class="media-body">
                                <h6><a href="#" data-toggle="collapse" data-target=".forum-content" class="text-body">One model 4 tables</a></h6>
                                <p class="text-secondary">
                                    lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet
                                </p>
                                <!-- <p class="text-muted"><a href="javascript:void(0)">bugsysha</a> replied --> <span class="text-secondary font-weight-bold">14 hours ago</span><p></p>
                            </div>
                            <div class="text-muted small text-center align-self-center">
                                <span class="d-none d-sm-inline-block"><i class="fa-light fa-thumbs-up"></i> 45</span>
                                <span class="like"><i class="far fa-comment ml-2"></i> 4</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-2">
                    <div class="card-body p-2 p-sm-3">
                        <div class="media forum-item">
                            <a href="#" data-toggle="collapse" data-target=".forum-content"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="mr-3 rounded-circle" width="50" alt="User"></a>
                            <div class="media-body">
                                <h6><a href="#" data-toggle="collapse" data-target=".forum-content" class="text-body">Auth attempt returns false</a></h6>
                                <p class="text-secondary">
                                    lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet
                                </p>
                                <!-- <p class="text-muted"><a href="javascript:void(0)">michaeloravec</a> replied  --><span class="text-secondary font-weight-bold">18 hours ago</span><p></p>
                            </div>
                            <div class="text-muted small text-center align-self-center">
                                <span class="d-none d-sm-inline-block"><i class="fa-light fa-thumbs-up"></i> 70</span>
                                <span class="like"><i class="far fa-comment ml-2"></i> 3</span>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="pagination pagination-sm pagination-circle justify-content-center mb-0">
                    <li class="page-item disabled">
                        <span class="page-link has-icon"><i class="material-icons">chevron_left</i></span>
                    </li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0)">1</a></li>
                    <li class="page-item active"><span class="page-link">2</span></li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                    <li class="page-item">
                        <a class="page-link has-icon" href="javascript:void(0)"><i class="material-icons">chevron_right</i></a>
                    </li>
                </ul>
            </div>
        </div> <!-- //row -->
    </div> <!-- //container -->
</div><!-- //suriSize -->
</div>
</body>

<%@ include file="../common/footer.jsp" %>



</body>
</html>
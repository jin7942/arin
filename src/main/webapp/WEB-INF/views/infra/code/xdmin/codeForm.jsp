<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>My Admin Page</title>

 		<!-- Custom fonts for this template-->
        <link href="/resources/template_admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />

        <!-- Custom styles for this template-->
        <link href="/resources/template_admin/css/sb-admin-2.min.css" rel="stylesheet" />

        <style>
            select option[value=''][disabled] {
                display: none;
            }
        </style>

        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
            integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"
            integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK"
            crossorigin="anonymous"
        ></script>
    </head>


    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Admin <sup>2</sup></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0" />

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="index.html">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a
                    >
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider" />

                <!-- Heading -->
                <div class="sidebar-heading">Interface</div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a
                        class="nav-link collapsed"
                        href="#"
                        data-toggle="collapse"
                        data-target="#collapseTwo"
                        aria-expanded="true"
                        aria-controls="collapseTwo"
                    >
                        <i class="fas fa-fw fa-cog"></i>
                        <span>코드관리</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="/codegroup/codeGroupList">코드 그룹 관리</a>
                            <a class="collapse-item" href="/code/codeList">코드 관리</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a
                        class="nav-link collapsed"
                        href="#"
                        data-toggle="collapse"
                        data-target="#collapseUtilities"
                        aria-expanded="true"
                        aria-controls="collapseUtilities"
                    >
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>회원관리</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="/member/memberList">회원목록</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a
                        class="nav-link collapsed"
                        href="#"
                        data-toggle="collapse"
                        data-target="#collapseUtilities"
                        aria-expanded="true"
                        aria-controls="collapseUtilities"
                    >
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>로그관리</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="">로그목록</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider" />

                <!-- Heading -->
                <div class="sidebar-heading">Addons</div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a
                        class="nav-link collapsed"
                        href="#"
                        data-toggle="collapse"
                        data-target="#collapsePages"
                        aria-expanded="true"
                        aria-controls="collapsePages"
                    >
                        <i class="fas fa-fw fa-folder"></i>
                        <span>페이지 관리</span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Login Screens:</h6>
                            <a class="collapse-item" href="">Login</a>
                            <a class="collapse-item" href="">Register</a>
                            <a class="collapse-item" href="">Forgot Password</a>
                            <div class="collapse-divider"></div>
                            <h6 class="collapse-header">Other Pages:</h6>
                            <a class="collapse-item" href="">404 Page</a>
                        </div>
                    </div>
                </li>

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
            </ul>
            <!-- End of Sidebar -->->

			<!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a
                                    class="nav-link dropdown-toggle"
                                    href="#"
                                    id="userDropdown"
                                    role="button"
                                    data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                >
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                    <img class="img-profile rounded-circle" src="img/undraw_profile.svg" />
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <h1 class="h3 mb-4 text-gray-800">코드 관리</h1>

                        <div class="row">
                            <div class="col-lg-12">
                                <!-- Search-area -->
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <form method="GET" action="" id="form" name="form">
                                            <div style="display: flex">
                                                <div class="col-6">
                                                	<input type="hidden" id="ifccSeq" name="ifccSeq" value="<c:out value="${item.ifccSeq}"/>" />
                                                
	                                                <label for="input33" class="form-label">코드그룹</label>
	                                                <select class="form-control" id="ifcgSeq" name="ifcgSeq">
	                                                <c:forEach items="${list}" var="list" varStatus="status">
	                                                	<option value="<c:out value="${list.ifcgSeq}"/>" >
	                                                		<c:out value="${list.ifcgNameKor}"/>
	                                                	</option>
	                                                </c:forEach>
	                                                </select>
<!--                                                 
                                                    <label for="input1" class="form-label">코드그룹 코드</label>
                                                    <input type="text" id="input1" class="form-control" placeholder="영문(대소문자),숫자" />
 -->
                                                    <label for="ifcgNameKor" class="form-label">코드그룹 이름(한글) * </label>
                                                    <input type="text" id="ifccNameKor" name="ifccNameKor" class="form-control" placeholder="한글, 숫자" 
                                                    		value="<c:out value="${item.ifccNameKor}"/>" />

                                                    <label for="ifccUseNY" class="form-label">사용여부  * </label>
                                                    <select class="form-control" id="ifccUseNY" name="ifccUseNY">
                                                        <option value="0" <c:if test="${item.ifccUseNY eq 0}"  >selected</c:if>>N</option>
                                                        <option value="1" <c:if test="${item.ifccUseNY eq 1}"  >selected</c:if>>Y</option>
                                                    </select>

                                                    <label for="ifccDescription" class="form-label">설명</label>
                                                    <textarea class="form-control" name="ifccDescription" id="ifccDescription" cols="10" rows="2" style="text-align: left;"><c:out value="${item.ifccDescription}"/></textarea>
                             

                                                    <label for="input5" class="form-label">예비1 (varchar type)</label>
                                                    <input type="text" id="input5" class="form-control" placeholder="영문(대소문자),숫자" />

                                                    <label for="input6" class="form-label">예비3 (varchar type)</label>
                                                    <input type="text" id="input6" class="form-control" placeholder="영문(대소문자),숫자" />

                                                    <label for="input7" class="form-label">예비1 (int type)</label>
                                                    <input type="text" id="input7" class="form-control" placeholder="숫자" />

                                                    <label for="input8" class="form-label">예비3 (int type)</label>
                                                    <input type="text" id="input8" class="form-control" placeholder="숫자" />
                                                </div>

                                                <div class="col-6">
                                                    <label for="input9" class="form-label">코드그룹 코드 (Another)</label>
                                                    <input type="text" id="input9" class="form-control" placeholder="영문(대소문자),숫자" />

                                                    <label for="ifccNameEng" class="form-label">코드그룹 이름 (영문) * </label>
                                                    <input type="text" id="ifccNameEng" name="ifccNameEng" class="form-control" placeholder="영문(대소문자),숫자"
                                                    		value="<c:out value="${item.ifccNameEng}"/>" />

                                                    <label for="input11" class="form-label">숫자</label>
                                                    <input type="text" id="input11" class="form-control" placeholder="숫자" />

                                                    <label for="ifccDelNY" class="form-label">삭제여부 * </label>
                                                    <select class="form-control" id="ifccDelNY" name="ifccDelNY">
                                                        <option value="0" <c:if test="${item.ifccDelNY eq 0}"  >selected</c:if>>N</option>
                                                        <option value="1" <c:if test="${item.ifccDelNY eq 1}"  >selected</c:if>>Y</option>
                                                    </select>

                                                    <label for="input13" class="form-label">예비2 (varchar type)</label>
                                                    <input type="text" id="input13" class="form-control" placeholder="영문(대소문자),숫자" />

                                                    <label for="input14" class="form-label">예비1 (int type)</label>
                                                    <input type="text" id="input14" class="form-control" placeholder="숫자" />
                                                    <div>
                                                   		<button type="button" class="btn btn-primary" id="btnSave">등록</button>
                                                   		<button type="button" class="btn btn-danger" id="btnUelete">삭제</button>
                                                   	</div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2020</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->
            </div>
            <!-- End of Content Wrapper -->
        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="/resources/template_admin/vendor/jquery/jquery.min.js"></script>
        <script src="/resources/template_admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="/resources/template_admin/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="/resources/template_admin/js/sb-admin-2.min.js"></script>

        <!-- fontawesome-icon -->
        <script src="https://kit.fontawesome.com/287e3e129e.js" crossorigin="anonymous"></script>
        
        <script type="text/javascript">
	    	var goUrlList = "/code/codeList"; 			/* #-> */
	    	var goUrlInst = "/code/codeInst"; 			/* #-> */
	    	var goUrlUpdt = "/code/codeUpdt";				/* #-> */
	    	var goUrlUele = "/code/codeUele";				/* #-> */
	    	var goUrlDele = "/code/codeDele";				/* #-> */
	    	
	    	var seq = $("input:hidden[name=ifcgSeq]");				/* #-> */
	    	
	    	var form = $("form[name=form]");
	    	var formVo = $("form[name=formVo]");
	    	
	    	
	    	$("#btnSave").on("click", function(){
	    		if (seq.val() == "0" || seq.val() == ""){
	    	   		// insert
	    	   		/* if (validationInst() == false) return false; */
	    	   		form.attr("action", goUrlInst).submit();
	    	   	} else {
	    	   		// update
	    	   		/* keyName.val(atob(keyName.val())); */
	    	   		/* if (validationUpdt() == false) return false; */
	    	   		form.attr("action", goUrlUpdt).submit();
	    	   	}
	    	});
	    	
	    	$("#btnUelete").on("click", function(){
	    		if (seq.val() == "0" || seq.val() == ""){
	    	   		// insert
	    	   		/* if (validationInst() == false) return false; */
	    	   		alert("tset");
	    	   		return false;
	    	   	} else {
	    	   		form.attr("action", goUrlUele).submit();
	    	   	}
	    	});
        
        </script>
    </body>
</html>


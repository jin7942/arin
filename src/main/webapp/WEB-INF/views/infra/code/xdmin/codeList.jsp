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
            <!-- End of Sidebar -->

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

            <!-- Content Wrapper -->
          
                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <h1 class="h3 mb-4 text-gray-800">코드 관리</h1>

                        <div class="row">
                            <div class="col-lg-12">
                                <!-- Search-area -->
                                <div class="card shadow mb-4">
                                    <div class="card-body">
	                                 	<!-- Search Form -->
	                                     <form 
	                                     	class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" 
	                                     	method="GET"
	                                     	action="/code/codeList"
	                                     >
                                            <select id="shOptionDelNY" name="shOptionDelNY" class="select btn btn-secondary dropdown-toggle">
                                                <option value="0" selected <c:if test="${empty vo.shOptionDelNY}"  >selected</c:if>>삭제여부</option>
                                                <option value="0" <c:if test="${vo.shOptionDelNY eq 0}"  >selected</c:if>>N</option>
                                                <option value="1" <c:if test="${vo.shOptionDelNY eq 1}"  >selected</c:if>>Y</option>
                                            </select>

                                            <select id="shOptionSort" name="shOptionSort" class="select btn btn-secondary dropdown-toggle">
                                                <option value="1" selected <c:if test="${empty vo.shOptionSort}"  >selected</c:if>>정렬구분</option>
                                                <option value="1" <c:if test="${vo.shOptionSort eq 1}"  >selected</c:if>>시퀀스</option>
                                                <option value="2" <c:if test="${vo.shOptionSort eq 2}"  >selected</c:if>>등록일</option>
                                                <option value="3" <c:if test="${vo.shOptionSort eq 3}"  >selected</c:if>>수정일</option>
                                            </select>

                                             <select id="shOptionDate" name="shOptionDate" class="select btn btn-secondary dropdown-toggle">
                                                <option value="" disabled selected <c:if test="${vo.shOptionDate eq null}"  >selected</c:if>> 검색구분</option>
                                                <option value="1" <c:if test="${vo.shOptionDate eq 1}"  >selected</c:if>>등록일</option>
                                                <option value="2" <c:if test="${vo.shOptionDate eq 2}"  >selected</c:if>>수정일</option>
                                            </select>

                                            <input
                                            	id="shStartDate"
                                            	name="shStartDate"
                                                type="date"
                                                value="<c:out value="${vo.shStartDate}"/>"
                                                class="form-control bg-light border-0 small"
                                                placeholder="시작일"
                                                aria-label="Search"
                                                aria-describedby="basic-addon2"
                                            />
                                            <input
                                            	id="shEndDate"
                                            	name="shEndDate"
                                                type="date"
                                                value="<c:out value="${vo.shEndDate}"/>"
                                                class="form-control bg-light border-0 small"
                                                placeholder="종료일"
                                                aria-label="Search"
                                                aria-describedby="basic-addon2"
                                            />
                                            	
                                            	<!-- rows -->
												<select id="shOptionRows" name="shOptionRows" class="select btn btn-secondary dropdown-toggle">
													<option value="">10</option>
													<option value="2" <c:if test="${vo.shOptionRows eq 2}"  >selected</c:if>>20</option>
													<option value="3" <c:if test="${vo.shOptionRows eq 3}"  >selected</c:if>>30</option>
												</select>

                                            <br />
                                            <br />
	
                                            <div class="input-group">
                                            	<!-- TODO : 검색 조건 추가 -->
                                            	<select id="shOptionValue" name="shOptionValue" class="select btn btn-secondary dropdown-toggle">
													<option value="" <c:if test="${empty vo.shOptionValue}"  >selected</c:if>>검색구분</option>
													<option value="1" <c:if test="${vo.shOptionValue eq 1}"  >selected</c:if>>이름</option>
                                            	</select>

                                                <input
                                                	id="shValue"
                                                	name="shValue"
                                                	value="<c:out value="${vo.shValue}"/>"
                                                    type="text"
                                                    class="form-control bg-light border-0 small"
                                                    placeholder="Search for..."
                                                    aria-label="Search"
                                                    aria-describedby="basic-addon2"
                                                />
	                                            <!-- icons -->
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary" type="submit">
                                                        <i class="fas fa-search fa-sm"></i>
                                                    </button>
                                                    <button class="btn btn-dark" type="button" onclick="refresh()">
                                                        <i class="fa-solid fa-arrow-rotate-right"></i>
                                                    </button>
                                                </div>


                                            </div>
                                        </form>
                                        <!-- End Of Search Form -->
                                    </div>
                                </div>   
                                        
                                <!-- End of Search area -->

                                <!-- Table area -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">total : </h6>
                                    </div>
                                    <div class="card-body">
                                        <table class="table table-hover" id="table">
                                            <!-- table-caption -->
                                            <caption style="caption-side: top; text-align: right">
                                            
												
											</caption>
										<!-- table-header -->
										
										<thead class="table-dark">
											<tr>
												<td><input type="checkbox" id="chkAll" onclick="chkAll()" /></td>
												<td>#</td>
												<td>seq</td>
												<td>이름(영문)</td>
												<td>이름(한글)</td>
												<td>사용여부</td>
												<td>삭제여부</td>
												<td>그룹코드</td>
											</tr>
										</thead>

										<!-- table-body -->
										<c:choose>
											<c:when test="${fn:length(list) eq 0 }">
												<tr>
													<td colspan="10" >No Data..</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${list}" var="list" varStatus="status">
													<tr onclick="location.href='/code/codeView?ifccSeq=${list.ifccSeq}'">
														<td><input type="checkbox" class="chkbox" onclick="event.cancelBubble=true"/></td>
														<td><%-- <c:out value="${vo.totalRows +((vo.thispage) * vo.rowNumToShow + status.index) + 1 }"></c:out> --%></td>
														<td><c:out value="${list.ifccSeq}"></c:out></td>
														<td><c:out value="${list.ifccNameEng}"></c:out></td>
														<td><c:out value="${list.ifccNameKor}"></c:out></td>
														<td><c:out value="${list.ifccUseNY}"></c:out></td>
														<td><c:out value="${list.ifccDelNY}"></c:out></td>
														<td><c:out value="${list.infrCodeGroup_ifcgSeq}"></c:out></td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</table>
                                        <!-- End of Table -->

                                        <!-- pagination -->
                                        <nav aria-label="...">
                                            <ul class="pagination pagination-sm justify-content-center">
                                                <li class="page-item active" aria-current="page"><span class="page-link">1</span></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                                <li class="page-item"><a class="page-link" href="#"><b>></b></a></li>
                                            </ul>
                                        </nav>
                                        <!-- End of pagination -->
                                        <button
                                            type="button"
                                            class="btn btn-danger"
                                            style="float: left"
                                            onclick="delRow()"
                                        >
                                            <i class="fa-solid fa-trash-can"></i>
                                        </button>

                                        <button
                                            type="button"
                                            class="btn btn-primary"
                                            style="float: right"
                                            onclick="location.href='/code/codeForm'"
                                        >
                                            <i class="fa-solid fa-plus"></i>
                                        </button>
                                        <button
                                            type="button"
                                            class="btn btn-success"
                                            style="float: right"
                                        >
                                            <i class="fa-solid fa-file-excel"></i>
                                        </button>
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
        
        <!-- temp -->
        <script type="text/javascript">
        	function refresh() {
        		location.href="/code/codeList";
			}
        	
        	function delRow(val) {
        	    
        	}
        	
        	function chkAll() {
        	    const list = document.querySelectorAll('.chkbox');

        	    for (let i = 0; i < list.length; i++) {
        	        list[i].checked = document.getElementById('chkAll').checked ? true : false;
        	    }
        	}

        </script>
    </body>
</html>
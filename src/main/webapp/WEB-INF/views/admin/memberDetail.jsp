<%@page import="oracle.net.aso.a"%>
<%@page import="report.model.vo.AdminCount"%>
<%@page import="report.model.vo.AllWrite"%>
<%@page import="report.model.vo.AdminMember"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
	.top{
	background-color :#FFFDC6;
	margin : 0px;
	height:210px;
	}
	#profile{
	width:120px;
	heigh:120px;
	border-radius:50px;
	margin-left: 180px;
	background: white;
	}
	.leftmenu>a{
		height:70px;
		font-size: 20px;
		font-weight: 600;
		color: gray;
	}
	#leftnavi>li:nth-child(1)>a{
		color: #f57c00;
		font-size: 22px;
	}
	.mypage{
	color: #f57c00;
	font-size: 30px;
	font-weight:600;
	padding-top:10px;
	margin-left: 40px;
	}
	.head>div{
	display: inline-block;
	vertical-align: middle;
	}
    .content{
       flex-grow: 1;
    }
    .top>.container{
    	margin-top: 0px;
    	
    }
    #row{
    	margin: 30px auto 100px;
    }
    #leftnavi{
    	text-align:left;
    	margin: 0;
    }
    .headtext{
    	margin-left: 20px;
    }
    .headtext>div:first-child{
    	color: #f57c00;
    	font-weight: 600;
    }
    .headtext>div:nth-child(2){
    	color: #e95420;
    	font-weight: 600;
    	font-size: 37px;
    }
    .headtext>span{
    	font-weight: 600;
    	line-height: 25px;
    }
    .headtext>span a{
    	text-decoration: none;
    	color: green;
    }
    p{
    	color: #f57c00;
    	font-weight: 600;
    	font-size: 30px
    }
    #p{
    	margin-top: 30px;
    	border-top:1px solid #F5F5F5;
    	border-bottom: 3px solid #f57c00; 
    	padding-bottom: 10px;
    	padding-top: 10px;
    }
    #contentright{
    	margin-top: 0px;
    }
    #mprofile{
    	background-color:#E9ECEF;
    	width:120px;
    	height:120px;
    	border-radius:50px;
    }
    #info>span{
    font-size: 20px;
    }
    #topleft{
    	padding-top:30px;
    	margin-left: 20px;
    }

    .nav-tabs a{
    	width: 258px;
    	text-align: center;
    }
    #tabmenu{
    	margin-top:30px;
    	margin-left: 0px;
    }
    table{
    	text-align: center;
    }
    #mygo{
		text-decoration: none;
	}
	
	#back{
		margin-top:60px;
		text-align: center;
	}
	#mygo{
		text-decoration: none;
	}
	#a{
	 text-decoration: none;
	}
</style>
</head>
<body>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			<div class="content" >
				<div class="top" style="back">
					<div class="container">
						<div class="mypage">MY PAGE</div>
						<div class="head">
							<div>
							<c:choose>
							<c:when test="${empty sessionScope.m.filePath }">
							<img id="profile" src="/img/orange.png" >
							</c:when>
							<c:otherwise>
							<img id="profile" src="/upload/member/${sessionScope.m.filePath }" >
							</c:otherwise>
							</c:choose>
							</div>
							<div class="headtext">
								<div>????????? ????????? ????????? ???????????????:)</div>
								<div>????????? [${sessionScope.m.memberName }]???!</div>
								<span><a href="/chart?num=1">??? ????????????</a>:${sessionScope.ac.alljoin } </span>
								<span>?????? ???????????? : ${sessionScope.ac.newjoin}</span>
								<br>
								<span>??? ?????? : ${sessionScope.ac.alltrade+ac.allfree }</span>
								<span>?????? ??? ?????? : ${sessionScope.ac.newfree+ac.newtrade }</span>
							</div>
						</div>
					</div>
				</div>
				<div class="row container" id="row">
					<div class="col-lg-2">
					  <ul class="nav flex-column" id="leftnavi">
					    <li class="nav-item leftmenu">
					      <a class="nav-link" href="/adminPage?reqPage=1">??????????????????</a>
					    </li>
					    <li class="nav-item leftmenu">
					      <a class="nav-link" href="/boardAdmin">?????????/????????????</a>
					    </li>
					    <li class="nav-item leftmenu">
					      <a class="nav-link" href="/reportListMore?reqPage=1">?????????????????????</a>
					    </li>
					    <li class="nav-item leftmenu">
					      <a class="nav-link" href="/myUserInfo?local1=${sessionScope.m.local1 }&local2=${sessionScope.m.local2}&local3=${sessionScope.m.local3}" >????????????</a>
					    </li>
					  </ul>
					</div>
					<div class="col-lg-10">
						<div class="detailtop d-flex">
						<div>
						<c:choose>
							<c:when test="${empty member.filepath }">
							<img src="/img/orange.png" id="mprofile">
							</c:when>
							<c:otherwise>
							<img src="/upload/member/${member.filepath }" id="mprofile">
							</c:otherwise>
						</c:choose>
						</div>
						<div id="topleft">
							<div id="info">
								<span>${member.memberId } /</span>
								<span>${member.memberName } /</span>
							</div>
							<div id="info">
								<span>${member.email } /</span>
								<span>
								<c:choose>
									<c:when test="${member.memberLevel eq 9 }">
									????????? /
									</c:when>
									<c:when test="${member.memberLevel eq 3 }">
									???????????? /
									</c:when>
									<c:when test="${member.memberLevel eq 2 }">
									??????????????? /
									</c:when>
									<c:otherwise>
									???????????? /
									</c:otherwise>
								</c:choose>
								</span>
								<span>${member.enrollDate } /</span>
								<span>
								<c:choose>
								 	<c:when test="${member.manner >= 80 }">
								 	<span class="mannerface" style="font-size: 20px; color:#78c46a;">${member.manner } ?????? <img src="/img/happyface.png" style="width: 25px;"></span>
								 	</c:when>
								 	<c:when test="${member.manner >= 50 }">
								 	<span class="mannerface" style="font-size: 20px; color: #ffc600;">${member.manner } ?????? <img src="/img/normalface.png" style="width: 25px;"></span>
								 	</c:when>
								 	<c:otherwise>
								 	<span class="mannerface" style="font-size: 20px; color: #ff5200;">${member.manner } ?????? <img src="/img/sadface.png" style="width: 25px;"></span>
								 	</c:otherwise>
								</c:choose>
								</span>
							</div>
						</div>
						</div>
						<div class="detailcontent">
							 <p id="p">????????? ??? /??????</p>
							  <ul class="nav nav-tabs" id="tabmenu">
								  <li class="nav-item">
								    <a class="nav-link active" data-bs-toggle="tab" href="#home">????????????</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" data-bs-toggle="tab" href="#free">????????????</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" data-bs-toggle="tab" href="#comment">??????</a>
								  </li>
								  <li class="nav-item">
								    <a class="nav-link" data-bs-toggle="tab" href="#review">??????</a>
								  </li>
								  
							   </ul>
								<div id="myTabContent" class="tab-content">
								  <div class="tab-pane fade show active" id="home">
								    <table class="table table-hover">
									    <thead>
									      <tr>
									        <th>?????????</th>
									        <th>?????????</th>
									        <th>?????????</th>
									      </tr>
									    </thead>
									    <tbody>
									    <c:choose>
									    	<c:when test="${empty tradelist }">
									    	<td colspan="3">????????? ?????? ????????????.</td>
									    	</c:when>
									    	<c:otherwise>
									    	 <c:forEach items="${tradelist }" var="a">
										     	<tr>
										        <td>${a.tradeNo }</td>
										        <td><a id="a" href="/tradeView?tradeNo=${a.tradeNo }">${a.tradeTitle }</a></td>
										        <td>${a.tradeRegDate }</td>
										      	</tr>
										     </c:forEach> 
									    	</c:otherwise>
									    </c:choose>
									    </tbody>
								 	 </table>
								  </div>
								  <div class="tab-pane fade" id="free">
								    <table class="table table-hover">
									    <thead>
									      <tr>
									        <th>?????????</th>
									        <th>?????????</th>
									        <th>?????????</th>
									      </tr>
									    </thead>
									    <tbody>
									    <c:choose>
									    	<c:when test="${empty freelist }">
									    	<td colspan="3">????????? ?????? ????????????.</td>
									    	</c:when>
									    	<c:otherwise>
									    	<c:forEach items="${freelist }" var="a">
										     	<tr>
										        <td>${a.freeNo }</td>
										        <td>
										        	<a href="/freeView?freeNo=${a.freeNo }" id="a">${a.freeTitle }</a>
										        </td>
										        <td>${a.freeRegDate }</td>
										      	</tr>
										     </c:forEach> 
									    	</c:otherwise>
									    </c:choose>
									    </tbody>
								 	 </table>
								  </div>
								  <div class="tab-pane fade" id="comment">
								    <table class="table table-hover">
									    <thead>
									      <tr>
									        <th>????????????</th>
									        <th>????????????</th>
									        <th>?????????</th>
									      </tr>
									    </thead>
									    <tbody>
									    <c:choose>
									    	<c:when test="${empty commentlist }">
									    	<td colspan="3">????????? ????????? ????????????.</td>
									    	</c:when>
									    	<c:otherwise>
									    	<c:forEach items="${commentlist }" var="a">
										     	<tr>
										        <td>${a.commentNo }</td>
										        <td>${a.commentContent }</td>
										        <td>${a.cmtDate }</td>
										      </tr>
										     </c:forEach>
									    	</c:otherwise>
									    </c:choose>
									    </tbody>
								 	 </table>
								  </div>
								  <div class="tab-pane fade" id="review">
								    <table class="table table-hover">
									    <thead>
									      <tr>
									        <th>????????????</th>
									        <th>????????????</th>
									        <th>???????????????</th>
									        <th>????????????</th>
									        <th>?????????</th>
									      </tr>
									    </thead>
									    <tbody>
									    <c:choose>
									    	<c:when test="${empty reviewlist }">
									    	<td colspan="5">????????? ????????? ????????????.</td>
									    	</c:when>
									    	<c:otherwise>
									    	<c:forEach items="${reviewlist }" var="a">
										     	<tr>
										        <td>${a.reviewNo }</td>
										        <td>${a.transactionNo }</td>
										        <td>
											        <c:choose>
											        	<c:when test="${a.reviewLike eq 1}">
											        	??????
											        	</c:when>
											        	<c:otherwise>
											        	?????????
											        	</c:otherwise>
											        </c:choose>
										        </td>
										        <td>${a.reviewContent }</td>
										        <td>${a.reviewDate }</td>
										      </tr>
										     </c:forEach>
									    	</c:otherwise>
									    </c:choose>
									    </tbody>
								 	 </table>
								  </div>
								</div>
								<div id="back"><button class="btn btn-warning btn-block" onclick="history.go(-1);" >????????????</button></div>
						</div>
					</div>
				</div>	
			</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
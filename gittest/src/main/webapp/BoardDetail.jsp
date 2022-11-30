
<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.smhrd.domain.Member"%>
<%@ page import="com.smhrd.boarddomain.Member_Board"%>
<%@ page import="com.smhrd.boarddomain.BoardDAO"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

	Member loginMember = (Member)session.getAttribute("loginMember");	

	int board_num = Integer.parseInt(String.valueOf(session.getAttribute("board_num")));
	
	BoardDAO dao = new BoardDAO();
	
	List<Member_Board> board_list = dao.selectBoard(board_num);
	
	

%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>게시글 상세보기</title>
	<style type="text/css">
		
	        #wrap{
	            width: 1300px;
	            margin: 0 auto 0 auto;    
	        }
	    
	        #detailCommunity{
	            text-align :center;
	        }
	        
	        #title{
	            height : 16;
	            font-family :'돋움';
	            font-size : 12;
	            text-align :center;
	            background-color: #F7F7F7;
	        }
	        
	        #btn{
	            font-family :'돋움';
	            font-size : 14;
	            text-align :center;
	        }
 
    	</style>
    	
    	<script type="text/javascript">
	        function changeView(value)
	        {
	            if(value == 0)    
	                location.href='BoardListCon?page=${pageNum}';
	            else if(value == 1)
	                location.href='BoardReplyCon?num=${board.board_num}&page=${pageNum}';
	        }
	        
	        
	        
	 
	        var httpRequest = null;
	        
	        // httpRequest 객체 생성
	        function getXMLHttpRequest(){
	            var httpRequest = null;
	        
	            if(window.ActiveXObject){
	                try{
	                    httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
	                } catch(e) {
	                    try{
	                        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
	                    } catch (e2) { httpRequest = null; }
	                }
	            }
	            else if(window.XMLHttpRequest){
	                httpRequest = new window.XMLHttpRequest();
	            }
	            return httpRequest;    
	        }
	        
	        // 댓글 등록
	        function writeCmt()
	        {
	            var form = document.getElementById("writeCommentForm");
	            
	            var board = form.comment_board.value
	            var id = form.board_id.value
	            var content = form.comment_content.value;
	            
	            if(!content)
	            {
	                alert("내용을 입력하세요.");
	                return false;
	            }
	            else
	            {    
	                var parameter = "comment_board="+board+"&board_id="+id+"&comment_content="+content;
	                    
	                httpRequest = getXMLHttpRequest();
	                httpRequest.onreadystatechange = checkFunc;
	                httpRequest.open("POST", "CommentWriteAction.co", true);    
	                httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8'); 
	                httpRequest.send(parameter);
	            }
	        }
	        
	        function checkFunc(){
	            if(httpRequest.readyState == 4){
	                // 결과값을 가져온다.
	                var resultText = httpRequest.responseText;
	                if(resultText == 1){ 
	                    document.location.reload(); // 상세보기 창 새로고침
	                }
	            }
	        }
	    
    </script>
</head>
<body class="is-preload">
	<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<h1><a href="main.jsp">MusleFive</a></h1>
					<nav id="nav">
						<ul>
							<li><a href="login.jsp" class="button">Login</a></li>
							<li><a href="join.jsp" class="button">Sign Up</a></li>
						</ul>
					</nav>
				</header>

			<!-- Main -->
				<section id="main" class="container">
					<header>
					
						<h2>COMMUNITY</h2>
						<p>헬창, 헬린이 소통의 공간</p>
					</header>
					<div class="row">
						<div class="col-12">
						
							<div id="wrap">
							    <div id="community">
							        <table id="detailBoard" width="800" border="3" bordercolor="lightgray">
							        	
							        	<%	
							        	int board_cnt = 0;
							        	for(Member_Board i: board_list){
							        		
							        		if(board_cnt==0){
							        	%>
							            <tr>
							                <td id="title">작성일</td>
							                <td><%=i.getBoard_date()%></td>
							            </tr>
							            <tr>
							                <td id="title">작성자</td>
							                <td><%=i.getBoard_id()%></td>
							            </tr>
							            <tr>
							                <td id="title">
							                    제 목
							                </td>
							                <td>
							                    <%=i.getBoard_title()%>
							                </td>        
							            </tr>
							            <tr>
							                <td id="title">
							                    내 용
							                </td>
							                <td>
							                    <%=i.getBoard_content()%>
							                </td>        
							            </tr>
							            <tr>
							                <td id="title">
							                    첨부파일
							                </td>
							                <td>
							                    <img src="C:/image/<%=i.getBoard_file()%>">

							                </td>    
							            </tr>
							            
							            <tr align="center" valign="middle">
							                <td colspan="5">
							                <%if(loginMember.getId() != null){%>
							                		<%if(loginMember.getId().equals(i.getBoard_id())){%>
							                			<a href="BoardUpdateCon?num=<%=i.getBoard_num()%>"><input type="button" value="수정"></a> 
								                        <a href="#"><input type="button" value="삭제" onclick="doAction(1)"></a>
							                		<%} else{
							                			%>
							                	<% 
							                			}
							                		}
							                	%>
							                	<a href="BoardList.jsp"><input type="button" value="목록" onclick="changeView(0)"></a>     
								                   		             
								            </td> <!-- javascript:location.href='BoardListAction.bo?page=${pageNum}' -->
							            </tr>
							        </table>
							    </div>
							            <%
							        		}
							        		board_cnt ++;
							            } 
							            %>
							    
							            
							    
							     <br><br>
    
							    <!-- 댓글 부분 -->
							    <div id="comment">
							        <table border="1" bordercolor="lightgray">
							    <!-- 댓글 목록 --> 
							    	<%

							    	for(Member_Board i : board_list){ 
							    		if(i.getUserNum() != 0 & i.getUserComment() != null){
							    			
							    	%>
							    	
							    		<tr>
							                <!-- 아이디, 작성날짜 -->
							                <td width="150">
							                    <div>
							                        <%=i.getUserNum()%><br>
							                        <font size="2" color="lightgray"></font>
							                    </div>
							                </td>
							                <!-- 본문내용 -->
							                <td width="550">
							                    <div class="text_wrapper">
							                        <%=i.getUserComment() %>
							                    </div>
							                </td>
							                <!-- 버튼 -->
							                <td width="100">
							                    <div id="btn" style="text-align:center;">
							                    <!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
							                    <%if(i.getUserNum() == loginMember.getId_num()){%>
							                    	<a href="#">[수정]</a><br>    
							                        <a href="BoardDelete">[삭제]</a>
							                    <%} %>    
							                    </div>
							                </td>
							            </tr>
							    		
							    		<% 
							    				}
							    			}
							    		%>

							            <!-- 로그인 했을 경우만 댓글 작성가능 -->
							            <%
							            int comment_cnt = 0;
							            if(loginMember != null){ 
							            	if(comment_cnt == 0){
							            		comment_cnt ++;
							            		for(Member_Board i : board_list){	
							            
							            %>
							            	
								            <tr bgcolor="#F5F5F5">
								            <form id="writeCommentForm">
								                <input type="hidden" name="comment_board" value="<%=i.getBoard_num()%>">
								                <input type="hidden" name="comment_id" value="<%=loginMember.getId()%>">
								                <!-- 아이디-->
								                <td width="150">
								                    <div>
								                        <%=loginMember.getId()%>
								                    </div>
								                </td>
								                <!-- 본문 작성-->
								                <td width="550">
								                    <div>
								                        <textarea name="comment_content" rows="4" cols="70" ></textarea>
								                    </div>
								                </td>
								                <!-- 댓글 등록 버튼 -->
								                <td width="100">
								                    <div id="btn" style="text-align:center;">
								                        <p><a href="#" onclick="writeCmt()">[댓글등록]</a></p>    
								                    </div>
								                </td>
								            </form>
								            </tr>
							            <%
							            	if(comment_cnt == 1){
							            		break;
							            	}
							            		}							            
							            	}
							            } 
							            %>
							           
							    
							        </table>
								</div>					    
							</div>    			
						</div>
					</div>
				</section>
					

			<!-- Footer -->
				<footer id="footer">
					<ul class="icons">
						<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
						<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
						<li><a href="#" class="icon brands fa-google-plus"><span class="label">Google+</span></a></li>
					</ul>
					<ul class="copyright">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</footer>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>
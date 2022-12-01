
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
	int loginIdNum = loginMember.getId_num();

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
	            width: 1000px;
	            margin: 0 auto 0 auto;    
	        }
	    
	        #detailCommunity{
	            text-align :center;
	        }
	        
	        #title{
	            height : 16;
	            font-family :'돋움';
	            font-size : 12;
	            text-align :left;
	            background-color: #F7F7F7;
	           
	        }
	        
	        #btn{
	            font-family :'돋움';
	            font-size : 14;
	            text-align :center;
	        }
	        #btn-commend{
	        color : black;
	        background:white;
	        }
	        #btn-commend button:hover{
				color:red;
				background-color: skyblue;
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
				<section id="main" >
					<header>
						<h2>COMMUNITY</h2>
						<p>헬창, 헬린이 소통의공간 </p>
					</header>
					
					<div class="row">
						<div class="col-12">
							<div id="wrap">
							    <div id="community">

							        <table id="detailBoard" width="700" border="3" bordercolor="lightgray">
							        	<div>
							        	
							        	<%	
							        	int board_cnt = 0;
							        	for(Member_Board i: board_list){
							        		if(board_cnt==0){
							        	%>
								        	<div >
								        	<pre style="line-height:0; background-color:white; white-space: pre-wrap;" border="solid 1px;">
									        	<h2 style="margin : 0; "><%=i.getBoard_title()%></h2>
									            <div class="flex-container row"><img id="insta" src="인스타사진2.png" style="width:70px; heigh:45px;"><div class="flex-container column" style="padding : 0 0 0 1em;" ><h1 style="font-size: 18px"><%=i.getBoard_id()%></h1><%=i.getBoard_date()%></div></div>
									            <hr>
									            <p style="font-weight:200px; font-size: 17px; color:black"><%=i.getBoard_content()%></p>     
									            <p style="margin : 0 0 6em;">첨부파일<img src="../image/<%=i.getBoard_file()%>" > C:/image/<%=i.getBoard_file()%></p>
									            <hr>
									            <h4 style="font-weight:500px;">댓글</h4>
									            <%
							    				for(Member_Board j : board_list){ 
							    					if(i.getUserNum() != 0 & i.getUserComment() != null){
							    				%>
									           
										        <div  style="font-weight:bold;" id="userNum"> <img id="insta" src="인스타사진2.png" style="width:30px; heigh:30px;"><%=j.getId()%></div>
										        <div >
										        <p><div> <%=j.getUserComment() %></div></p>
										        <div style="text-align:right; "class="text_wrapper" > 
										        <%if(j.getUserNum() == loginMember.getId_num()){%>
									            <a onclick="modifyComment()" id="comment_modify" ><input type="button" value="수정" style="font-size:10px;" id="btn-commend"></a><a href="commentDeleteCon?comment=<%=i.getUserComment()%>"><input type="button" value="삭제" style="font-size:10px;" id="btn-commend"></a>
									            <%} %>
									            </div>
									            <hr>
								               	</div>
							                    <%}} %> 
							                       
							                    <%
											            int comment_cnt = 0;
											            if(loginMember != null){ 
											            	if(comment_cnt == 0){
											            		comment_cnt ++;
											            		for(Member_Board j : board_list){	
							           			%>
							            	
											            <div align="left" ><img id="insta" src="인스타사진2.png" style="width:30px; height:30px;"><%=loginMember.getId()%></div>
														<form action="commentWriteCon" id="writeCommentForm" >
											                <input type="hidden" name="userNum" id="loingUserNum" value="<%=loginMember.getId_num()%>">
											                <input type="hidden" name="boardNum" value="<%=i.getBoard_num()%>">
											                <!-- 아이디-->
											                <!-- 본문 작성-->
											                    <div style="display:flex;">
											                		<textarea name="comment" rows="4" cols="70"  type="text" ></textarea>
											                         <input type="submit" value="댓글등록">
											                    </div>
														 </form>
								               
								                <!-- 댓글 등록 버튼 -->
										            <%
										            	if(comment_cnt == 1){
										            		break;
										            			}
										            		}							            
										            	}
										            } 
										            %>
							            </pre>
							         </div>
							            

							            <tr align="center" valign="middle">
							                <td colspan="5">
							                <%if(loginMember.getId() != null){%>
							                		<%if(loginMember.getId().equals(i.getBoard_id())){%>
							                			<a href="BoardUpdateCon?num=<%=i.getBoard_num()%>"><input type="button" value="수정"></a> 
								                        <a href="boardDeleteCon?num=<%=i.getBoard_num()%>"><input type="button" value="삭제"></a>
							                		<%} else{%>
							                	<% 
							                			}
							                		}
							                	%>
							                	<a href="BoardList.jsp"><input type="button" value="목록" onclick="changeView(0)"></a>     
								            </td> <!-- javascript:location.href='BoardListAction.bo?page=${pageNum}' -->
							            </tr>
							        </table>
							        </div>
							    </div>

							            <%
							        		}
							        		board_cnt ++;
							            } 
							            %>

							   </div>
							 </div>
							
							     <br><br>
    

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
							                        <p id="userNum"><%=i.getId()%><p><br>
							                        <font size="2" color="lightgray"></font>
							                    </div>
							                </td>
							                <!-- 본문내용 -->
							                <td width="550" id="fromTD">
							                    <div class="text_wrapper">
							                        <p id="text_wrapper"><%=i.getUserComment()%><p>
							                    </div>
							                </td>
							                <!-- 버튼 -->
							                <td width="100">
							                    <div id="btn" style="text-align:center;">
							                    <!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
							                    <%if(i.getUserNum() == loginMember.getId_num()){%>
							                    	<a onclick="modifyComment()" id="comment_modify">[수정]</a><br>
							                        <a href="commentDeleteCon?comment=<%=i.getUserComment()%>">[삭제]</a>
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
								            <form action="commentWriteCon" id="writeCommentForm">
								                <input type="hidden" name="userNum" value="<%=loginMember.getId_num()%>">
								                <input type="hidden" name="boardNum" value="<%=i.getBoard_num()%>">
								                
								                <!-- 아이디-->
								                <td width="150">
								                    <div>
								                        <%=loginMember.getId()%>
								                    </div>
								                </td>
								                <!-- 본문 작성-->
								                <td width="550">
								                    <div>
								                    	<input type="text" name="comment">               
								                    </div>
								                </td>
								                <!-- 댓글 등록 버튼 -->
								                <td width="100">
								                    <div id="btn" style="text-align:center;">
								                        <p><input type="submit" value="[댓글등록]"></p>    
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
			<script type="text/javascript">
			function modifyComment(){
				var userNum = document.getElementById("loingUserNum").value;
				$.ajax({
					url : "CommentUpdateCon",
					type : "post",
					data : {
						"comment" : $("#text_wrapper").text(),
						"userNum" : userNum
						
					},
					dataType : "json",
					success : function(res){
						
						let modify = '';
						$("#btn").html(modify);
						
						let input = '';
						input += "<form action='CommentUpdate'>"
						input += "<div class='text_wrapper'>"
						input += "<p id='text_wrapper'>"
						input += "<input type='hidden' name='userNum' value='" + res.id_num + "'>"
						input += "<input type='text' name='newComment' value='" + res.user_comment + "'><p>"
						input += "</div>"
						input += "</td>"
						input += "<td width='100'>"
						input += "<div id='btn' style='text-align:center;'>"
						input += "<input type='submit' value='[수정완료]'>"
						input += "</div>"
						input += "</form>"
						/* modify += "<a href='CommentUpdate?num=" + res.id_num + "&comment=" + res.user_comment + "'>[수정완료]</a>" */
						$("#fromTD").html(input);
					
	                  
						
						
					},
					error : function(){
						alert("Ajax 통신 실패했는데요")
					}
				});
				
				
			}
			
			
			</script>
</body>
</html>
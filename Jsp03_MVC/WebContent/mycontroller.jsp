<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% request.setCharacterEncoding("UTF-8"); %>
 <% response.setContentType("text/html; charset=UTF-8"); %>
 
 <%@ page import="com.mvc.dto.MVCBoardDto" %>
 <%@ page import="com.mvc.dao.MVCBoardDao" %>
 <%@ page import="java.util.List" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String command = request.getParameter("command");

	MVCBoardDao dao = new MVCBoardDao();

	System.out.println("[command: " + command + "]");
	if(command.equals("boardlist")){
		List<MVCBoardDto> list = dao.selectAll();
		
		request.setAttribute("allList", list); //allList라는 이름을 가진 속성으로 list를 담아둠
		pageContext.forward("boardlist.jsp"); 
		 //forward방식 : req, res가 유지된 상태로 화면이 바뀜
		 //redirect방식 : 새로운 페이지를 요청한 것과 같은 방식으로 페이지 이동. req, res 유지 안됨. 새로운 req, res
	}else if(command.equals("boardinsertform")){
		response.sendRedirect("boardinsert.jsp");
	}else if(command.equals("boardinsert")){
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		MVCBoardDto dto = new MVCBoardDto();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		
		int res = dao.insert(dto);
		if(res>0){
%>
		<script type="text/javascript">
			alert("글 작성 성공");
			location.href="mycontroller.jsp?command=boardlist";
		</script>
<% 
		}else{
%>
		<script type="text/javascript">
			alert("글 작성 실패");
		</script>
<%			
		response.sendRedirect("mycontroller.jsp?command=boardinsertform");
		}
	}else if(command.equals("boarddetail")){
		int seq = Integer.parseInt(request.getParameter("seq"));
		MVCBoardDto dto = dao.selectOne(seq);
		request.setAttribute("dto",dto);
		pageContext.forward("boarddetail.jsp");
		
	}else if(command.equals("boardupdateform")){
		int seq = Integer.parseInt(request.getParameter("seq"));
		MVCBoardDto dto = dao.selectOne(seq);
		
		request.setAttribute("dto",dto);
		pageContext.forward("boardupdate.jsp");
	}else if(command.equals("boardupdate")){
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		MVCBoardDto dto = new MVCBoardDto();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setSeq(seq);
		
		int res = dao.update(dto);
		
		if(res>0){
%>
		<script type="text/javascript">
			alert("글 수정 성공");
			location.href="mycontroller.jsp?command=boarddetail&seq="+<%=seq%>
		</script>
<%
		}else{
%>
		<script type="text/javascript">
			alert("글 수정 실패");
			location.href="mycontroller.jsp?command=boardupdateform&seq="+<%=seq%>
		</script>
<%		
		}
	}else if(command.equals("muldel")){
		String[] seq = request.getParameterValues("chk");
		int res = dao.multiDelete(seq);
		
		if(res == seq.length){
%>
		<script type="text/javascript">
			alert("글 삭제 성공");
			location.href="mycontroller.jsp?command=boardlist";
		</script>
<%			
		}else{
%>
		<script type="text/javascript">
			alert("글 삭제 실패");
			location.href="mycontroller.jsp?command=boardlist";
		</script>
<%			
		}
	}else if(command.equals("boarddelete")){
		String[] seq = new String[1];
		seq[0] = request.getParameter("seq");
		int res = dao.multiDelete(seq);
		if(res>0){
%>			
		<script type="text/javascript">
			alert("글 삭제 성공");
			location.href="mycontroller.jsp?command=boardlist";
		</script>
<%			
		}else{
%>
		<script type="text/javascript">
			alert("글 삭제 실패");
			location.href='mycontroller.jsp?command=boarddetail&seq='+<%=seq[0]%>;
		</script>
<%		
		}
		
	}


%>
%>
</body>
</html>
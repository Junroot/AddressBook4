<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- �� 3���� ��Ÿ �±״� *�ݵ��* head �±��� ó���� �;��մϴ�; � �ٸ� ���������� �ݵ�� �� �±׵� *������* �;� �մϴ� -->
<title>AddressBook</title>

<!-- ��Ʈ��Ʈ�� -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- IE8 ���� HTML5 ��ҿ� �̵�� ������ ���� HTML5 shim �� Respond.js -->
<!-- WARNING: Respond.js �� ����� file:// �� ���� �������� �� ���� �������� �ʽ��ϴ�. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<% 
	String issearch = request.getParameter("issearch");
	String SearchtoName = "";
	if ((String)request.getParameter("name") != null)
	{
		SearchtoName = request.getParameter("name");
		SearchtoName = new String(SearchtoName.getBytes("8859_1"),"EUC-KR");
	}
	%>
	<jsp:forward page="PeopleServlet">
		<jsp:param name="name" value="<%= SearchtoName %>" />
		<jsp:param name="issearch" value="<%= issearch %>" />
	</jsp:forward>
</body>
</html>
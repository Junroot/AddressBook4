<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<SCRIPT LANGUAGE="JavaScript"> 
  function resizeIframe(obj) {
	   if (obj.contentDocument) {
	       obj.height = obj.contentDocument.body.offsetHeight+20;
	      } else {
	          obj.height = obj.contentWindow.document.body.scrollHeight;
	      }
	}
  function changeIframeUrl(url)
  {
      document.getElementById("inFrame").src = url;
  }
</SCRIPT>
<script src="js/bootstrap.js" type="text/javascript"></script>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- �� 3���� ��Ÿ �±״� *�ݵ��* head �±��� ó���� �;��մϴ�; � �ٸ� ���������� �ݵ�� �� �±׵� *������* �;� �մϴ� -->
<title>AddressBook</title>

<!-- ��Ʈ��Ʈ�� -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- IE8 ���� HTML5 ��ҿ� �̵�� ������ ���� HTML5 shim �� Respond.js -->
<!-- WARNING: Respond.js �� ����� file:// �� ���� �������� �� ���� �������� �ʽ��ϴ�. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand">AddressBook</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#" onclick="changeIframeUrl('address.jsp');">Address<span
							class="sr-only">(current)</span></a></li>
					<li><a href="#" onclick="changeIframeUrl('message.html');">Message</a></li>
					<li><a href="#" onclick="changeIframeUrl('call.html');">Call</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<form class="navbar-form navbar-left" action="address.jsp"
						method="get" target="article" role="search">
						<div class="form-group">
							<input type="text" class="form-control" name="name"
								placeholder="Search"> <input type="hidden"
								name="issearch" value="true">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div style="margin-left: 10%">
		<iframe name="article" id="inFrame" frameborder="no" scrolling="no"
			width="100%" height="100%" marginwidth="0" marginheight="0"
			onload="resizeIframe(this);" src="address.jsp"></iframe>
	</div>
	<!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ��մϴ�) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- ��� �����ϵ� �÷������� �����մϴ� (�Ʒ�), ������ �ʴ´ٸ� �ʿ��� ������ ������ �����ϼ��� -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
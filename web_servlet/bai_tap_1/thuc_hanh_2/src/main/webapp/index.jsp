<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<h1> ${mess} </h1>
<form method="post" action="hello-servlet">
    <button>
        Bam vao day
    </button>
</form>
</body>
</html>
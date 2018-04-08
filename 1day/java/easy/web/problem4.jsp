<%--
  Created by IntelliJ IDEA.
  User: shuymn
  Date: 2018/04/09
  Time: 0:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.function.IntFunction" %>
<%@ page import="java.util.stream.IntStream" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ナベアツ課題</title>
</head>
<body>
<h1>ナベアツ課題</h1>
<%
    final Integer MIN = 1;
    final Integer MAX = 40;

    final IntFunction<String> action = number -> {
        Boolean isStupid = (number % 3 == 0 || String.valueOf(number).contains("3"));
        Boolean isDog = (number % 5 == 0);

        final Map<String, String> messages = new HashMap<String, String>() {
            {
                put("stupid", "アホになる");
                put("dog", "犬になる");
                put("stupid_dog", "アホ犬になる");
            }
        };

        return (isStupid && isDog
                ? messages.get("stupid_dog")
                : isStupid
                ? messages.get("stupid")
                : isDog
                ? messages.get("dog")
                : "");
    };

    for (Integer number : IntStream.rangeClosed(MIN, MAX).toArray()) {
        out.print(number + action.apply(number) + "<br>");
    }
%>
</body>
</html>

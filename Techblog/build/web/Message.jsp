<%@page import="com.tech.blog.entities.Message"%>
<%
    Message m = (Message) session.getAttribute("msg");
    if (m != null) {
%>
<div class="alert <%= m.getCssClass()%>" role="alert">
    <%= m.getContent()%>
</div>
<%
        session.removeAttribute("msg");
    }
%>
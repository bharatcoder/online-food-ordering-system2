<%@page import="java.sql.,java.io.,java.util.*" %>
<%
    String action=request.getParameter("action");
    
    if(action.equals("signup"))
{
  
    String email=request.getParameter("email");
    String pwd=request.getParameter("passward");
    String repeat passward= (request.getParameter("repeatpassward"));
   
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/motor-crafts?zeroDateTimeBehavior=convertToNull";
        Connection con = DriverManager.getConnection(url,"root","");
        
        Statement st=con.createStatement();
        
        boolean s = st.execute("INSERT INTO `user_data` (`email`,  `passward`, `repeat password`, "
         + "`phone`) VALUES ('"+User+"', '"+email+"',  '"+Passward+"','"+repeatpassward+"')");
        
        if(!s)
        {
            response.sendRedirect("contect.html");
            
        }
        
        else
        {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('invalid data');");
            out.println("</script>");
         
        }
    }
    catch(Exception e)
            {
                out.println(e);
            }
}
    
if(action.equals("contectus")){
    String query=request.getParameter("query");
    String username = (String)session.getAttribute("username");
    String subject=request.getParameter("subject");

    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/motor-crafts?zeroDateTimeBehavior=convertToNull";
        Connection con = DriverManager.getConnection(url,"root","");
        
        Statement st=con.createStatement();
        
        boolean s = st.execute("INSERT INTO `query` (`query`, `subject`, `username`) VALUES ('"+query+"', '"+subject+"', '"+username+"')");
        
        if(!s)
        {
            response.sendRedirect("contect.html");
            
        }
        
        else
        {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('invalid data');");
            out.println("</script>");
         
        }
    }
    catch(Exception e)
            {
                out.println(e);
            }
}

if(action.equals("login")){
    String pass=request.getParameter("pass");
    String user=request.getParameter("username");
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/motor-crafts?zeroDateTimeBehavior=convertToNull";
        Connection con = DriverManager.getConnection(url,"root","");
        Statement st=con.createStatement();
        
        ResultSet rs = st.executeQuery("SELECT * FROM `user_data` WHERE user_name = '"+user+"' AND password = '"+pass+"'");
        
        if(rs.next())
        {
            response.sendRedirect("contect.html");
            
        }
        
        else
        {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('invalid data');");
            out.println("</script>");
         
        }
    }
    catch(Exception e)
            {
                out.println(e);
            }
    
}



    %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebFormApp.pages.admin.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Admin inicio de Sesion</title>
    <link rel="stylesheet" href="<% =Utils.baseUrl()%>www/css/pages/admin/login.css" />
    <style type="text/css">
        .auto-style1 {
            width: 120px;
        }
        .auto-style2 {
            width: 120px;
            height: 26px;
        }
        .auto-style3 {
            height: 26px;
        }
    </style>
</head>
<body>

    <div class="pc-tab">
        <input id="tab1" type="radio" name="pct" checked="checked" />
        <input id="tab2" type="radio" name="pct" />
        <nav>
            <ul>
                <li class="tab1">
                    <label for="tab1">Login WebForm</label>
                </li>
                <li class="tab2">
                    <label for="tab2">login Standard</label>
                </li>
            </ul>
        </nav>
        <section>
            <div class="tab1">
                <form id="formLogin" runat="server">
                    <table border="0" style="width: 258px">
                        <tr><td class="auto-style1">usuario:</td><td>
                            <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                            </td></tr>
                        <tr><td class="auto-style2">password:</td><td class="auto-style3">
                            <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
                            </td></tr>
                        <tr><td colspan="2">
                            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Iniciar Sesion" />
                            </td></tr>
                    </table>
                </form>
            </div>
            <div class="tab2">
                <h2>Second</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum nesciunt ipsum dolore error repellendus officiis aliquid a, vitae reprehenderit, accusantium vero, ad. Obcaecati numquam sapiente cupiditate. Praesentium eaque, quae error!</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis, maiores.</p>
            </div>
        </section>
    </div>

    <footer> 2018 </footer>
  
</body>
</html>

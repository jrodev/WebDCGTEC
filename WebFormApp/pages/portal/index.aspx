<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/portal/portal.Master" CodeBehind="index.aspx.cs" Inherits="WebFormApp.pages.contacto" %>

<asp:Content ID="IdHeadCssJs" ContentPlaceHolderID="headCssJs" runat="server">
    <!--Suport Table Responsive for PureCss -->
    <!--[if lte IE 8]>
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-old-ie-min.css" />
    <![endif]-->
    <!--[if gt IE 8]><!-->
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/grids-responsive-min.css" />
    <!--<![endif]-->

    <link rel="stylesheet" href="<% =Utils.baseUrl()%>www/css/pages/portal/index.css" />

</asp:Content>

<asp:Content ID="IdMainContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1>index</h1>

</asp:Content>

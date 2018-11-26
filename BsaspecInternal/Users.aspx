<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
     <div class="contentText">
    <form id="form1" runat="server">
    <asp:SqlDataSource ID="SqlDataSourcebsaspec" runat="server" ConnectionString="<%$ ConnectionStrings:Bsaspecconnstr %>" SelectCommand="SELECT id,Fname,Lname,emailid,Phone,Password FROM [Tblregistrations]"></asp:SqlDataSource>
    <asp:GridView ID="GridViewUsers" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourcebsaspec">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
            <asp:BoundField DataField="Lname" HeaderText="Lname" SortExpression="Lname" />
            <asp:BoundField DataField="emailid" HeaderText="emailid" SortExpression="emailid" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
</form>
         </div>
</asp:Content>


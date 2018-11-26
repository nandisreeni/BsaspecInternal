<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="registration.aspx.cs" Inherits="registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
    
    <div style="margin:75px; border: medium solid #808080">
         <h2 style="vertical-align: middle; text-align: center">Registration</h2>
       
    <form class="form-inline" id="form1"  style="padding: 5px; margin: 5px" runat="server">
        <div class="row"  >
            <div class="col-md-6" >
                
                <asp:TextBox ID="TBfname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVfname" runat="server" ControlToValidate="TBfname" ErrorMessage="First Name Is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                 
            </div>
            <div class="col-md-6" >
                 
                <asp:TextBox ID="TBlname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVlname" runat="server" ControlToValidate="TBlname" ErrorMessage="Last Name Is Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
              
        </div>
        <div class="row" >
            <div class="col-md-6">
                <asp:TextBox ID="TBemailid" runat="server" class="form-control" placeholder="Email ID"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVemailid" runat="server" ControlToValidate="TBemailid" ErrorMessage="E-mail ID Is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="REVemailid" runat="server" ControlToValidate="TBemailid" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ViewStateMode="Disabled" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="TBphone" runat="server" class="form-control" placeholder="Phone Number" onblur="test()"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVphone" runat="server" ControlToValidate="TBphone" ErrorMessage="Phone Number Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row" >
            <div class="col-md-6">
                <asp:TextBox ID="TBpassword" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFVpassword" runat="server" ControlToValidate="TBpassword" ErrorMessage="Password Is Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="TBcpassword" runat="server" class="form-control" placeholder="Confirm Password"></asp:TextBox>
                <asp:CompareValidator ID="CVcpassword" runat="server" ControlToCompare="TBpassword" ControlToValidate="TBcpassword" ErrorMessage="Passwords Should Match" ForeColor="Red"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RFVcpassword" runat="server" ControlToValidate="TBcpassword" ErrorMessage="Confirm Password Is Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row" >
            <div class="col-md-12">
                <asp:Button ID="TBsubmit" style="text-align: center" runat="server" class="btn btn-primary" Text="Submit" />
            </div>
            
           
        </div>
    
</form>
       
</asp:Content>


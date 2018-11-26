<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"CodeFile="login.aspx.cs" Inherits="login" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
    <div class="px-4" style="margin: 10px; border: thin solid #808080">
        <div class="login-form">
            <h5 class="text-center">
                <strong>Sign in</strong>
            </h5>
            <form runat="server" class="text-center" style="color: #757575;">
                <div class="text-center">
                    <img src="signin.jpg" class="img-circle avatar" alt="Avatar">
                </div>
                <div class="form-group">
                    <asp:TextBox ID="TBemail" class="form-control" placeholder="Email" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TBpassword" class="form-control" placeholder="Password" runat="server"></asp:TextBox>
                    <br>
                    <br>
                </div>



                <div class="form-group">


                    <asp:Button ID="BTNlogin" class="btn btn-primary btn-block" runat="server" Text="LogIn" />

                </div>
                <div class="d-flex justify-content-around">

                    <div>
                        <!-- Forgot password -->
                        <a href="">Forgot password?</a>
                    </div>
                </div>
            </form>
        </div>
    </div>

</asp:Content>

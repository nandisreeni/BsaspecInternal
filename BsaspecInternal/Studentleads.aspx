<%@ Page Title="" ClientIDMode="Static" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Studentleads.aspx.cs" Inherits="Studentleads" %>

<asp:Content ID="ContentSL" ContentPlaceHolderID="MainContent1" runat="Server">
    <script>
        $(function () {
            $("#<%=TBvisastartdate.ClientID %>").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0", // You can set the year range as per as your need
                dateFormat: 'mm-dd-yy'
            });
            $("#<%=TBstemextnsd.ClientID %>").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0", // You can set the year range as per as your need
                dateFormat: 'mm-dd-yy'
            });
        });
    </script>
    <form class="form-inline" id="form2" runat="server" style="padding: 5px;">
        <div class="px-4" style="margin: auto; padding: 5px; border: thin solid #808080;">
            <h2 style="vertical-align: middle; text-align: center">Student Leads
            </h2>
            <div class="row" style="padding: 5px;">
                <div class="form-group col-4">
                    <asp:TextBox ID="TBfirstname" class="form-control" placeholder="First Name" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-4">
                    <asp:TextBox ID="TBlastname" class="form-control" placeholder="Last Name" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-4">
                    <asp:TextBox ID="TBPhone" class="form-control" onblur="test()" placeholder="Phone Number" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="padding: 5px;">
                <div class="form-group col-4">
                    <asp:TextBox ID="TBemail" class="form-control" placeholder="Email ID" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-4">
                    <asp:TextBox ID="TBmuniversity" class="form-control" placeholder="University Name(masters)" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-4">
                    <asp:DropDownList ID="DDvisastatus" class="form-control" placeholder="Visa" runat="server">
                        <asp:ListItem Selected>Visa Status</asp:ListItem>
                        <asp:ListItem>GC</asp:ListItem>
                        <asp:ListItem>OPT</asp:ListItem>
                        <asp:ListItem>H1</asp:ListItem>
                        <asp:ListItem>CPT</asp:ListItem>
                        <asp:ListItem>L2</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row" style="padding: 5px;">
                <div class="form-group col-4">
                    <asp:TextBox ID="TBvisastartdate" class="form-control" placeholder="Visa Start Date" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-4">

                    <asp:TextBox ID="TBmmajors" class="form-control" placeholder="Majors(masters)" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-4">

                    <asp:TextBox ID="TBmgpa" class="form-control" placeholder="GPA(masters)" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="padding: 5px;">
                <div class="form-group col-4">
                    <asp:TextBox ID="TBbuniversity" class="form-control " placeholder="University(bachelors)" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-4">

                    <asp:TextBox ID="TBbmajors" class="form-control" placeholder="Majors(bachelors)" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-4">

                    <asp:TextBox ID="TBbgpa" class="form-control" placeholder="GPA/Percentage(bachelors)" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="padding: 5px;">
                <div class="form-group col-4">
                    <asp:TextBox ID="TBclocation" class="form-control " placeholder="Current Location (state & city)" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-4">
                    <asp:TextBox ID="TBnative" class="form-control" placeholder="Native Place(state & city)" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-4">
                    <asp:TextBox ID="TBcommunication" class="form-control" placeholder="Communication(1-10)" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="padding: 5px;">
                <div class="form-group col-4">
                    <asp:TextBox ID="TBtrainingp" class="form-control " placeholder="Training Preference" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-4">
                    <asp:TextBox ID="TBprogrammingl" class="form-control" placeholder="Programming Languages" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-4">
                    <asp:DropDownList ID="DDstemextension" class="form-control" runat="server">
                        <asp:ListItem Selected>Stem Extension(Y/N)</asp:ListItem>
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row" style="padding: 5px;">
                <div class="form-group col-12">
                    <asp:TextBox ID="TBstemextnsd" class="form-control " placeholder="Strm Extn Start Date" runat="server"></asp:TextBox>
                </div>
                <div class="form-group col-12">
                    <asp:TextBox ID="TBexperience" class="form-control " placeholder="Experience" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="padding: 5px;">
                <div class="form-group col-12">
                    <asp:TextBox ID="TBcomments" TextMode="multiline" Columns="50" Rows="5" class="form-control" placeholder="Comments" runat="server"></asp:TextBox>
                </div>
            </div>
          
            <div class="row" style="border: medium double #00FF00">
                  <div class="form-group col-12">
                    <asp:Button ID="TBsubmit" Style="text-align: left" runat="server" class="btn btn-primary" Text="Submit" Font-Bold="True" Font-Size="Smaller" />
                </div>
            </div>
        </div>
    </form>


</asp:Content>


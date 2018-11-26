<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Comments.aspx.cs" Inherits="Comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" runat="Server">
    <script>
        function test() {
            this.form.elements["HIDEcomments"].value = this.form.elements["TBphone"].value;
        }
        function test1(ddlId) {
            var ControlName = document.getElementById(ddlId.id);

            if (ControlName.value == "Follow Up") {



                document.getElementById('PanelCal').style.display = 'block';


            }
            else {
                document.getElementById('PanelCal').style.display = 'none';

            }
        }
        $(function () {
            $("#<%=TBreminderdate.ClientID %>").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0", // You can set the year range as per as your need
                dateFormat: 'mm-dd-yy'
            });
            $("#<%=TBremindertime.ClientID %>").timepicker({
                timeFormat: 'h:mm p',
                interval: 10,
                minTime: '10',
                maxTime: '6:00pm',
                defaultTime: '11',
                startTime: '10:00',
                dynamic: false,
                dropdown: true,
                scrollbar: true
            });
        });
    </script>
    <form class="form-inline" id="form2" runat="server" style="padding: 5px;">
        <div class="px-4" style="margin: auto; padding: 5px; border: thin solid #808080;">
            <h2 style="vertical-align: middle; text-align: center">Student Leads
            </h2>
            <asp:Panel ID="PANphone" runat="server" class="container" Style="margin: auto; padding: 5px; border: initial thin #808080;">
                <div class="row" style="padding: 5px;">
                    <div class="form-group col-12">
                        <asp:TextBox ID="TBphone" class="form-control" placeholder="Telephone" runat="server"></asp:TextBox>
                    </div>
                    <br />

                </div>
                <div class="row" style="padding: 5px;">

                    <div class="form-group col-12">
                        <asp:Button ID="Button2" Style="text-align: center" runat="server" class="btn btn-primary" Text="Submit" OnClick="TBsubmit_Click" />
                    </div>
                </div>
            </asp:Panel>
            
            <asp:Panel ID="PANdetails" runat="server" class="px-4" Style="border: initial thin #808080;">
                <asp:FormView ID="FormView1" DataSourceID="SqlDataSource1" DatataKeyNames="StudentPhone" runat="server">
                    <ItemTemplate>
                        <div class="row" style="padding: 1px;">
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bolder; font-style: normal">First Name: &nbsp;<span class="label label-default" style="font-size: x-small; font-family: 'book Antiqua'; font-weight: normal;"><%# Eval("StudentFirstname") %></span></h5>
                            </div>
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bolder; font-style: normal">Last Name: <span class="label label-default" style="font-size: x-small; font-family: 'book Antiqua'; font-weight: normal;"><%# Eval("StudentLastname") %></span></h5>
                            </div>
                        </div>
                        <div class="row" style="padding: 1px;">
                            <div class="form-group col-6">
                                <h5 style="font-family: Arial, Helvetica, sans-serif; font-size: x-small; font-weight: bolder; font-style: normal">Phone: <span class="label label-default" style="font-weight: lighter; font-size: x-small; font-family: 'Book Antiqua';"><%# Eval("StudentPhone") %></span></h5>
                            </div>
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bolder;">Email ID: <span class="label label-default" style="font-weight: lighter; font-size: x-small; font-family: 'Book Antiqua';"><%# Eval("StudentEmailid") %></span></h5>
                            </div>
                        </div>
                        <div class="row" style="padding: 1px;">
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold; font-style: normal">University Name: <span class="label label-default" style="font-size: x-small; font-family: 'book Antiqua'; font-weight: normal;"><%# Eval("StudentUniversityname") %></span></h5>
                            </div>
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold;">Visa Status: <span class="label label-default" style="font-family: 'book Antiqua'; font-size: x-small; font-weight: normal"><%# Eval("Studentvisastatus") %></span></h5>
                            </div>
                        </div>
                        <div class="row" style="padding: 1px;">
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold; font-style: normal">Native: <span class="label label-default" style="font-size: x-small; font-family: 'book Antiqua'; font-weight: normal;"><%# Eval("Studentnative") %></span></h5>
                            </div>
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold;">Location: <span class="label label-default" style="font-family: 'book Antiqua'; font-size: x-small; font-weight: normal"><%# Eval("Studentclocation") %></span></h5>
                            </div>
                        </div>
                        <div class="row" style="padding: 1px;">
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold; font-style: normal">Bachelors GPA/PErcentage: <span class="label label-default" style="font-size: x-small; font-family: 'book Antiqua'; font-weight: normal;"><%# Eval("Studentbgpa") %></span></h5>
                            </div>
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold;">Bachelors Majors: <span class="label label-default" style="font-family: 'book Antiqua'; font-size: x-small; font-weight: normal"><%# Eval("Studentbmajors") %></span></h5>
                            </div>
                        </div>
                        <div class="row" style="padding: 1px;">
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold; font-style: normal">Bachelors University: <span class="label label-default" style="font-size: x-small; font-family: 'book Antiqua'; font-weight: normal;"><%# Eval("Studentbuniversityname") %></span></h5>
                            </div>
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold;">Masters GPA: <span class="label label-default" style="font-family: 'book Antiqua'; font-size: x-small; font-weight: normal"><%# Eval("Studentmgpa") %></span></h5>
                            </div>
                        </div>
                        <div class="row" style="padding: 1px;">
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold; font-style: normal">Masters Majors: <span class="label label-default" style="font-size: x-small; font-family: 'book Antiqua'; font-weight: normal;"><%# Eval("Studentmmajors") %></span></h5>
                            </div>
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold;">OPT Start Date: <span class="label label-default" style="font-family: 'book Antiqua'; font-size: x-small; font-weight: normal"><%# Eval("Studentvisastartdate") %></span></h5>
                            </div>
                        </div>
                        <div class="row" style="padding: 1px;">
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold; font-style: normal">Experience: <span class="label label-default" style="font-size: x-small; font-family: 'book Antiqua'; font-weight: normal;"><%# Eval("Studentexperience") %></span></h5>
                            </div>
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold;">STM Exten Start Date: <span class="label label-default" style="font-family: 'book Antiqua'; font-size: x-small; font-weight: normal"><%# Eval("Studentstemextnsd") %></span></h5>
                            </div>
                        </div>
                        <div class="row" style="padding: 1px;">
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold; font-style: normal">Stem Extn: <span class="label label-default" style="font-size: x-small; font-family: 'book Antiqua'; font-weight: normal;"><%# Eval("Studentstemextension") %></span></h5>
                            </div>
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold;">Programming Lang: <span class="label label-default" style="font-family: 'book Antiqua'; font-size: x-small; font-weight: normal"><%# Eval("Studentprogrammingl") %></span></h5>
                            </div>
                        </div>
                        <div class="row" style="padding: 1px;">
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold; font-style: normal">Training Pref: <span class="label label-default" style="font-size: x-small; font-family: 'book Antiqua'; font-weight: normal;"><%# Eval("Studenttrainingp") %></span></h5>
                            </div>
                            <div class="form-group col-6">
                                <h5 style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold;">communication: <span class="label label-default" style="font-family: 'book Antiqua'; font-size: x-small; font-weight: normal"><%# Eval("studentcommunication") %></span></h5>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
              
                <div class="row" style="padding: 1px;">
                    <div class="form-group col-12">
                        <asp:TextBox ID="TBcomments" TextMode="multiline" Columns="100" Rows="5" class="form-control" placeholder="Comments" runat="server" /><br />
                    </div>
                </div>
                
                <div class="row" style="padding: 8px;">
                    <div class="form-group col-4">
                        <asp:DropDownList ID="DDSchedule" class="form-control" onchange="test1(this)" runat="server" Style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bold;">
                            <asp:ListItem Selected>Opportunity</asp:ListItem>
                            <asp:ListItem>Follow Up</asp:ListItem>
                            <asp:ListItem>Schedule Skype</asp:ListItem>
                            <asp:ListItem>Upload Background Forms</asp:ListItem>
                            <asp:ListItem>Schedule Flight</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-8">
                        <asp:Panel ID="PanelCal" runat="server" ClientIDMode="Static" >
                                <asp:TextBox ID="TBreminderdate" Style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bolder; font-style: normal" class="form-control" placeholder="Date" runat="server"></asp:TextBox>
                                <asp:TextBox ID="TBremindertime" Style="font-family: 'Book Antiqua'; font-size: x-small; font-weight: bolder; font-style: normal" class="form-control" placeholder="Time" runat="server"></asp:TextBox>
                        </asp:Panel>
                    </div>
                </div>
                <br />
              

                <div class="row" style="padding: 8px;">
                    <div class="form-group col-12">
                        <asp:Button ID="Button1" Style="text-align: center" runat="server" class="btn btn-primary" Text="Submit" />
                    </div>
                </div>
                <asp:HiddenField ID="HIDEcomments" runat="server" />
            </asp:Panel>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Bsaspecconnstr %>" SelectCommand="SELECT [StudentFirstname], [StudentLastname], [StudentPhone], [StudentEmailid], [StudentUniversityname], [Studentvisastatus], [Studentnative], [Studentclocation], [Studentbgpa], [Studentbmajors], [Studentbuniversityname], [Studentmgpa], [Studentmmajors], [Studentvisastartdate], [Studentexperience], [Studentstemextnsd], [Studentstemextension], [Studentprogrammingl], [Studenttrainingp], [studentcommunication] FROM [TblStudentLeads] WHERE ([StudentPhone] = @StudentPhone)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TBphone" Name="StudentPhone" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>


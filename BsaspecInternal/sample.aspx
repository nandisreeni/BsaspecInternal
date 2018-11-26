<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="sample.aspx.cs" Inherits="sample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">
    <!doctype html>
<html lang="en">

  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>

<p>Date: <input type="text" id="datepicker"></p>
 
</asp:Content>


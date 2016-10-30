﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestEntryUI.aspx.cs" Inherits="BillingManagmentOfDiagonosticCenterApp.UI.TestEntryUI" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Billing System Of Diagosusting Center</title>

    <!-- Bootstrap -->
    <link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="../Bootstrap/css/Customize.css" rel="stylesheet" />

    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<body>
    <form id="form1" runat="server">
            <!--Nav Section-->
            <nav class="navbar navbar-default">
              <div class="container-fluid">
    
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="#">Diagonasting Center</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav">
                    <li><a href="TestTypeEntryUI.aspx">Type Entry<span class="sr-only">(current)</span></a></li>
                    <li class="active"><a href="TestEntryUI.aspx">Test Entry</a></li>
                    <li><a href="#">Patient Request</a></li>
                    <li><a href="#">Payment Info</a></li>
                    <li><a href="#">Test Wise Report</a></li>
                    <li><a href="#">Type Wise Report</a></li>
                    <li><a href="#">Due Bill Info</a></li>
                  </ul>
                </div>
              </div>
            </nav>
        <!--End Of Nav Section-->
        <div class="container responsive-container">
            <div class="row">
                <!--Text Alart Section-->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-md-offset-3">
                    <div id="dangerDiv" runat="server" visible="false">
                        <div class="alert alert-danger" role="alert">
                            <asp:Label ID="dangerAlartLabel" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div id="successfullDiv" runat="server" visible="false">
                        <div class="alert alert-success" role="alert">
                            <asp:Label ID="successfullAlartLabel" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <!--End of Text Alart Section-->
                    
                    <!--Start of Test Setup Section-->
                    <div class="panel panel-primary">
                      <div class="panel-heading">
                          <h2>Test Stup</h2>
                      </div>
                      <div class="panel-body">
                        <div class="col-xs-12">
                            <div class="col-lg-3">
                                <label>Test Name</label>
                            </div>
                            <div class="col-lg-9">
                                <asp:TextBox runat="server" ID="testNameTextBox" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 space">
                            <div class="col-lg-3">
                                <label>Test Fee</label>
                            </div>
                            <div class="col-lg-6">
                                <asp:TextBox runat="server" ID="testFeeTextBox" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-lg-3">
                                <label> <i>BDT</i></label>
                            </div>
                        </div>
                        <div class="col-xs-12 space">
                            <div class="col-lg-3">
                                <label>Test Type</label>
                            </div>
                            <div class="col-lg-9">
                                <asp:DropDownList runat="server" ID="testTypeSelectDropDownList" CssClass="btn btn-default "/>
                            </div>
                        </div>

                        <div class="col-lg-2 pull-right space">
                            <asp:Button runat="server" ID="testsSaveButton" CssClass="btn btn-primary" Text="Save" />
                        </div>
                      </div>
                    </div>
                    <!--End of Test Setup Section-->
                </div>
            </div>
            
            <div class="row">
                    <!--Start of GrideView Section Section-->                
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-md-offset-3" id="gridViewControl">
                    <asp:GridView ID="testShowGridView" runat="server" AutoGenerateColumns="False" 
                        CssClass="col-lg-12 col-md-12 col-sm-12 col-xs-12 table table-bordered" HeaderStyle="#CDDAD7;">
                        <headerstyle backcolor="#337ab7" forecolor="white"/>
                        <Columns>
                            <asp:TemplateField  HeaderText="SL NO">
                                <ItemTemplate>
                                    <asp:Label runat="server"><!--<%#Eval(" ") %>--></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Test Name">
                                <ItemTemplate>
                                    <asp:Label runat="server"><!--<%#Eval(" ") %>--></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Test Fee">
                                <ItemTemplate>
                                    <asp:Label runat="server"><!--<%#Eval(" ") %>--></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Test Type">
                                <ItemTemplate>
                                    <asp:Label runat="server"><!--<%#Eval(" ") %>--></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                    <!--End of GrideView Section Section-->                
            </div>
        </div> 
       
    </form>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../Bootstrap/js/Customize.js"></script>
    <script src="../Bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
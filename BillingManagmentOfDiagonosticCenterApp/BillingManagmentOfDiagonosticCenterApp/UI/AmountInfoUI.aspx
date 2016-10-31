﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AmountInfoUI.aspx.cs" Inherits="BillingManagmentOfDiagonosticCenterApp.UI.AmountInfoUI" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Billing System Of Diagosusting Center</title>

    <!-- Bootstrap and Customize Css add section -->
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
                    <li><a href="TestEntryUI.aspx">Test Entry</a></li>
                    <li><a href="PatientInfoEntryUI.aspx">Patient Request</a></li>
                    <li class="active"><a href="AmountInfoUI.aspx">Payment Info</a></li>
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
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-md-offset-3">
                    
                    <!--Alart Text Sectio-->
                    <div id="testTypeDangerDiv" runat="server" visible="false">
                        <div class="alert alert-danger" role="alert">
                            <asp:Label ID="testTypeDangerAlartLabel" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    
                    <div id="testTypeSuccessfullDiv" runat="server" visible="false">
                        <div class="alert alert-success" role="alert">
                            <asp:Label ID="testTypeSuccessfullAlartLabel" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <!--End of Alart Section-->
                    
                    <!--Payment Section-->
                    <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h1>Payment</h1>
                      </div>
                      <div class="panel-body">
                          <div class="panel panel-default">
                              <div class="panel-body">
                                   <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <label >Bill No</label>
                                        </div>
                                        <div class="col-lg-6">
                                            <input type="number" id="billNoTextBox" value=" " runat="server" class="form-control"/>
                                        </div>
                                        <div class="col-lg-3">
                                            <label >Or</label>
                                        </div>
                                   </div>
                                   <div class="col-lg-12 space">
                                        <div class="col-lg-3">
                                            <label >Mobile No</label>
                                        </div>
                                        <div class="col-lg-6">
                                            <input type="number" id="mobileNoTextBox" value=" " runat="server" class="form-control"/>
                                        </div>
                                        <div class="col-lg-3">
                                            <asp:Button runat="server" ID="amountSearchButton" CssClass="btn btn-primary" Text="Search" OnClick="amountSearchButton_Click" />
                                        </div>
                                   </div>
                              </div>
                            </div>
                            
                          <div class="panel panel-default">
                              <div class="panel-body">
                                   <div class="col-lg-12">
                                        <div class="col-lg-3">
                                            <label >Amount</label>
                                        </div>
                                        <div class="col-lg-6">
                                            <input type="text" id="amountTextBox" value=" " runat="server" class="form-control"/>
                                        </div>
                                        <div class="col-lg-3">
                                            
                                        </div>
                                   </div>
                                   <div class="col-lg-12 space">
                                        <div class="col-lg-3">
                                            <label >Due Date</label>
                                        </div>
                                        <div class="col-lg-6">
                                            <input type="text" id="dueDateTextBox" value=" " runat="server" class="form-control"/>
                                        </div>
                                        <div class="col-lg-3">
                                            <asp:Button runat="server" ID="dueAmountPayButton" CssClass="btn btn-primary" Text="Pay" OnClick="dueAmountPayButton_Click" />
                                        </div>
                                   </div>
                              </div>
                            </div>
                          
                      </div>
                    </div>
                    
                    <!--Payment Section-->
                </div>
            </div>
        </div>
    </form>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../Bootstrap/js/bootstrap.js"></script>
    <script src="../Bootstrap/js/Customize.js"></script>

</body>
</html>

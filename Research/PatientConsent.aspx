<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PatientConsent.aspx.vb" Inherits="Research.PatientConsent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Participant Information Sheet</title>

    <style>

        body{
            margin:0;
            font-family:'Segoe UI',Arial;
            background:#f4f6f9;
        }

        .container{
            width:900px;
            margin:40px auto;
            background:white;
            padding:40px;
            border-radius:10px;
            box-shadow:0 5px 15px rgba(0,0,0,.15);
        }


        h2{
            text-align:center;
            color:#6f2c91;
        }


        h3{
            color:#6f2c91;
            border-bottom:1px solid #ddd;
            padding-bottom:8px;
            margin-top:30px;
        }


        p, li{
            font-size:16px;
            line-height:1.7;
            text-align:justify;
        }


        .consentBox{
            margin-top:30px;
            background:#f9f9f9;
            padding:20px;
            border-radius:5px;
        }


        .checkItem{
            display:block;
            margin:12px 0;
            font-size:16px;
        }


        .btnNext{
            margin-top:30px;
            float:right;
            background:#6f2c91;
            color:white;
            border:none;
            padding:12px 40px;
            border-radius:5px;
            font-size:16px;
            cursor:pointer;
        }


        .btnNext:hover{
            background:#58237a;
        }


    </style>


</head>


<body>


<form id="form1" runat="server">


<div class="container">


<h2>
    <asp:Label ID="lblPageTitle" runat="server"></asp:Label>
</h2>


<h3>
    <asp:Label ID="lblResearchTitleHeader" runat="server"></asp:Label>
</h3>

<p>
    <asp:Label ID="lblResearchTitle" runat="server"></asp:Label>
</p>


<h3>
    <asp:Label ID="lblIntroductionHeader" runat="server"></asp:Label>
</h3>

<p>
    <asp:Label ID="lblIntroduction" runat="server"></asp:Label>
</p>


<h3>
    <asp:Label ID="lblPurposeHeader" runat="server"></asp:Label>
</h3>

<p>
    <asp:Label ID="lblPurpose" runat="server"></asp:Label>
</p>


<h3>
    <asp:Label ID="lblProcedureHeader" runat="server"></asp:Label>
</h3>

<p>
    <asp:Label ID="lblProcedure" runat="server"></asp:Label>
</p>


<h3>
    <asp:Label ID="lblParticipationHeader" runat="server"></asp:Label>
</h3>

<p>
    <asp:Label ID="lblParticipation" runat="server"></asp:Label>
</p>


<h3>
    <asp:Label ID="lblBenefitHeader" runat="server"></asp:Label>
</h3>

<p>
    <asp:Label ID="lblBenefit" runat="server"></asp:Label>
</p>


<h3>
    <asp:Label ID="lblRiskHeader" runat="server"></asp:Label>
</h3>

<p>
    <asp:Label ID="lblRisk" runat="server"></asp:Label>
</p>


<h3>
    <asp:Label ID="lblConfidentialHeader" runat="server"></asp:Label>
</h3>

<p>
    <asp:Label ID="lblConfidential" runat="server"></asp:Label>
</p>


<p>
    <asp:Label ID="lblContact" runat="server"></asp:Label>
</p>



<div class="consentBox">

<h3>
    <asp:Label ID="lblConsentHeader" runat="server"></asp:Label>
</h3>


<asp:CheckBox ID="chkAge"
runat="server"
CssClass="checkItem" />


<asp:CheckBox ID="chkReview"
runat="server"
CssClass="checkItem" />


<asp:CheckBox ID="chkUnderstand"
runat="server"
CssClass="checkItem" />


<asp:CheckBox ID="chkTerms"
runat="server"
CssClass="checkItem" />


<asp:CheckBox ID="chkAgree"
runat="server"
CssClass="checkItem" />


<asp:CheckBox ID="chkWithdraw"
runat="server"
CssClass="checkItem" />


</div>



<asp:Button
ID="btnNext"
runat="server"
Text="Next"
CssClass="btnNext"
OnClick="btnNext_Click" />


<div style="clear:both"></div>


</div>


</form>


</body>

</html>
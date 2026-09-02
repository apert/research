<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PatientConsentForm.aspx.vb" Inherits="Research.PatientConsentForm" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Consent Signature Form</title>

    <style>
        body {
            font-family: 'Segoe UI';
            background:#f4f6f9;
        }

        .container {
            max-width:900px;
            margin:40px auto;
            background:white;
            padding:30px;
            border-radius:10px;
            box-shadow:0 4px 20px rgba(0,0,0,0.1);
        }

        h2 {
            border-bottom:1px solid #ddd;
            padding-bottom:5px;
        }

        .form-group {
            margin-top:15px;
        }

        input {
            width:100%;
            padding:10px;
        }

        .btn {
            margin-top:30px;
            padding:12px;
            width:100%;
            background:#2c7be5;
            color:white;
            border:none;
        }
    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

<h1><asp:Label ID="lblTitle" runat="server" /></h1>

<h2><asp:Label ID="lblParticipantTitle" runat="server" /></h2>

<div class="form-group">
    <label><asp:Label ID="lblParticipantName" runat="server" /></label>
    <asp:TextBox ID="txtParticipantName" runat="server" />
</div>

<div class="form-group">
    <label><asp:Label ID="lblParticipantIC" runat="server" /></label>
    <asp:TextBox ID="txtParticipantIC" runat="server" />
</div>

<div class="form-group">
    <label><asp:Label ID="lblParticipantDate" runat="server" /></label>
    <asp:TextBox ID="txtParticipantDate" runat="server" TextMode="Date" />
</div>

<div class="form-group">
    <label><asp:Label ID="lblParticipantSignature" runat="server" /></label>
    <asp:TextBox ID="txtParticipantSign" runat="server" />
</div>

<h2><asp:Label ID="lblWitnessTitle" runat="server" /></h2>

<div class="form-group">
    <label><asp:Label ID="lblWitnessName" runat="server" /></label>
    <asp:TextBox ID="txtWitnessName" runat="server" />
</div>

<div class="form-group">
    <label><asp:Label ID="lblWitnessIC" runat="server" /></label>
    <asp:TextBox ID="txtWitnessIC" runat="server" />
</div>

<div class="form-group">
    <label><asp:Label ID="lblWitnessDate" runat="server" /></label>
    <asp:TextBox ID="txtWitnessDate" runat="server" TextMode="Date" />
</div>

<div class="form-group">
    <label><asp:Label ID="lblWitnessSignature" runat="server" /></label>
    <asp:TextBox ID="txtWitnessSign" runat="server" />
</div>

<h2><asp:Label ID="lblResearcherTitle" runat="server" /></h2>

<div class="form-group">
    <label><asp:Label ID="lblResearcherName" runat="server" /></label>
    <asp:TextBox ID="txtResearcherName" runat="server" />
</div>

<div class="form-group">
    <label><asp:Label ID="lblResearcherIC" runat="server" /></label>
    <asp:TextBox ID="txtResearcherIC" runat="server" />
</div>

<div class="form-group">
    <label><asp:Label ID="lblResearcherDate" runat="server" /></label>
    <asp:TextBox ID="txtResearcherDate" runat="server" TextMode="Date" />
</div>

<div class="form-group">
    <label><asp:Label ID="lblResearcherSignature" runat="server" /></label>
    <asp:TextBox ID="txtResearcherSign" runat="server" />
</div>

<asp:Button ID="btnSubmit"
    runat="server"
    CssClass="btn"
    OnClick="btnSubmit_Click" />

</div>

</form>

</body>
</html>
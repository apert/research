<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Eligibility.aspx.vb" Inherits="Research.Eligibility" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Eligibility Criteria</title>

    <style>
        body {
            margin:0;
            padding:0;
            font-family:'Segoe UI',Arial;
            background:#f4f6f9;
        }

        .container{
            width:900px;
            margin:40px auto;
            background:#fff;
            border-radius:10px;
            box-shadow:0 5px 15px rgba(0,0,0,.15);
            overflow:hidden;
        }

        .header{
            background:#6f2c91;
            color:white;
            padding:20px;
            text-align:center;
        }

        .header h2{
            margin:0;
        }

        .content{
            padding:30px 40px;
        }

        h3{
            color:#6f2c91;
            margin-top:25px;
            border-bottom:2px solid #eee;
            padding-bottom:8px;
        }

        ul{
            margin-top:10px;
            margin-left:25px;
        }

        li{
            margin-bottom:12px;
            font-size:16px;
            line-height:1.5;
        }

        .note{
            margin-top:30px;
            background:#FFF8E1;
            border-left:5px solid #FFC107;
            padding:15px;
            font-size:15px;
        }

        .footer{
            text-align:right;
            margin-top:35px;
        }

        .btnNext{
            background:#6f2c91;
            color:white;
            border:none;
            padding:12px 35px;
            font-size:16px;
            border-radius:5px;
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

    <div class="header">
        <h2>Patient Eligibility Criteria</h2>
    </div>

    <div class="content">

        <h3>Inclusion Criteria</h3>

        <ul>
            <li>Adult patients aged <strong>18 years and above</strong>.</li>
            <li>Elective surgery under <strong>general anaesthesia</strong>.</li>
            <li>American Society of Anesthesiologists (ASA) physical status <strong>I–III</strong>.</li>
            <li>Able to communicate in <strong>Bahasa Malaysia</strong> or <strong>English</strong>.</li>
        </ul>

        <h3>Exclusion Criteria</h3>

        <ul>
            <li>Emergency surgery.</li>
            <li>Patients transferred directly to ICU postoperatively.</li>
            <li>Pre-existing nausea or vomiting (e.g. intestinal obstruction).</li>
            <li>Obstetric patients.</li>
            <li>Receiving chronic antiemetic or systemic corticosteroid therapy.</li>
            <li>Surgery under regional anaesthesia or monitored anaesthesia care.</li>
            <li>Altered mental status or unable to communicate reliably.</li>
            <li>Patients undergoing day-case surgery.</li>
        </ul>

        <div class="note">
            <strong>Note:</strong><br />
            Please review the above eligibility criteria carefully before proceeding with patient enrolment.
        </div>

        <div class="footer">
            <asp:Button ID="btnNext"
                runat="server"
                Text="Next →"
                CssClass="btnNext"
                OnClick="btnNext_Click" />
        </div>

    </div>

</div>

</form>

</body>
</html>
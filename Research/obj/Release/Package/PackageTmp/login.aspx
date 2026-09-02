<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="Research.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PONV Research System</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Arial;
            background: #f4f6f9;
        }

        .container {
            width: 450px;
            margin: 50px auto;
            background: white;
            border-radius: 10px;
            padding: 35px;
            box-shadow: 0 5px 15px rgba(0,0,0,.15);
        }

        .logo {
            text-align: center;
            margin-bottom: 15px;
        }

        .logo img {
            width: 120px;
        }

        h2 {
            text-align: center;
            color: #6f2c91;
            font-size: 22px;
            margin-bottom: 10px;
        }

        .topic {
            text-align: center;
            color: #555;
            font-size: 15px;
            margin-bottom: 30px;
            line-height: 1.5;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
            margin-bottom: 6px;
        }

        .textbox {
            width: 100%;
            padding: 10px;
            border: 1px solid #CCC;
            border-radius: 5px;
            font-size: 15px;
        }

        .btnLogin {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            background: #6f2c91;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btnLogin:hover {
            background: #5b2178;
        }

        .footer {
            text-align: center;
            margin-top: 25px;
            color: #888;
            font-size: 12px;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 15px;
        }

    </style>

</head>
<body>

<form id="form1" runat="server">

<div class="container">

    <div class="logo">
        <!-- Replace with your UiTM logo -->
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfiu9kO6Ck2wtVQI3WxxNPl8Nf4OnL21BK2DXv-TfxJ5FfVmA2Dq4M8D1v&s=10" alt="UiTM Logo" />
    </div>

    <h2>Research Login Portal</h2>

    <div class="topic">
        <strong>
        Recommended Prophylaxis For Postoperative Nausea And Vomiting
        In Adult Patients: A Single Centre, Prospective Cohort Study
        </strong>
    </div>

    <label>Username ID</label>

    <asp:TextBox
        ID="txtUsername"
        runat="server"
        CssClass="textbox"
        Text="admin">
    </asp:TextBox>

    <label>Password</label>

    <asp:TextBox
        ID="txtPassword"
        runat="server"
        TextMode="Password"
        CssClass="textbox"
        Text="123456">
    </asp:TextBox>

    <asp:Button
        ID="btnLogin"
        runat="server"
        Text="Login"
        CssClass="btnLogin"
        OnClick="btnLogin_Click" />

    <asp:Label
        ID="lblMessage"
        runat="server"
        CssClass="error">
    </asp:Label>

    <div class="footer">
        Universiti Teknologi MARA (UiTM)
    </div>

</div>

</form>

</body>
</html>
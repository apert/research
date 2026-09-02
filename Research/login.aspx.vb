Public Class login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtUsername.Text = "admin"
        txtPassword.Attributes("value") = "123456"
    End Sub
    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        txtUsername.Text = "admin"
        txtPassword.Attributes("value") = "123456"
        Dim username As String = txtUsername.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()

        'Example only
        If username = "admin" And password = "123456" Then

            Session("UserID") = username
            Response.Redirect("Eligibility.aspx")

        Else

            lblMessage.Text = "Invalid Username ID or Password."

        End If

    End Sub
End Class
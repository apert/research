Public Class Eligibility
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub btnNext_Click(sender As Object, e As EventArgs)

        'Go to next page
        Response.Redirect("LanguageSelect.aspx")

    End Sub
End Class
Public Class PatientConsent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim lang As String = Request.QueryString("lang")

            If lang = "bm" Then
                LoadMalay()
            Else
                LoadEnglish()
            End If

        End If

    End Sub

    Private Sub LoadMalay()

        lblPageTitle.Text = "Borang Maklumat Peserta"


        lblResearchTitleHeader.Text = "Tajuk Penyelidikan"

        lblResearchTitle.Text =
    "Pematuhan terhadap Profilaksis yang Disyorkan oleh Garis Panduan bagi Loya dan Muntah Pascaoperatif dalam Kalangan Pesakit Dewasa: Kajian Kohort Prospektif Satu Pusat"


        lblIntroductionHeader.Text = "Pengenalan Penyelidikan"

        lblIntroduction.Text =
    "Mual dan muntah selepas pembedahan (PONV) adalah komplikasi biasa selepas anestesia am, yang boleh menyebabkan ketidakselesaan dan melambatkan pemulihan. Kajian pemerhatian ini bertujuan untuk menilai bagaimana doktor menetapkan ubat-ubatan bagi mencegah loya dan muntah dalam kalangan pesakit dewasa yang menjalani pembedahan. Penjagaan perubatan anda tidak akan terjejas oleh penyertaan anda dalam kajian ini."


        lblPurposeHeader.Text = "Tujuan Penyelidikan"

        lblPurpose.Text =
    "Tujuan kajian ini adalah untuk menilai pelaksanaan garis panduan pengurusan loya dan muntah selepas pembedahan (PONV) serta hasil rawatan pesakit di Hospital Al-Sultan Abdullah. Kajian ini adalah bersifat pemerhatian dan tidak akan mengubah, menambah, atau mengganggu rawatan perubatan anda. Rawatan anda akan diteruskan seperti biasa oleh pasukan klinikal mengikut amalan standard hospital. Penyelidik akan menyemak rekod perubatan anda bagi mendapatkan maklumat berkaitan pengurusan anestesia serta menjalankan penilaian ringkas semasa tempoh pemulihan selepas pembedahan."


        lblProcedureHeader.Text = "Prosedur Penyelidikan"

        lblProcedure.Text =
    "Kami akan mengumpul maklumat mengenai risiko loya dan muntah pascapembedahan anda sebelum pembedahan dijalankan dengan menggunakan alat penilaian standard (Apfel Simplified Risk Score). Semasa pembedahan, ubat-ubatan yang diberikan oleh doktor yang merawat anda akan direkodkan sebagai sebahagian daripada penjagaan rutin. Selepas pembedahan, kami akan memantau keadaan anda sehingga 24 jam untuk merekodkan sebarang gejala loya atau muntah, serta sebarang ubat-ubatan tambahan yang diberikan untuk merawat gejala tersebut. Tiada prosedur, ujian, atau ubat-ubatan tambahan diperlukan untuk kajian ini."


        lblParticipationHeader.Text = "Penyertaan Dalam Penyelidikan"

        lblParticipation.Text =
    "Penyertaan anda di dalam penyelidikan ini adalah secara sukarela. Anda berhak menolak tawaran penyertaan ini atau menarik diri daripada penyelidikan ini pada bila-bila masa tanpa sebarang penalti."


        lblBenefitHeader.Text = "Manfaat Penyelidikan"

        lblBenefit.Text =
    "Kajian ini akan membantu mengenal pasti kekurangan dalam amalan profilaksis PONV semasa. Penemuan kajian boleh meningkatkan penjagaan pesakit, mengurangkan kejadian PONV, dan memperbaiki keputusan selepas pembedahan pada masa hadapan."


        lblRiskHeader.Text = "Risiko Penyelidikan"

        lblRisk.Text =
    "Tiada risiko tambahan yang berkaitan dengan penyertaan dalam kajian ini. Rawatan perubatan anda akan diteruskan mengikut amalan standard hospital. Penyertaan dalam kajian ini adalah sepenuhnya secara sukarela, dan keengganan untuk menyertai atau penarikan diri daripada kajian pada bila-bila masa tidak akan menjejaskan rawatan perubatan yang diterima. Penyertaan dalam kajian ini melibatkan satu sesi temu bual ringkas sebelum pembedahan serta penilaian susulan pada 6 jam dan 24 jam selepas pembedahan, yang mengambil masa kira-kira 10 hingga 15 minit secara keseluruhan."


        lblConfidentialHeader.Text = "Kerahsiaan"

        lblConfidential.Text =
    "Maklumat peribadi anda akan dirahsiakan. Keputusan kajian akan dilaporkan secara kolektif tanpa mengenal pasti pesakit individu."


        lblContact.Text =
    "Sekiranya anda mempunyai sebarang pertanyaan mengenai penyelidikan ini atau hak-hak anda, sila hubungi Dr Nur Atikah di talian 0136696276."



        lblConsentHeader.Text = "Pengesahan Persetujuan"



        chkAge.Text =
    "Saya berumur 18 tahun ke atas"


        chkReview.Text =
    "Saya membenarkan penyemakan rekod, analisis dan penggunaan data daripada penyelidikan ini."


        chkUnderstand.Text =
    "Saya memahami tujuan dan skop penyelidikan yang sedang dijalankan."


        chkTerms.Text =
    "Saya telah membaca dan memahami semua terma dan syarat penyertaan saya dalam penyelidikan ini."


        chkAgree.Text =
    "Saya secara sukarela bersetuju untuk mengambil bahagian dalam penyelidikan ini dan mengikuti prosedur kajian."


        chkWithdraw.Text =
    "Saya boleh memilih untuk menarik diri daripada penyelidikan ini pada bila-bila masa tanpa memberikan sebarang alasan."


    End Sub
    Private Sub LoadEnglish()

        lblPageTitle.Text = "Participant Information Sheet"

        lblResearchTitleHeader.Text = "Research Title"
        lblResearchTitle.Text = "Adherence To Guideline-Recommended Prophylaxis for Postoperative Nausea And Vomiting In Adult Patients: A Single Centre, Prospective Cohort Study."

        lblIntroductionHeader.Text = "Introduction of Research"
        lblIntroduction.Text = "Postoperative nausea and vomiting (PONV) are common side effects after general anaesthesia, which may cause discomfort and delay recovery. This observational study aims to assess how doctors prescribe medications to prevent nausea and vomiting in adult patients undergoing surgery. Your medical care will not be affected by your participation in this study."

        lblPurposeHeader.Text = "Purpose of Research"
        lblPurpose.Text = "The objective of this study is to evaluate the implementation of established PONV management guidelines and to assess patient outcomes under routine clinical care at Hospital Al-Sultan Abdullah."

        lblProcedureHeader.Text = "Research Procedure"
        lblProcedure.Text = "If you agree to take part, we will assess your risk of postoperative nausea and vomiting before your surgery using Apfel Simplified Risk Score."

        lblParticipationHeader.Text = "Participation in Research"
        lblParticipation.Text = "Your participation in this research is entirely voluntary. You may refuse to take part or withdraw at any time without penalty."

        lblBenefitHeader.Text = "Benefit of Research"
        lblBenefit.Text = "This study may help us better understand how medications to prevent nausea and vomiting are used in current practice."

        lblRiskHeader.Text = "Research Risk"
        lblRisk.Text = "There are no additional risks associated with participation in this study."

        lblConfidentialHeader.Text = "Confidentiality"
        lblConfidential.Text = "Your personal details will not be identified in any reports or publications."

        lblContact.Text = "If you have any questions about this research, please contact Dr Atikah at 0136696276."


        lblConsentHeader.Text = "Consent Confirmation"

        chkAge.Text = "I am 18 years old and above"
        chkReview.Text = "I authorise the review of records, analysis, and use of the data arising from this research."
        chkUnderstand.Text = "I understand the nature and scope of the research being undertaken."
        chkTerms.Text = "I have read and understood all the terms and conditions of my participation in the research."
        chkAgree.Text = "I voluntarily agree to participate in this research and follow the study procedures."
        chkWithdraw.Text = "I may at any time choose to withdraw from this research without giving any reason."

    End Sub
    Protected Sub btnNext_Click(sender As Object, e As EventArgs) Handles btnNext.Click


        If chkAge.Checked = False OrElse
           chkReview.Checked = False OrElse
           chkUnderstand.Checked = False OrElse
           chkTerms.Checked = False OrElse
           chkAgree.Checked = False OrElse
           chkWithdraw.Checked = False Then


            ScriptManager.RegisterStartupScript(Me,
            Me.GetType(),
            "alert",
            "alert('Please confirm all consent statements before continuing.');",
            True)

            Exit Sub

        End If


        Response.Redirect("PatientConsentForm.aspx?lang=" & Request.QueryString("lang"))


    End Sub
End Class
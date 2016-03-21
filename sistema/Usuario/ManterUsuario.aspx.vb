Imports System.Data
Partial Class sistema_Usuario_ManterUsuario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim acao As String = Request("acao")
        Dim strRetorno As String = ""
        Dim txt_destinatario As String = String.Empty

        Select Case UCase(acao)
            Case "RECUPERAR_SENHA"
                Dim id As Integer = Request("id")

                'GERAR SENHA
                Dim r As Random = New Random()
                Dim ct As Integer = 0
                Dim senha As Integer
                While ct < 6
                    senha &= r.Next(1, 9)
                    ct = ct + 1
                End While

                'ALTERAR SENHA DO USUÁRIO
                Dim oUsuario As Usuario = New Usuario()
                oUsuario.id_ = id
                oUsuario.senha_ = senha
                Call oUsuario.RedefinirSenha()

                'ENVIAR E-MAIL COM A NOVA SENHA
                Dim dtUsuario As DataTable = oUsuario.DetalheUsuario()
                If dtUsuario.Rows.Count > 0 Then
                    For Each row In dtUsuario.Rows
                        txt_destinatario = row("txt_email").ToString()
                    Next
                End If

                Dim oEmail As ClsEmail = New ClsEmail()
                oEmail.txt_assunto_ = "Redefinir Senha"
                oEmail.txt_destinario_ = txt_destinatario
                oEmail.txt_mensagem_ = "Nova Senha: " & senha
                Call oEmail.EnviarEmail()

                'RETORNO
                ClientScript.RegisterStartupScript(Me.GetType, "erro", "<script language='javascript'>alert('SENHA ENVIADA.'); self.location.href='" & ResolveUrl("~/index.asp") & "';</script>")
        End Select

    End Sub
End Class

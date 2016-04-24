Imports System.Data
Imports System.Data.SqlClient

Public Class ClsEmail
    Public txt_mensagem_ As String
    Public txt_destinario_ As String
    Public txt_assunto_ As String

    Sub EnviarEmail()
        Dim conexao As New Conexao
        Dim cmd As New SqlCommand
        Dim dr As SqlDataReader

        Dim txt_smtp, txt_conta, txt_senha As String
        Dim ssl As Boolean
        Dim cod_porta As Integer

        cmd.Connection = conexao.ObterConexaoAberta()
        cmd.CommandText = "SELECT txt_smtp, txt_conta, txt_senha, ssl, cod_porta FROM tbl_sistema_configuracao"
        cmd.CommandType = CommandType.Text

        dr = cmd.ExecuteReader(CommandBehavior.CloseConnection)

        While dr.Read
            txt_smtp = dr("txt_smtp")
            txt_conta = dr("txt_conta")
            txt_senha = dr("txt_senha")
            ssl = dr("ssl")
            cod_porta = dr("cod_porta")
        End While
        dr.Close()
        
        'Cria objeto com dados do e-mail.
        Dim objEmail As New System.Net.Mail.MailMessage()

        'Define o remetente do e-mail.
        objEmail.From = New System.Net.Mail.MailAddress(txt_conta, "SGD", System.Text.Encoding.UTF8)

        'Define os destinatários do e-mail.
        objEmail.To.Add(Me.txt_destinario_)

        'Define a prioridade do e-mail.
        objEmail.Priority = System.Net.Mail.MailPriority.Normal

        'Define o formato do e-mail HTML (caso não queira HTML alocar valor false)
        objEmail.IsBodyHtml = True

        'Define o título do e-mail.
        objEmail.Subject = Me.txt_assunto_

        'Define o corpo do e-mail.        
        objEmail.Body = Me.txt_mensagem_

        'Para evitar problemas com caracteres "estranhos", configuramos o Charset para "ISO-8859-1"
        objEmail.SubjectEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1")
        objEmail.BodyEncoding = System.Text.Encoding.GetEncoding("ISO-8859-1")

        'Cria objeto com os dados do SMTP
        Dim objSmtp As New System.Net.Mail.SmtpClient

        'Alocamos o endereço do host para enviar os e-mails:
        objSmtp.Host = txt_smtp

        objSmtp.Credentials = New System.Net.NetworkCredential(txt_conta, txt_senha)

        objSmtp.Port = cod_porta
        objSmtp.EnableSsl = ssl

        'Enviamos o e-mail através do método .Send()
        Try
            objSmtp.Send(objEmail)
        Catch ex As Exception
            HttpContext.Current.Response.Write(ex.Message.ToString())
        Finally
            'Excluímos o objeto de e-mail da memória, é opcional
            objEmail.Dispose()
        End Try
    End Sub

End Class

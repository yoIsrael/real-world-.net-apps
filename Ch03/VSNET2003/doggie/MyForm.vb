Imports System
Imports System.Windows.Forms
Imports System.Threading

Public Class MyForm
  Inherits System.Windows.Forms.Form


  Public Class MyForm : Inherits Form
    Private game As Thread

    Public Sub New()
      InitializeComponent()
    End Sub

    Public Sub InitializeComponent()

      Dim mainMenu As New MainMenu()
      Dim gameMenuItem As New MenuItem("&Game")

      Dim gameNewGameMenuItem As New MenuItem("&New Game", _
        New EventHandler(AddressOf gameNewGameMenuItem_Click))
      Dim gameExitMenuItem As New MenuItem("E&xit", _
        New EventHandler(AddressOf gameExitMenuItem_Click))

      gameMenuItem.MenuItems.Add(gameNewGameMenuItem)
      gameMenuItem.MenuItems.Add(gameExitMenuItem)

      Dim aboutMenuItem As New MenuItem("&About", _
        New EventHandler(AddressOf aboutMenuItem_Click))

      mainMenu.MenuItems.Add(gameMenuItem)
      mainMenu.MenuItems.Add(aboutMenuItem)

      Me.Menu = mainMenu
      Me.MaximizeBox = False
      Me.FormBorderStyle = FormBorderStyle.Fixed3D
      Me.Icon = New Icon("images/pac.ico")
      Me.Text = ".NET Pacman"

      AddHandler Me.KeyDown, AddressOf DetectKeyDown
      game = New Thread(New ThreadStart(AddressOf Run))

      GameManager.SetState(GameState.Start)
      ClientSize = New Size(GameManager.Width, GameManager.Height)
      game.Start()
    End Sub

    Public Sub aboutMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
      Dim aboutBox As New Form()
      Dim okButton As New Button()
      Dim imageLabel As New Label()
      Dim textLabel As New Label()

      aboutBox.ClientSize = New Size(450, 200)
      aboutBox.FormBorderStyle = FormBorderStyle.FixedDialog
      aboutBox.Text = "About .NET Pacman"
      aboutBox.MaximizeBox = False
      aboutBox.MinimizeBox = False
      aboutBox.CancelButton = okButton
      aboutBox.StartPosition = FormStartPosition.CenterScreen
      Dim img As Image = Image.FromFile("images/pac.ico")
      imageLabel.Image = img
      imageLabel.Size = New Size(img.Width, img.Height)
      imageLabel.Location = New Point(25, 20)

      okButton.Text = "OK"

      textLabel.Text = "Copyright (C) 2002 Budi Kurniawan\n\n" & _
        "This Pacman game was built by Paul Karjo as a part of a book called\n" & _
        "'10 .NET Projects' by Budi Kurniawan published by APress.\n\n" & _
        "Copyright (C) 2002 Paul Karjo\n" & _
        "koochinpoo@hotmail.com\n\n\n" & _
        "Pacman was originally designed by Toru Iwatani\n" & _
        "and his associates."

      textLabel.Width = aboutBox.ClientSize.Width
      textLabel.Height = aboutBox.ClientSize.Height - okButton.Height - 10

      textLabel.Location = New Point(50 + img.Width, 20)

      okButton.Location = New Point(aboutBox.ClientSize.Width - _
        okButton.Width - 1, aboutBox.ClientSize.Height - okButton.Height - 10)

      aboutBox.Controls.Add(okButton)
      aboutBox.Controls.Add(textLabel)
      aboutBox.Controls.Add(imageLabel)

      aboutBox.ShowDialog()
    End Sub


    Public Sub gameNewGameMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
      GameManager.SetState(GameState.[New])
    End Sub

    Public Sub gameExitMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
      Me.Close()
    End Sub

    Protected Overrides Sub OnClosed(ByVal e As EventArgs)
      GameManager.SetState(GameState.Stop)
      If game.ThreadState = ThreadState.Suspended Then
        game.Resume()
      End If
      game.Abort()
      MyBase.OnClosed(e)
    End Sub

    Protected Sub DetectKeyDown(ByVal sender As Object, ByVal e As KeyEventArgs)
      If e.KeyCode = Keys.Space Then
        If game.ThreadState = ThreadState.Suspended Then
          game.Resume()
        ElseIf game.ThreadState = ThreadState.Running Then
          game.Suspend()
        End If
      Else
        GameManager.KeyDown(sender, e)
      End If
    End Sub

    Public Sub Run()
      Thread.Sleep(1000)
      While True
        Dim t1 As Integer = Environment.TickCount
        Dim g As Graphics = Me.CreateGraphics()
        GameManager.Draw(g)
        Dim t2 As Integer = Environment.TickCount
        g.Dispose()
        Thread.Sleep(Math.Max(0, 30 - (t2 - t1)))
      End While
    End Sub

    '    <STAThread()> Shared Sub Main()
    '      Application.Run(New Form1())
    '    End Sub

  End Class

End Class

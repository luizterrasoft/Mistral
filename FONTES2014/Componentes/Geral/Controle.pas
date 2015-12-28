unit Controle;

interface
Uses classes, Windows,controls;

Function RetPosicao(Janela : TComponent) : Integer;
Function ObjetoFocusedFound(Janela : TComponent) : Tobject;

implementation

Function RetPosicao(Janela : TComponent) : Integer;
Var JanelaPai : TComponent;
Begin
    If Janela.OWner <> Nil Then Begin
       JanelaPai := Janela.OWner;
       While JanelaPai.OWner <> Nil  Do
             JanelaPai := JanelaPai.OWner;
       Result := JanelaPai.ComponentCount;
    End
    Else
       Result := Janela.ComponentCount;
End;

Function ObjetoFocusedFound(Janela : TComponent) : Tobject;
Var JanelaPai : TComponent;
    nHandle : HWND;
    Ind : Word;
Begin
    //JanelaPai := TComponent.Create(Janela);
    //If Janela.OWner.Name <> '' Then Begin
    //   JanelaPai := Janela.OWner;
    //   While JanelaPai.OWner.Name <> ''  Do
    //         JanelaPai := JanelaPai.OWner;
    //End;

    //If Janela.OWner.Name = '' Then
          JanelaPai := Janela;

    Result := Nil;

    nHandle := GetFocus;
    For Ind := 0 To (JanelaPai.ComponentCount - 1) Do Begin
          If JanelaPai.Components [Ind] Is  TWinControl Then
               If TWinControl(JanelaPai.Components[Ind]).Handle = nHandle Then Begin
                       Result := JanelaPai.Components[Ind];
                       Break;
               End;
    End;
    //JanelaPai.Destroy;
End;

end.

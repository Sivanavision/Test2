page 50228 "Expand/Collaps Page"
{
    Caption = 'Expand/Collaps Page';
    PageType = Worksheet;
    SourceTable = "Expand Location";
    UsageCategory = Tasks;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Location; LocationGVar)
                {
                    ApplicationArea = All;
                    Caption = 'Show Demand as';
                    ToolTip = 'Specifies a filter to define which demand types you want to display in the Order Planning window.';
                    //TableRelation = Location.Code where("Use As In-Transit" = filter(false));
                    trigger OnValidate()
                    var
                        LocationLRec: Record Location;
                        ExpandLocationLRec: Record "Expand Location";
                        ILE: Record "Item Ledger Entry";
                        IndentNo: Integer;
                        IndentLineNo: Integer;
                        Window: Dialog;
                        EntryNo: Integer;
                    begin
                        Window.Open('Location Code #1######');
                        ExpandLocationLRec.DeleteAll();
                        clear(IndentNo);
                        Clear(EntryNo);
                        LocationLRec.Reset();
                        if LocationLRec.FindSet() then
                            repeat

                                Window.Update(1, LocationLRec.Code);

                                EntryNo += 1;
                                ExpandLocationLRec.Init();
                                ExpandLocationLRec."Entry No." := EntryNo;
                                ExpandLocationLRec."Location Code" := LocationLRec.Code;
                                ExpandLocationLRec."Indent No." := 0;
                                ExpandLocationLRec.Insert();
                                EntryNo += 1;
                                Clear(IndentLineNo);
                                IndentLineNo := 10000;
                                ILE.Reset();
                                ILE.SetRange("Location Code", LocationLRec.Code);
                                if ILE.FindSet() then
                                    repeat
                                        ExpandLocationLRec.Init();
                                        ExpandLocationLRec."Entry No." := EntryNo;
                                        ExpandLocationLRec."Item No." := ILE."Item No.";
                                        ExpandLocationLRec.Desciption := ILE.Description;
                                        ExpandLocationLRec."Location Code" := ILE."Location Code";
                                        ExpandLocationLRec.Quantity := ILE.Quantity;
                                        ExpandLocationLRec."Indent No." := 1;
                                        ExpandLocationLRec."Indent Line No." := 1;
                                        ExpandLocationLRec.Insert();
                                        IndentLineNo += 10000;
                                        EntryNo += 1;
                                    until ILE.Next() = 0;

                            until LocationLRec.next = 0;
                        Window.Close();
                        CurrPage.Update(true);
                    end;
                }
            }
            repeater(Control1)
            {
                IndentationColumn = DescriptionIndent;
                //IndentationControls = Description;
                ShowAsTree = true;
                ShowCaption = false;
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.';
                    ApplicationArea = All;
                }
                field("Indent No."; Rec."Indent No.")
                {
                    ToolTip = 'Specifies the value of the Indent No. field.';
                    ApplicationArea = All;
                }
                field("Indent Line No."; Rec."Indent Line No.")
                {
                    ToolTip = 'Specifies the value of the Indent Line No. field.';
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the number of the item in the entry.';
                    ApplicationArea = All;
                }
                field(Desciption; Rec.Desciption)
                {
                    ToolTip = 'Specifies the value of the Desciption field.';
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the number of units of the item in the item entry.';
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        DescriptionIndent := 0;
        DescriptionOnFormat();
    end;

    local procedure DescriptionOnFormat()
    begin
        DescriptionIndent := "Indent No." + "Indent Line No.";
        DescriptionEmphasize := "Indent No." = 0;
    end;

    var
        LocationGVar: Code[20];
        [InDataSet]
        DescriptionEmphasize: Boolean;
        [InDataSet]
        DescriptionIndent: Integer;

}

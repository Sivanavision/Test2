page 50192 "Import Claim Form"
{
    ApplicationArea = All;
    Caption = 'Import Claim Form';
    PageType = List;
    UsageCategory = Administration;
    SourceTable = "Excel Buffer";
    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Cell Type"; Rec."Cell Type")
                {
                    ToolTip = 'Specifies the value of the Cell Type field.';
                    ApplicationArea = All;
                }
                field("Cell Value as Text"; Rec."Cell Value as Text")
                {
                    ToolTip = 'Specifies the value of the Cell Value as Text field.';
                    ApplicationArea = All;
                }
                field("Column No."; Rec."Column No.")
                {
                    ToolTip = 'Specifies the value of the Column No. field.';
                    ApplicationArea = All;
                }
                field("Row No."; Rec."Row No.")
                {
                    ToolTip = 'Specifies the value of the Row No. field.';
                    ApplicationArea = All;
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(Import)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    ServerFileName := FileMgmt.UploadFile(Text100, Ext);
                    if ServerFileName <> '' then
                        SheetName := ExcelBuffer1.SelectSheetsName(ServerFileName);

                    if SheetName <> '' then
                        ImportLines();
                end;
            }
        }

    }
    PROCEDURE GetValueAtCell(RowNo: Integer; ColumnNo: Integer): Text;
    BEGIN
        IF ExcelBuffer1.GET(RowNo, ColumnNo) THEN
            EXIT(ExcelBuffer1."Cell Value as Text");
    END;

    procedure ImportLines()
    var
        I: Integer;

    begin
        Clear(I);
        ExcelBuffer1.OpenBook(ServerFileName, SheetName);
        ExcelBuffer1.ReadSheet();
        //ExcelBuffer1.SETRANGE("Column No.", 1);
        IF ExcelBuffer1.FINDSET THEN BEGIN
            FOR I := 1 TO ExcelBuffer1.Count() DO BEGIN
                if I <> 1 then begin
                    message('%1--Row: %2--Column: %3', GetValueAtCell(I, 1), I, 1);
                end;
            end;
        end;
    end;

    var
        ExcelBuffer1: Record "Excel Buffer";
        ServerFileName: Text;
        SheetName: Text;
        FileMgmt: Codeunit "File Management";
        Ext: Text;
        Text100: Label 'Milestone Selections';

}

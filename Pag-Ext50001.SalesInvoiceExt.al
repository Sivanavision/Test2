pageextension 50003 "Sales Invoice Ext" extends "Sales Invoice"
{
    layout
    {
        addlast(General)
        {

            field("Posting No."; Rec."Posting No.")
            {
                ToolTip = 'Specifies the value of the Posting No. field.';
                ApplicationArea = All;
            }
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ToolTip = 'Specifies the value of the Posting No. Series field.';
                ApplicationArea = All;
            }
        }
    }
}

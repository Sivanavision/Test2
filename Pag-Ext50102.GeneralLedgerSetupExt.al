pageextension 50102 "General Ledger Setup Ext" extends "General Ledger Setup"
{
    layout
    {
        addlast(General)
        {
            field("Reversal Date by Default"; Rec."Reversal Date by Default")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addlast(processing)
        {
            action(Open)
            {
                ApplicationArea = All;
                Caption = 'Open';
                Ellipsis = true;
                Image = Open;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    Hyperlink('https://ess.b2bsoftech.com/essportal/');
                end;
            }
        }
    }
}

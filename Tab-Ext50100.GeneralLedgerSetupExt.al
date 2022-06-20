tableextension 50100 "General Ledger Setup Ext" extends "General Ledger Setup"
{
    fields
    {
        field(50100; "Reversal Date by Default"; Enum "Reversal Date by Default")
        {
            Caption = 'Reversal Date by Default';
            DataClassification = ToBeClassified;
        }
    }
}

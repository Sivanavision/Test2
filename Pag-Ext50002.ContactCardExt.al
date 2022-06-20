pageextension 50002 "Contact Card Ext" extends "Contact Card"
{
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Error('You cannot insert a new record from contact list');
    end;
}

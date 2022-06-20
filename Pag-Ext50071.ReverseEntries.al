pageextension 50071 ReverseEntries extends "Reverse Entries"
{
    actions
    {
        modify(Reverse)
        {
            trigger OnbeforeAction()
            begin
                Commit();
                Clear(UserInput);
                UserInput.Setvalue(Rec."Posting Date");
                UserInput.RunModal();
            end;
        }
        modify("Reverse and &Print")
        {
            trigger OnbeforeAction()
            begin
                Commit();
                Clear(UserInput);
                UserInput.Setvalue(Rec."Posting Date");
                UserInput.RunModal();
            end;
        }
    }

    var
        UserInput: Page GLRegisterInput;
}
Page 50100 GLRegisterInput
{
    UsageCategory = Administration;
    ApplicationArea = All;
    PageType = StandardDialog;
    Caption = 'Input Reverse G/L Register Date';
    layout
    {
        area(Content)
        {
            group("Input Reversal Date")
            {
                field("Posting Date"; PostingdateGVar)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        GenLedgerSetupLRec: Record "General Ledger Setup";
    begin
        GenLedgerSetupLRec.get();
        case GenLedgerSetupLRec."Reversal Date by Default" of
            GenLedgerSetupLRec."Reversal Date by Default"::"On Posting Date":
                gdateUserPostingDate := PostingdateGVar;
            GenLedgerSetupLRec."Reversal Date by Default"::"On Work Date":
                gdateUserPostingDate := WorkDate();
        end

    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if gdateUserPostingDate = 0D then
            Error('Posting Date cannot be blank');
        gcuReverseRegister.gfuncGetUserRevervePostingDate(gdateUserPostingDate);
    end;

    procedure Setvalue(PostingDateLPar: Date)

    begin
        clear(PostingdateGVar);
        PostingdateGVar := PostingDateLPar;
    end;

    var
        gdateUserPostingDate: Date;
        gcuReverseRegister: Codeunit ReverseRegister;
        PostingdateGVar: Date;
}
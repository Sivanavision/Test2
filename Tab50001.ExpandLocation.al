table 50001 "Expand Location"
{
    Caption = 'Expand Location';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;
        }
        field(3; Desciption; Text[150])
        {
            Caption = 'Desciption';
            DataClassification = ToBeClassified;
        }
        field(4; "Indent No."; Integer)
        {
            Caption = 'Indent No.';
            DataClassification = ToBeClassified;
        }
        field(5; "Indent Line No."; Integer)
        {
            Caption = 'Indent Line No.';
            DataClassification = ToBeClassified;
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(7; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}

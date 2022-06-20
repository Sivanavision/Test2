page 50001 "Fields"
{
    ApplicationArea = All;
    Caption = 'Fields';
    PageType = List;
    SourceTable = "Field";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the type of the field in the table, which indicates the type of data it contains.';
                    ApplicationArea = All;
                }
                field("Type Name"; Rec."Type Name")
                {
                    ToolTip = 'Specifies the type of data.';
                    ApplicationArea = All;
                }
                field(TableNo; Rec.TableNo)
                {
                    ToolTip = 'Specifies the table number.';
                    ApplicationArea = All;
                }
                field(TableName; Rec.TableName)
                {
                    ToolTip = 'Specifies the name of the table.';
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the ID number of the field in the table.';
                    ApplicationArea = All;
                }
                field(FieldName; Rec.FieldName)
                {
                    ToolTip = 'Specifies the name of the field in the table.';
                    ApplicationArea = All;
                }
                field("Field Caption"; Rec."Field Caption")
                {
                    ToolTip = 'Specifies the caption of the field, that is, the name that will be shown in the user interface.';
                    ApplicationArea = All;
                }
                field(SQLDataType; Rec.SQLDataType)
                {
                    ToolTip = 'Specifies the SQL data type.';
                    ApplicationArea = All;
                }
                field(Len; Rec.Len)
                {
                    ToolTip = 'Specifies the value of the Len field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}

table 50101 "DEMO Level"
{
    DataClassification = SystemMetadata;
    Caption = 'DEMO Level';

    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'ID';
        }
        field(10; Color; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Color';
        }
        field(20; Stage; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Stage';
        }
        field(100; BrickExtendedText; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'DEMO Description';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; ID, Color, Stage, BrickExtendedText)
        {

        }
    }

}
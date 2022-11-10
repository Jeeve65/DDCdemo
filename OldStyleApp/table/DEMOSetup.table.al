table 50100 "DEMO Setup"
{
    DataClassification = CustomerContent;
    Caption = 'DEMO Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'Primary Key';
        }
        field(10; "Customer Level Type"; enum "DEMO Level Usage")
        {
            DataClassification = SystemMetadata;
            Caption = 'Customer Level';
        }

        // fields used as cues on the Business Manager Role Center
        field(1000; Level0; Integer)
        {
            Caption = 'Level 0';
            CaptionClass = DEMOLevel.GetDEMOLevelText(0);
            FieldClass = FlowField;
            CalcFormula = count(Customer where("DEMO Customer Level" = const(0)));
            Editable = false;
        }
        field(1001; Level1; Integer)
        {
            Caption = 'Level 1';
            CaptionClass = DEMOLevel.GetDEMOLevelText(1);
            FieldClass = FlowField;
            CalcFormula = count(Customer where("DEMO Customer Level" = const(1)));
            Editable = false;
        }
        field(1002; Level2; Integer)
        {
            Caption = 'Level 2';
            CaptionClass = DEMOLevel.GetDEMOLevelText(2);
            FieldClass = FlowField;
            CalcFormula = count(Customer where("DEMO Customer Level" = const(2)));
            Editable = false;
        }
        field(1003; Level3; Integer)
        {
            Caption = 'Level 3';
            CaptionClass = DEMOLevel.GetDEMOLevelText(3);
            FieldClass = FlowField;
            CalcFormula = count(Customer where("DEMO Customer Level" = const(3)));
            Editable = false;
        }
        field(1004; Level4; Integer)
        {
            Caption = 'Level 4';
            CaptionClass = DEMOLevel.GetDEMOLevelText(4);
            FieldClass = FlowField;
            CalcFormula = count(Customer where("DEMO Customer Level" = const(4)));
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        DEMOLevel: Codeunit "DEMO Level";
}
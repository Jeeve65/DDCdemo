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

        // fields used as cues
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

        field(2000; Customer10000; Integer)
        {
            Caption = 'Customer 10000';
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" where("Document Type" = const(Invoice), "Sell-to Customer No." = const('10000')));
            Editable = false;
        }
        field(2010; Customer20000; Integer)
        {
            Caption = 'Customer 20000';
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" where("Document Type" = const(Invoice), "Sell-to Customer No." = const('20000')));
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
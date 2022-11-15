tableextension 50100 "DEMO Customer" extends Customer
{
    fields
    {
        field(50100; "DEMO Customer Level"; Integer)
        {
            Caption = 'Customer Level';
            TableRelation = "DEMO Level".ID;
        }
    }

    keys
    {
        key(DEMOCustomerLevel; "DEMO Customer Level") { }
    }

    var
        DEMOLevel: Codeunit "DEMO Level";

    procedure DEMOCustomerLevelText(): Text
    begin
        exit(DEMOLevel.GetDEMOLevelText("DEMO Customer Level"));
    end;

    procedure DEMOCustomerLevelUp()
    begin
        DEMOLevel.LevelUp("DEMO Customer Level");
    end;

    procedure DEMOCustomerLevelDown()
    begin
        DEMOLevel.LevelDown("DEMO Customer Level");
    end;
}
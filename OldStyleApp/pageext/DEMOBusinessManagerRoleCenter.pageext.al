pageextension 50101 "DEMO Business Center Role Cent" extends "Business Manager Role Center"
{
    layout
    {
        addlast(rolecenter)
        {
            part(DEMOCustomerLevel; "DEMO Customer Level Cues")
            {
                ApplicationArea = All;
                Caption = 'Customer Levels';
            }
        }
    }

    actions
    {
        addlast(embedding)
        {
            action(DEMOLevel0)
            {
                Caption = 'No Level';
                ApplicationArea = All;
                RunObject = page "DEMO Customer Level";
                RunPageView = where("DEMO Customer Level" = const(0));
            }
            action(DEMOLevelOther)
            {
                Caption = 'Other Levels';
                ApplicationArea = All;
                RunObject = page "DEMO Customer Level";
                RunPageView = where("DEMO Customer Level" = filter(1 ..));
            }
        }
    }
}
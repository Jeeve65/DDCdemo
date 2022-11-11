page 50104 "DEMO Customer Level RC"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Customer Level Rolecenter';

    layout
    {
        area(RoleCenter)
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
        area(embedding)
        {
            action(DEMOCustomerList)
            {
                Caption = 'Customers';
                ApplicationArea = All;
                RunObject = page "Customer List";
            }
            action(DEMOLevel0)
            {
                Caption = 'No Level';
                ApplicationArea = All;
                RunObject = page "DEMO Customer Level";
                RunPageView = where("DEMO Customer Level" = const(0));
            }
            action(DEMOLevelVIP)
            {
                Caption = 'VIPs';
                ApplicationArea = All;
                RunObject = page "DEMO Customer Level";
                RunPageView = where("DEMO Customer Level" = filter(4));
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
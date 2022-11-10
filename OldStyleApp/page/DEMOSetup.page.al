page 50100 "DEMO Setup"
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'DEMO Setup';
    UsageCategory = Administration;
    SourceTable = "DEMO Setup";

    InsertAllowed = false;
    DeleteAllowed = false;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'General';
                field("Customer Level Type"; Rec."Customer Level Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select which type of level description will be used.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OpenLevels)
            {
                ApplicationArea = All;
                Caption = 'Customer Levels';
                ToolTip = 'Show or edit the available levels';
                Image = LinkWithExisting;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                RunObject = page "DEMO Levels";
            }
            action(CreateDemoData)
            {
                ApplicationArea = All;
                Caption = 'Create Demo data';
                Image = Setup;
                Promoted = false;

                trigger OnAction()
                begin
                    DEMOLevel.CreateDemoData();
                end;
            }
        }
    }

    var
        DEMOLevel: Codeunit "DEMO Level";

    trigger OnOpenPage()
    begin
        DEMOLevel.Initialize();
    end;

}
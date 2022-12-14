page 50103 "DEMO Customer Level Cues"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "DEMO Setup";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            cuegroup(DEMOLevels)
            {
                Caption = 'Customers by level';

                field(Level0; Rec.Level0)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the number of customers having this level.';
                    DrillDownPageId = "DEMO Customer Level";
                }
                field(Level1; Rec.Level1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the number of customers having this level.';
                    DrillDownPageId = "DEMO Customer Level";
                }
                field(Level2; Rec.Level2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the number of customers having this level.';
                    DrillDownPageId = "DEMO Customer Level";
                }
                field(Level3; Rec.Level3)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the number of customers having this level.';
                    DrillDownPageId = "DEMO Customer Level";
                }
                field(Level4; Rec.Level4)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the number of customers having this level.';
                    DrillDownPageId = "DEMO Customer Level";
                }
            }
            cuegroup(SalesInvoices)
            {
                Caption = 'Sales Invoices by Customer';

                field(Customer10000; Rec.Customer10000)
                {
                    ApplicationArea = All;
                    ToolTip = 'The number of Sales Invoices for Customer 10000';
                    DrillDownPageId = "Sales Invoice List";
                }
                field(Customer20000; Rec.Customer20000)
                {
                    ApplicationArea = All;
                    ToolTip = 'The number of Sales Invoices for Customer 20000';
                    DrillDownPageId = "Sales Invoice List";
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(DEMOOpenSetup)
            {
                ApplicationArea = All;
                Caption = 'Setup Levels';
                Image = Setup;
                trigger OnAction()
                begin
                    Page.RunModal(Page::"DEMO Setup");
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
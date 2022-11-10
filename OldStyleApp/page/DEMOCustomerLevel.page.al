page 50102 "DEMO Customer Level"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;
    CardPageID = "Customer Card";
    Editable = false;
    Caption = 'Customer Level';
    ShowFilter = false;


    layout
    {
        area(Content)
        {
            repeater(Customers)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the customer''s No.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the customer''s Name';
                }
                field(DEMOCustomerLevel; DEMOCustLevelText)
                {
                    ApplicationArea = All;
                    Caption = 'Customer Level';
                    ToolTip = 'Shows the customer level';
                }
            }
        }
    }

    views
    {
        view(NonBlockedCustomer)
        {
            Caption = 'Not blocked';
            Filters = where(Blocked = const(" "));
            //NEW Filters = where(Blocked = const("Customer Blocked"::" "));
            OrderBy = ascending("DEMO Customer Level", "No.");
            SharedLayout = false;

            layout
            {
                movefirst(Customers; DEMOCustomerLevel)

                modify(DEMOCustomerLevel)
                {
                    Width = 20;
                    QuickEntry = false;
                }
            }
        }
    }

    var
        DEMOCustLevelText: Text;

    trigger OnAfterGetRecord()
    begin
        DEMOGetCustLevelText();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        DEMOGetCustLevelText();
    end;

    local procedure DEMOGetCustLevelText()
    begin
        DEMOCustLevelText := Rec.DEMOCustomerLevelText()
    end;

}
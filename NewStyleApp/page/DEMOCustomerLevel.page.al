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
        view("REALVIPS")
        {
            Caption = 'Real Vips';
            Filters = where("DEMO Customer Level" = const(4));
            OrderBy = descending(Name);
            SharedLayout = false;
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
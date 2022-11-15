pageextension 50100 "DEMO Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(DEMOCustomerLevel; DEMOCustLevelText)
            {
                ApplicationArea = All;
                Caption = 'Customer Level';
                ToolTip = 'Shows the Customer''s Level';
                Editable = false;
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            group(DEMOLevelActions)
            {
                Caption = 'Customer Level';

                action(DEMOLevelUp)
                {
                    Caption = 'Level Up';
                    ApplicationArea = All;
                    Image = MoveUp;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    PromotedOnly = false;

                    trigger OnAction()
                    begin
                        Rec.DEMOCustomerLevelUp();
                        CurrPage.Update(true);
                    end;

                }
                action(DEMOLevelDown)
                {
                    Caption = 'Level Down';
                    ApplicationArea = All;
                    Image = MoveDown;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    PromotedOnly = false;

                    trigger OnAction()
                    begin
                        Rec.DEMOCustomerLevelDown();
                        CurrPage.Update(true);
                    end;

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
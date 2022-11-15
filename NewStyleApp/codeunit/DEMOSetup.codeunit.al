codeunit 50101 "DEMO Setup"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterManualSetup', '', true, true)]
    local procedure OnRegisterManualSetup(sender: Codeunit "Guided Experience")
    begin
        sender.InsertManualSetup(
            'Set up DEMO Customer Levels to manage types of Customers', 'DEMO Customer Level setup',
            'Set up DEMO Customer Levels to manage types of Customers', 2,
            ObjectType::Page, Page::"DEMO Setup", "Manual Setup Category"::Sales,
            'Customer Level'
        );
    end;
}
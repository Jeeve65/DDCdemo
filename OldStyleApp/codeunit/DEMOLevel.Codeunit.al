codeunit 50100 "DEMO Level"
{
    trigger OnRun()
    begin

    end;

    // [InherentPermissions(PermissionObjectType::TableData, database::"DEMO Setup", 'RI', InherentPermissionsScope::Both)]
    procedure Initialize()
    var
        DEMOSetup: Record "DEMO Setup";
    begin
        if not DEMOSetup.Get() then begin
            DEMOSetup.Init();
            DEMOSetup.Insert();
        end;
    end;

    // [InherentPermissions(PermissionObjectType::TableData, database::"DEMO Setup", 'R', InherentPermissionsScope::Both)]
    // [InherentPermissions(PermissionObjectType::TableData, database::"DEMO Level", 'R', InherentPermissionsScope::Both)]
    procedure GetDEMOLevelText(ID: Integer): Text[30]
    var
        DEMOSetup: Record "DEMO Setup";
        DEMOLevel: Record "DEMO Level";
    begin
        Initialize();
        DEMOSetup.Get();
        DEMOLevel.SetFilter(ID, '..%1', ID);
        if DEMOLevel.FindLast() then
            exit(GetDEMOLevelText(DEMOSetup, DEMOLevel));
        exit('');
    end;

    local procedure GetDEMOLevelText(var DEMOSetup: Record "DEMO Setup"; var DEMOLevel: Record "DEMO Level"): Text[30]
    begin
        Case DEMOSetup."Customer Level Type" of
            "DEMO Level Usage"::Colors:
                exit(DEMOLevel.Color);
            "DEMO Level Usage"::Stages:
                exit(DEMOLevel.Stage);
            else
                exit('');
        End;
    end;

    // [InherentPermissions(PermissionObjectType::TableData, database::"DEMO Level", 'R', InherentPermissionsScope::Both)]
    procedure LevelUp(var Level: Integer)
    var
        DEMOLevel: Record "DEMO Level";
    begin
        DEMOLevel.SetFilter(ID, '>%1', Level);
        if DEMOLevel.FindFirst() then
            Level := DEMOLevel.ID;
    end;

    // [InherentPermissions(PermissionObjectType::TableData, database::"DEMO Level", 'R', InherentPermissionsScope::Both)]
    procedure LevelDown(var Level: Integer)
    var
        DEMOLevel: Record "DEMO Level";
    begin
        DEMOLevel.SetFilter(ID, '<%1', Level);
        if DEMOLevel.FindLast() then
            Level := DEMOLevel.ID;
    end;

    procedure CreateDemoData()
    begin
        CreateDemoData(0, 'Black', 'Not Boarded');
        CreateDemoData(1, 'Grey', 'Member');
        CreateDemoData(2, 'Blue', 'Associate');
        CreateDemoData(3, 'Green', 'Partner');
        CreateDemoData(4, 'Red', 'VIP');
    end;

    local procedure CreateDemoData(ID: Integer; Color: Text; Stage: Text)
    var
        DEMOLevel: Record "DEMO Level";
    begin
        if not DEMOLevel.Get(ID) then begin
            DEMOLevel.Init();
            DEMOLevel.ID := ID;
            DEMOLevel.Insert();
        end;
        DEMOLevel.Color := Color;
        DEMOLevel.Stage := Stage;
        DEMOLevel.Modify();
    end;
}
page 50101 "DEMO Levels"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "DEMO Level";

    layout
    {
        area(Content)
        {
            repeater(Levels)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Define the numeric valua of this level. Suggestion: use either an ascending or a descending series.';
                }
                field(Color; Rec.Color)
                {
                    ApplicationArea = All;
                    ToolTip = 'Define a color that matches this level.';
                }
                field(Stage; Rec.Stage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Define a stage description that matches this level.';
                }
            }
        }
    }
}
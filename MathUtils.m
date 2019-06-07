(* ::Package:: *)

BeginPackage["Utils`"]
packageName = Context[];

Utils::usage =
    "Useful utilities for generic notebooks."


"### Context Management";
Funcs`prependContext[context_] := If[ ! MemberQ[$ContextPath, context],
    PrependTo[$ContextPath, context];
];
"# Access Funcs directly, within package";
Funcs`prependContext["Funcs`"];


"### Auto Collapse Cell";
Funcs`autoCollapse[] :=(
    If[ $FrontEnd =!= $Failed,
        SelectionMove[EvaluationNotebook[], All, GeneratedCell];
        FrontEndTokenExecute["SelectionCloseUnselectedCells"]
    ]
);

SetAttributes[Funcs`hideShow, HoldFirst];
Funcs`hideShow[x_, styles_: {}] := (
    Print[
        Style[x, Sequence @@ styles]
    ];
    autoCollapse[];
);

SetAttributes[Funcs`hideInfo, HoldFirst];
Funcs`hideInfo[info_, styles_: {}] := hideShow[
    "### " <> ToString[info],
    {Bold}~Join~styles
];


"### Hold Items for Further Processing";
SetAttributes[Funcs`holdItems, HoldAll]
Funcs`holdItems[list_] := ReleaseHold[
    MapAt[HoldForm, Hold[list], {All, All}]
];


"### Plot Utils";
Funcs`colorPalette[theme_] := (
    ("DefaultPlotStyle" /. (
        Method /. Charting`ResolvePlotTheme[theme, ListPlot]
    )) /. Directive[x_, __] :> x
);

Funcs`getPlotPoints[plot_] := Cases[
    plot, Line[pts_] :> Line[pts], Infinity
] // Flatten // Cases[
    #, Line[pts_] :> Sequence @@ pts, Infinity
] &;

"### Export Plots";
SetAttributes[Funcs`exportPlot, HoldAll];
Funcs`exportPlot[plot_, dir_: "plots/"] := Export[
    dir <> ToString[HoldForm[plot]] <> ".pdf",
    ReleaseHold[plot]
];


"### Import Notebook";
Funcs`importNotebook[path_, open_: False] := Module[{
        nb, nbPath, context, action
    },
    context = Context[];
    nbPath = FindFile[path];
    nb = NotebookOpen[
        nbPath,
        CellContext -> context,
        Visible -> None
    ];
    NotebookEvaluate[nb];
    NotebookClose[nb];

    action := NotebookOpen[nbPath];
    If[open, action];
    Button[path, action]
];

"### Generate GIF From Manipulate[]";
Funcs`manipulateGif[manipulate_, name_String, step_Integer] := Export[
    name <> ".gif",
    Import[
        Export[name <> ".avi", manipulate]
        , "ImageList"
    ][[1 ;; -1 ;; step]]
];

"### Show Exec Time & Pass Output";
SetAttributes[Funcs`timeExec, {HoldAll, SequenceHold}];
Funcs`timeExec[operations__] := (
   Print[Now];
   (Print[#1]; #2) & @@ Timing[operations]
);


EndPackage[]


"### Access Funcs directly, in parent namespace";
Funcs`prependContext["Funcs`"];

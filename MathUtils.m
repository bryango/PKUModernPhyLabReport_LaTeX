BeginPackage["Utils`"]

Utils::usage =
    "Useful utilities for generic notebooks."


"### Context Management";
prependContext[context_] := If[ ! MemberQ[$ContextPath, #],
    PrependTo[$ContextPath, context];
];


"### Auto Collapse Cell";
autoCollapse[] :=(
    If[ $FrontEnd =!= $Failed,
        SelectionMove[EvaluationNotebook[], All, GeneratedCell];
        FrontEndTokenExecute["SelectionCloseUnselectedCells"]
    ]
);

SetAttributes[hideText, HoldFirst];
hideShow[x_, styles_: {}] := (
    Print[
        Style[x, Sequence @@ styles]
    ];
    autoCollapse[]
);

SetAttributes[hideInfo, HoldFirst];
hideInfo[info_, styles_: {}] := hideShow[
    "### " <> ToString[info],
    {Bold}~Join~styles
];


"### Hold Items for Further processing";
SetAttributes[holdItems, HoldAll]
holdItems[list_] := ReleaseHold[
    MapAt[HoldForm, Hold[list], {All, All}]
];


"### Plot Utils";
colorPalette[theme_] := (
    ("DefaultPlotStyle" /. (
        Method /. Charting`ResolvePlotTheme[theme, ListPlot]
    )) /. Directive[x_, __] :> x
);

getPlotPoints[plot_] := Cases[
    plot, Line[pts_] :> pts, Infinity
];


EndPackage[]

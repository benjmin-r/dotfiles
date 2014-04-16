var makeSmallerFromRight = slate.operation("resize", {
  "width" : "-5%",
  "height" : "0",
  "anchor" : "top-left"
});

var makeSmallerFromLeft = slate.operation("resize", {
  "width" : "-5%",
  "height" : "0",
  "anchor" : "top-right"
});

var makeBiggerToRight = slate.operation("resize", {
  "width" : "+5%",
  "height" : "0",
  "anchor" : "top-left"
});

var makeBiggerToLeft = slate.operation("resize", {
  "width" : "+5%",
  "height" : "0",
  "anchor" : "top-right"
});

var makeFullscreen = slate.operation("move", {
  "x": "screenOriginX",
  "y": "screenOriginY",
  "width" : "screenSizeX,
  "height" : "screenSizeY"
});


slate.bind("f:cmd,ctrl,alt", makeFullscreen);
slate.bind("h:cmd,ctrl,alt", makeSmallerFromRight);
slate.bind("l:cmd,ctrl,alt", makeSmallerFromLeft);
slate.bind(".:cmd,ctrl,alt", makeBiggerToRight);
slate.bind("n:cmd,ctrl,alt", makeBiggerToLeft);

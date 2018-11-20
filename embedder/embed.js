const { freeze } = Object;


if (!("WebAssembly" in window)) {
    throw new Error("WebAssembly not supported.");
}


const consoleImports = {
    log: console.log.bind(console),
};


const colours = new Map([
    [0, "red"],
    [1, "black"],
    [2, "white"],
    [3, "beige"],
]);

const colourImports = { };
for (const [key, value] of colours.entries()) {
    colourImports[value] = key;
}
freeze(colourImports);


const canvasElement = document.querySelector("canvas.main");
const context = canvasElement.getContext("2d");

const canvas = {};

canvas.setFillStyle = colourIndex => {
    const colour = colours.get(colourIndex);
    context.fillStyle = colour;
};

canvas.setStrokeStyle = colourIndex => {
    const colour = colours.get(colourIndex);
    context.strokeStyle = colour;
};

canvas.fillRect = (x, y, width, height) => {
    context.fillRect(x, y, width, height);
};

freeze(canvas);


const imports = {
    colours: colourImports,
    console: consoleImports,
    canvas,
};

fetch('main.wasm')
    .then(response => response.arrayBuffer())
    .then(wasm => WebAssembly.instantiate(wasm, imports));

const { freeze } = Object;

const consoleImports = freeze({
    log: (...rest) => {
        console.log(...rest);
        return rest[0] | 0;
    }
});

const checkForWebAssembly = () => {
    if (!("WebAssembly" in window)) {
        throw new Error("WebAssembly not supported.");
    }
};

const createColourImports = () => {
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

    return [
        colours,
        colourImports,
    ];
};

const createCanvas = (colours) => {
    const canvasElement = document.querySelector("canvas.main");
    const context = canvasElement.getContext("2d");

    const canvas = {
        width: Number.parseInt(canvasElement.getAttribute("width")),
        height: Number.parseInt(canvasElement.getAttribute("height")),
    };

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

    return canvas;
};

const instantiateWebAssembly = imports =>
    fetch('main.wasm')
        .then(response => response.arrayBuffer())
        .then(wasm => WebAssembly.instantiate(wasm, imports));

const main = () => {
    checkForWebAssembly();

    const [colours, colourImports] = createColourImports();
    freeze(colours);
    freeze(colourImports);

    const canvas = createCanvas(colours);
    freeze(canvas);

    const imports = freeze({
        colours: colourImports,
        console: consoleImports,
        canvas,
    });

    instantiateWebAssembly(imports);
};

main();

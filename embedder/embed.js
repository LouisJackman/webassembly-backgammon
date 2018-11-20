{
    if (!("WebAssembly" in window)) {
        throw new Error("WebAssembly not supported.");
    }

    const imports = {
        console: {
            log: (...args) => {
                console.log(...args);
            },
        },
    };

    fetch('main.wasm')
        .then(response => response.arrayBuffer())
        .then(wasm => WebAssembly.instantiate(wasm, imports));
}


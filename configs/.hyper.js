module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 14,

    // font family with optional fallbacks
    fontFamily: 'Fira Code, Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'UNDERLINE',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: true,

    // klaudiosinani Pokemon theme customization
    pokemon: 'dewgong',
    unibody: true,
    poketab: false,
    
    // Enable ligatures to work for Fira Code Font
    webGLRenderer: false,
    disableLigatures: false,
  },
  // a list of plugins to fetch and install from npm
  plugins: [
    'hyper-pokemon', 
    'hypercwd', 
    'hyper-search', 
    'hyper-statusline',
    'hyper-font-ligatures',
  ]
};
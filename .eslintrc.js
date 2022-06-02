module.exports = {
  "env": {
    "browser": true,
    "es6": true
  },
  "extends": [
    "plugin:react/recommended",
    "airbnb"
  ],
  "globals": {
    "Atomics": "readonly",
    "SharedArrayBuffer": "readonly"
  },
  "parserOptions": {
    "ecmaFeatures": {
    "jsx": true
  },
    "ecmaVersion": 2018,
    "sourceType": "module"
  },
  "plugins": [
    "react"
  ],
  "rules": {
    "react/function-component-definition": [
        2,
        {
            "namedComponents": "arrow-function",
            "unnamedComponents": "arrow-function"
        },
    ],
    "quotes": ["error", "double"],
    "indent": ["error", 2],
    "react/prop-types": 0,
    "react/jsx-fragments": 0,
  },
};

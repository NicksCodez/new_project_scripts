#!/bin/bash
#
# Author: NicksCodez
# Description: Script to speed up my project configurations
# Configs for react, babel, webpack, eslint, prettier
# Some manual configuration still required afterwards, check comments at end of file
# Script follows here:
#

npm init --yes

npm install --save-dev webpack webpack-dev-server webpack-cli style-loader css-loader eslint babel-loader @babel/core @babel/preset-env @babel/preset-react html-webpack-plugin

npm install --save-dev --save-exact prettier

npm install react react-dom

mkdir src dist

cd src

touch index.js index.html

printf '<!DOCTYPE html>\n<html lang="en">\n  <head>\n    <meta charset="UTF-8" />\n    <meta http-equiv="X-UA-Compatible" content="IE=edge" />\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <title>My React App</title>\n  </head>\n  <body>\n    <div id="root"></div>\n</body>\n  <script src="bundle.js"></script>\n</html>\n' > index.html

printf 'import React from "react";\nimport ReactDOM from "react-dom/client";\nimport App from "./components/App";\n\nconst root = ReactDOM.createRoot(document.getElementById("root"));\nroot.render(\n  <React.StrictMode>\n    <App />\n  </React.StrictMode>\n);\n' > index.js

mkdir components

cd components

touch App.js

printf 'import React, { Component } from "react";\n\nclass App extends Component {\n  render() {\n    return (\n      <div>\n        <h1>My React App</h1>\n      </div>\n    );\n  }\n}\n\nexport default App;\n' > App.js

cd ../..

touch .babelrc

printf '{\n  "presets": ["@babel/env", "@babel/react"]\n}\n' > .babelrc

touch .browserslistrc

printf '> 0.25%%\nnot dead\nnot op_mini all' > .browserslistrc

touch webpack.config.js

printf 'const path = require("path");\nconst HtmlWebpackPlugin = require("html-webpack-plugin");\n\nmodule.exports = {\n  entry: "./src/index.js",\n  output: {\n    filename: "bundle.js",\n    path: path.resolve(__dirname, "dist"),\n  },\n  devtool: "inline-source-map",\n  module: {\n    rules: [\n      {\n        test: /\.css$/i,\n        use: ["style-loader", "css-loader"],\n      },\n      {\n        test: /\.(png|svg|jpg|jpeg|gif)$/i,\n        type: "asset/resource",\n      },\n      {\n        test: /\.m?js$/,\n        exclude: /node_modules/,\n        use: {\n          loader: "babel-loader",\n        },\n      },\n    ],\n  },\n  plugins: [\n    new HtmlWebpackPlugin({\n      template: "./src/index.html",\n    }),\n  ],\n};\n' > webpack.config.js

echo node_modules/ > .gitignore

printf 'node_modules/\n' > .eslintignore

printf 'node_modules/\n' > .prettierignore

echo {} > .prettierrc.json

touch .eslintrc.json

mkdir .vscode

cd .vscode/

touch settings.json

printf '{\n  "editor.codeActionsOnSave": {\n      "source.fixAll.eslint": true\n  },\n  "eslint.validate": ["javascript"],\n  "editor.defaultFormatter": "esbenp.prettier-vscode",\n  "[javascript]": {\n    "editor.defaultFormatter": "esbenp.prettier-vscode"\n  },\n  "editor.formatOnSave": true,\n  \n}\n' > settings.json

cd ..

# Start of manual configurations
#
# Following command to initialise eslint
#
# npm init @eslint/config
#
# Following command to make eslint play nice with prettier
#
# npm install --save-dev eslint-config-prettier
#
# Modify following indented lines in .eslintrc.json
#	"extends": [
#        "plugin:react/recommended",
#        "airbnb",
#        "prettier"
#    ],
#	"rules": {
#    "no-console": "warn",
#    "quotes": ["error", "single"],
#    "no-plusplus": "off",
#    "react/prefer-stateless-function": "off",
#    "react/jsx-filename-extension": "off"
#  }
#
# Add following indented to package.json to make prettier use single quotes
#	"prettier": {
#	    "singleQuote": true
#	  }
#
# Add following indented scripts to package.json
#
# 	"scripts": {
#  	  "test": "echo \"Error: no test specified\" && exit 1",
#    	  "build": "webpack --mode production",
#   	  "watch": "webpack --watch",
#    	  "start": "webpack-dev-server --mode development --open --hot"
#	  },
#
# Following commands to initialize git
# 
# git init -b main
# git add . && git commit -m "initial commit"
# gh repo create

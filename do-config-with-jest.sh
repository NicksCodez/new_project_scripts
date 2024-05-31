#!/bin/bash
#
# Author: NicksCodez
# Description: Script to speed up my project configurations
# Configs for jest, babel, webpack, eslint, prettier
# Some manual configuration still required afterwards, check comments at end of file
# Script follows here:
#
npm init --yes

npm install --save-dev webpack webpack-cli style-loader css-loader eslint jest

npm install --save-dev --save-exact prettier

mkdir src dist __mocks__

cd src

touch index.js

cd ../dist/

touch index.html

printf '<!DOCTYPE html>\n<html lang="en">\n  <head>\n    <meta charset="UTF-8" />\n    <meta http-equiv="X-UA-Compatible" content="IE=edge" />\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <title>Document</title>\n  </head>\n  <body></body>\n  <script src="bundle.js"></script>\n</html>\n' > index.html

cd ../__mocks__

printf 'module.exports = \'test-file-stub';' > fileMock.js

printf 'module.exports = {};' > styleMock.js

cd ..

printf 'module.exports = {\n  moduleFileExtensions: ["js", "jsx"],\n  moduleDirectories: ["node_modules", "shared"],\n\nmoduleNameMapper: {\n    "\\\.(jpg|jpeg|png|gif|eot|otf|webp|svg|ttf|woff|woff2|mp4|webm|wav|mp3|m4a|aac|oga)$":\n      "<rootDir>/__mocks__/fileMock.js",\n    "\\\.(css|less)$": "<rootDir>/__mocks__/styleMock.js",\n  },\n};' > jest.config.js

npm install -D babel-loader @babel/core @babel/preset-env webpack

touch .babelrc

printf '{\n  "presets": ["@babel/preset-env"]\n}\n' > .babelrc

touch .browserslistrc

printf '> 0.25%%\nnot dead\nnot op_mini all' > .browserslistrc

touch webpack.config.js

printf 'const path = require("path");\n\nmodule.exports = {\n  mode: "development",\n  entry: "./src/index.js",\n  output: {\n    filename: "bundle.js",\n    path: path.resolve(__dirname, "dist"),\n  },\n  devtool: "inline-source-map",\n  module: {\n    rules: [\n      {\n        test: /\.css$/i,\n        use: ["style-loader", "css-loader"],\n      },\n      {\n        test: /\.(png|svg|jpg|jpeg|gif)$/i,\n        type: "asset/resource",\n      },\n      {\n        test: /\.m?js$/,\n        exclude: /node_modules/,\n        use: {\n          loader: "babel-loader",\n          options: {\n            presets: [["@babel/preset-env"]],\n          },\n        },\n      },\n    ],\n  },\n};\n' > webpack.config.js

echo node_modules/ > .gitignore

printf 'node_modules/\ndist/bundle.js' > .eslintignore

printf 'node_modules/\ndist/bundle.js' > .prettierignore

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
#	"extends": ["airbnb-base", "prettier"],
#	"rules": {
#	    "no-console": "warn",
#	    "quotes": ["error", "single"],
#	    "no-plusplus": "off"
#	  }
#
# Add following indented to package.json to make prettier use single quotes
#	"prettier": {
#	    "singleQuote": true
#	  }
#
# Add following indented scripts to package.json
#
# 	"scripts": {
# 	    "test": "jest",
# 	    "watch-jest": "jest --watch",
# 	    "build": "webpack",
# 	    "watch-webpack": "webpack --watch"
# 	  },
#
# Following commands to initialize git
# 
# git init -b main
# git add . && git commit -m "initial commit"
# gh repo create

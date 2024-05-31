#!/bin/bash

# Author: NicksCodez
# Description: Script to speed up my project configurations
# Script follows here:

npm init --yes
npm install --save-dev webpack webpack-cli style-loader css-loader eslint
npm install --save-dev --save-exact prettier
mkdir src dist
cd src
touch index.js
cd ../dist/
touch index.html
printf '<!DOCTYPE html>\n<html lang="en">\n  <head>\n    <meta charset="UTF-8" />\n    <meta http-equiv="X-UA-Compatible" content="IE=edge" />\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <title>Document</title>\n  </head>\n  <body></body>\n  <script src="bundle.js"></script>\n</html>\n' > index.html
cd ..
touch webpack.config.js
printf "const path = require(\'path\');\n\nmodule.exports = {\n  mode: \'development\',\n  entry: \'./src/index.js\',\n  output: {\n    filename: \'bundle.js\',\n    path: path.resolve(__dirname, \'dist\'),\n  },\n  devtool: \'inline-source-map\',\n  module: {\n    rules: [\n      {\n        test: /\.css$/i,\n\n        use: [\'style-loader\', \'css-loader\'],\n      },\n      {\n        test: /\.(png|svg|jpg|jpeg|gif)$/i,\n\n        type: \'asset/resource\',\n      },\n    ],\n  },\n};\n" > webpack.config.js
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

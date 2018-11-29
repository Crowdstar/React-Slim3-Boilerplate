const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
    entry: [
        "@babel/polyfill",
        "./client/src/index.js"
    ],
    output: {
        path: path.join(__dirname, "/public/dist"),
        filename: "bundle.js",
        publicPath: "/"
    },
    devServer: {
        host: "localhost",
        port: 9000,
        historyApiFallback: true
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: ["babel-loader"]
            },
            {
                test: /\.css$/,
                use: ["style-loader", "css-loader"]
            },
            {
                test: /\.(png|woff|woff2|eot|ttf|svg)$/,
                use: ["url-loader"]
            }
        ]
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: "./client/src/index.html"
        })
    ]
};
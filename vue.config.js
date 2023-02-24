const { defineConfig } = require("@vue/cli-service");
const CopyPlugin = require("copy-webpack-plugin");

module.exports = defineConfig({
  transpileDependencies: true,
  css: { extract: false },
  configureWebpack: {
    plugins: [
      new CopyPlugin({
        patterns: [
          { from: "./node_modules/bootstrap-icons/icons/", to: "icons" },
        ],
      }),
    ],
  },
});

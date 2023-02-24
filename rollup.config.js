import vue from "rollup-plugin-vue";
import peerDepsExternal from "rollup-plugin-peer-deps-external";

export default [
  {
    input: "src/index.js",
    output: [
      {
        format: "esm",
        file: "dist/quicker.style.esm.js",
      },
      {
        format: "cjs",
        file: "dist/quicker.style.js",
      },
    ],
    plugins: [vue(), peerDepsExternal()],
  },
];

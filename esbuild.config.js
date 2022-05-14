const path = require("path");
const glob = require("glob").sync;

const browserslist = require("browserslist");
const {
  esbuildPluginBrowserslist: browserslistPlugin,
} = require("esbuild-plugin-browserslist");

// Define entry points.
const entryPoints = [
  "application.ts",
  "xtendui.js",
  "mailtoui.js",
  "hotwire-livereload.ts",
];

// Glob plugin derived from:
// https://github.com/thomaschaaf/esbuild-plugin-import-glob
// https://github.com/xiaohui-zhangxh/jsbundling-rails/commit/b15025dcc20f664b2b0eb238915991afdbc7cb58
const importGlobPlugin = () => ({
  name: "import-glob",
  setup: build => {
    build.onResolve({ filter: /\*/ }, async args => {
      // console.log("resolveDir", args.resolveDir);
      if (args.resolveDir !== "") {
        // console.log("path", args.path);
        return {
          path: args.path,
          namespace: "import-glob",
          pluginData: {
            resolveDir: args.resolveDir,
          },
        };
      }
    });

    build.onLoad({ filter: /.*/, namespace: "import-glob" }, async args => {
      const files = glob(args.path, {
        cwd: args.pluginData.resolveDir,
      }).sort();
      const importsCode = files
        .map((module, index) => `import * as module${index} from './${module}'`)
        .join("; ");
      const exportCode = `export default {${files
        .map(
          (module, index) =>
            `'${path.basename(module)}': module${index}.default`,
        )
        .join(",")}}`;
      const contents =
        [importsCode, exportCode].filter(x => !!x.trim()).join("; ") + ";\n";
      return { contents, resolveDir: args.pluginData.resolveDir };
    });
  },
});

// Build scripts, and output to app/assets/builds.
require("esbuild")
  .build({
    entryPoints: entryPoints.map(name =>
      path.join(process.cwd(), `app/javascript/${name}`),
    ),
    define: {
      global: "window",
    },
    bundle: true,
    sourcemap: true,
    outdir: path.join(process.cwd(), "app/assets/builds"),
    loader: {
      ".png": "file",
      ".jpg": "file",
      ".svg": "file",
      ".woff": "file",
      ".woff2": "file",
      ".ttf": "file",
      ".eot": "file",
    },
    watch: process.argv.includes("--watch"),
    plugins: [
      importGlobPlugin(),
      browserslistPlugin(browserslist(), { printUnknownTargets: false }),
    ],
  })
  .catch(() => process.exit(1));

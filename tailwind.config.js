const defaultTheme = require("tailwindcss/defaultTheme");
const defaultConfig = require("tailwindcss/defaultConfig");
const xtenduiConfig = require("xtendui/tailwind.preset");

module.exports = {
  presets: [defaultConfig, xtenduiConfig],
  content: [
    "./node_modules/xtendui/src/*.mjs",
    "./app/inputs/**/*.rb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{html,html.erb}",
    "./app/components/**/*.{rb,html,html.erb}",
    "./test/components/**/*.rb",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      colors: ({ theme }) => ({
        primary: defaultTheme.colors(theme).indigo,
      }),
      minHeight: defaultTheme.height,
      minWidth: defaultTheme.width,
      xtendui: {
        // overlay: {
        //   component: {
        //     ".xt-scrollbar-overlay-custom": {
        //       overflow: "hidden !important",
        //       ".xt-overlay": {
        //         overflowY: "scroll",
        //       },
        //     },
        //   },
        // },
        // global: {
        //   component: theme => ({
        //     ".xt-overflow-main": {
        //       "&::-webkit-scrollbar": {
        //         width: 7,
        //         background: theme("colors.gray.100"),
        //         borderStyle: "solid",
        //         borderWidth: 0,
        //         borderLeftWidth: 1,
        //         borderColor: theme("colors.gray.200"),
        //       },
        //       "&::-webkit-scrollbar-thumb": {
        //         background: theme("colors.gray.400"),
        //         borderRadius: theme("borderRadius.full"),
        //       },
        //     },
        //     ".dark .xt-overflow-main": {
        //       "&::-webkit-scrollbar": {
        //         background: theme("colors.gray.800"),
        //         borderStyle: "solid",
        //         borderWidth: 0,
        //         borderLeftWidth: 1,
        //         borderColor: theme("colors.gray.700"),
        //       },
        //       "&::-webkit-scrollbar-thumb": {
        //         background: theme("colors.gray.300"),
        //         borderRadius: theme("borderRadius.full"),
        //       },
        //     },
        //   }),
        // },
        button: {
          component: theme => ({
            ".xt-button": {
              paddingTop: theme("spacing.[1.5]"),
              paddingLeft: theme("spacing.3"),
              paddingRight: theme("spacing.3"),
              paddingBottom: theme("spacing[1.5]"),
              borderRadius: theme("borderRadius.md"),
              color: theme("colors.primary.200"),
              backgroundColor: theme("colors.primary.700"),
              fontWeight: theme("fontWeight.semibold"),
              transitionDelay: theme("transitionDelay.DEFAULT"),
              transitionDuration: theme("transitionDuration.DEFAULT"),
              transitionProperty: theme("transitionProperty.opacity"),
              transitionTimingFunction: theme(
                "transitionTimingFunction.DEFAULT",
              ),
              "&:hover": {
                opacity: theme("opacity.80"),
              },
            },
          }),
        },
        typography: {
          utility: theme => ({
            ".xt-h1": {
              fontSize: theme("fontSize.3xl"),
              marginTop: "initial",
              marginBottom: "initial",
            },
            ".xt-h2": {
              marginTop: "initial",
              marginBottom: "initial",
            },
            ".xt-h3": {
              marginTop: "initial",
              marginBottom: "initial",
            },
            ".xt-h4": {
              marginTop: "initial",
              marginBottom: "initial",
            },
            ".xt-h5": {
              marginTop: "initial",
              marginBottom: "initial",
            },
            ".xt-h6": {
              marginTop: "initial",
              marginBottom: "initial",
            },
            ".xt-p": {
              marginTop: "initial",
              marginBottom: "initial",
              fontSize: theme("fontSize.base"),
              fontFamily: theme("fontFamily.sans"),
              fontWeight: theme("fontWeight.normal"),
              lineHeight: theme("lineHeight.6"),
              letterSpacing: theme("letterSpacing.normal"),
              textTransform: "none",
            },
          }),
        },
      },
    },
  },
  darkMode: "class",
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/line-clamp"),
  ],
};

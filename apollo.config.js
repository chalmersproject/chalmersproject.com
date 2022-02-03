module.exports = {
  service: {
    name: "api",
    localSchemaFile: `${__dirname}/lib/graphql/schema.generated.json`,
  },
  client: {
    includes: [
      `${__dirname}/app/components/**/*.{ts,tsx}`,
      `${__dirname}/app/routes/**/*.{ts,tsx}`,
    ],
  },
};

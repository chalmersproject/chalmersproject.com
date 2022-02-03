export const env = process.env.NODE_ENV;
export const isProduction = env === "production";
export const isDevelopment = env === "development";
export const isTest = env === "test";
export const isBrowser = typeof window !== "undefined";
export const apiBaseURL = "http://localhost:8080/api";
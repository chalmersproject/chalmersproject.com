import invariant from "tiny-invariant";

export const meta = (name: string): string => {
  const el = document.head.querySelector(`[name="${name}"][content]`);
  invariant(el, `missing meta tag with name '${name}'`);
  const content = el.getAttribute("content");
  invariant(content, `meta tag with name '${name}' has no content attribute`);
  return content;
};

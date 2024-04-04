import { cva } from "class-variance-authority";

const base =
  "inline-flex font-roboto w-content justify-start gap-4 items-center cursor-pointer transition duration-300";

const button = cva(base, {
  variants: {
    intent: {
      btnNavWhite: [
        "bg-bgGray",
        "text-white",
        "text-lg",
        "border-t-4",
        "border-transparent",
        "hover:border-t-4 ",
        "hover:border-white",
      ],
      btnNavPurple: [
        "bg-bgDarkgray",
        "text-white",
        "text-lg",
        "border-b-4",
        "border-transparent",
        "hover:border-b-4 ",
        "hover:border-purpleBTN",
      ],
    },
    size: {
      small: ["text-base", "py-2", "px-4"],
      medium: ["text-md", "py-3", "px-4", "md:px-8"],
    },
  },
  compoundVariants: [{ intent: "primary", size: "medium" }],
  defaultVariants: {
    intent: "primary",
    size: "medium",
  },
});

export default function Button({ intent, size, className, children, ...rest }) {
  return (
    <button {...rest} className={button({ intent, size, className })}>
      {children}
    </button>
  );
}

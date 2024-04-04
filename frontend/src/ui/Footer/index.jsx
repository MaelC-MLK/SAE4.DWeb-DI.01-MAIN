import { Link } from "react-router-dom";
import { Logo } from "../Components/icons/Logocinetek";


export default function FooterBar() {

  return (
    <footer className="flex flex-row w-full items-center justify-evenly bg-black px-3 py-5 font-roboto md:gap-12 md:px-20 md:py-10">
    <Link to="/">
      <Logo className="hidden md:block h-12 w-28 md:h-16 md:w-40" />
    </Link>
    <div>
      <p className="text-white font-bold">© 2024 LaCinetek</p>
    </div>
    <div className="hidden md:block flex-col gap-1">
      <p className="text-white font-semibold hover:text-red-600 hover:duration-300 duration-300">FAQ / Assistance </p>
      <p className="text-white font-semibold hover:text-red-600 hover:duration-300 duration-300 ">Nous contacter </p>
      <p className="text-white font-semibold hover:text-red-600 hover:duration-300 duration-300">Gestion des cookies </p>
      <p className="text-white font-semibold hover:text-red-600 hover:duration-300 duration-300">CGU / Mentions légales / Politiques de confidentialité </p>
      <p className="text-white font-semibold hover:text-red-600 hover:duration-300 duration-300">Partenaires </p>
    </div>
  </footer>
  );
};


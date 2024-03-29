import { Link } from "react-router-dom";
import { UserCircleIcon } from "../Components/icons/Iconsprofil";
import { MagnifyingGlassIcon } from "../Components/icons/Iconsloupe";
import { Logo } from "../Components/icons/Logocinetek";
import Button from "../Components/button/Button";
import { useState } from "react";
import { useContext } from "react";
import { CatContext } from "../catContext";

export default function NavBar({ retourRecherche, catData }) {
  const [valeurRecherche, setValeurRecherche] = useState("");
  const { selectedCategory, setSelectedCategory } = useContext(CatContext);

  const gererChangement = (event) => {
    setValeurRecherche(event.target.value);
    retourRecherche(event.target.value); // Appeler la fonction de rappel avec la valeur de la recherche
  };

  return (
    <nav className="flex w-full items-center justify-between gap-2 bg-bgGray px-3 font-roboto md:gap-12 md:px-10">
      <Link to="/">
        <Logo className="hidden md:block h-12 w-28 md:h-16 md:w-40" />
      </Link>
      <div className="flex w-full max-w-[50rem] items-center justify-between bg-black px-4 font-roboto font-normal text-white">
        <input
          className="h-12 flex-1 bg-black font-roboto font-normal focus:outline-none"
          type="search"
          placeholder="Rechercher par film, réal, acteur ou liste"
          value={valeurRecherche}
          onChange={gererChangement}
        />
        <MagnifyingGlassIcon className="aspect-square w-10" />
      </div>

      <select
        className="w-content inline-flex cursor-pointer items-center justify-start gap-4 border-t-4 border-transparent bg-bgGray       font-roboto text-white transition duration-300 hover:border-t-4 hover:border-white text-lg py-4 md:px-6"
        value={selectedCategory}
        onChange={(e) => setSelectedCategory(e.target.value)}
      >
        <option value="">Tous les films</option>
        {Array.isArray(catData) &&
          catData.map((category) => (
            <option key={category.id} value={category.id}>
              {category.name}
            </option>
          ))}
      </select>
      <Link to="http://localhost:8080/register" className="inline-block">
        <Button intent="btnNavWhite" className="whitespace-nowrap">
          <UserCircleIcon className="h-8 w-8 transition-transform hover:scale-90" />
          <p id="text_log" className="hidden md:flex">
            Se connecter
          </p>
        </Button>
      </Link>
    </nav>
  );
}

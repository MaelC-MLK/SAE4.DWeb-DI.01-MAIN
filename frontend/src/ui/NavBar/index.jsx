import { Link } from "react-router-dom";
import { UserCircleIcon } from "../Components/icons/Iconsprofil";
import { MagnifyingGlassIcon } from "../Components/icons/Iconsloupe";
import { Logo } from "../Components/icons/Logocinetek";
import Button from "../Components/button/Button";
import { useState } from "react";
import { useContext } from "react";
import { CatContext } from "../catContext";
import Cookies from "js-cookie";

export default function NavBar({ retourRecherche, catData }) {
  const [valeurRecherche, setValeurRecherche] = useState("");
  const { selectedCategory, setSelectedCategory } = useContext(CatContext);
  const userCookie = Cookies.get("user");
  const tokenCookie = Cookies.get("token");

  const gererChangement = (event) => {
    setValeurRecherche(event.target.value);
    retourRecherche(event.target.value); 
  };

  return (
    <nav className="z-50 flex w-full items-center justify-between bg-bgGray px-3 font-roboto shadow-2xl md:gap-12 md:px-10">
      <Link to="/">
        <Logo className="hidden h-12 w-28 lg:block md:h-16 md:w-40" />
      </Link>
      <div className="flex w-full max-w-[50rem] items-center justify-between bg-black md:px-4 font-roboto font-normal text-white">
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
        className="w-content inline-flex cursor-pointer items-center justify-start md:gap-4 border-t-4 border-transparent bg-bgGray  py-4 font-roboto text-lg text-white transition duration-300 hover:border-t-4 hover:border-white md:px-6"
        value={selectedCategory}
        onChange={(e) => setSelectedCategory(e.target.value)}
      >
        <option>Tous les films</option>
        {Array.isArray(catData) &&
          catData.map((category) => (
            <option key={category.id} value={category.id}>
              {category.name}
            </option>
          ))}
      </select>
      {userCookie && tokenCookie ? (
        <div className="inline-block">
          <Link to="http://localhost:8090/profil" className="inline-block">
            <Button intent="btnNavWhite" className="whitespace-nowrap">
              <UserCircleIcon className="h-8 w-8 transition-transform hover:scale-90" />
              <p className=" hidden md:block">
                {" "}
                {JSON.parse(userCookie).pseudo}{" "}
              </p>
            </Button>
          </Link>
        </div>
      ) : (
        <Link to="http://localhost:8090/login" className="inline-block">
          <Button intent="btnNavWhite" className="whitespace-nowrap">
            <UserCircleIcon className="h-8 w-8 transition-transform hover:scale-90" />
            <p className="hidden md:block"> Se connecter</p>
          </Button>
        </Link>
      )}
    </nav>
  );
}

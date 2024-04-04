import NavBar from "../ui/NavBar";
import { Outlet } from "react-router-dom";
import { SearchContext } from "../ui/searchContext/index";
import { useState } from "react";
import { useEffect } from "react";
import { fetchAllCatData } from "../lib/loaders";
import { CatContext } from "../ui/catContext/index";
import FooterBar from "../ui/Footer";

export async function loader() {
    const catData = await fetchAllCatData();
    return { catData };
  }


export default function () {
  const [valeurRecherche, setValeurRecherche] = useState("");
  const [selectedCategory, setSelectedCategory] = useState();
  const [catData, setCatData] = useState([]);

useEffect(() => {
  async function fetchCatData() {
    const data = await loader();
    setCatData(data.catData);
  }

  fetchCatData();
}, []);


  const retourRecherche = (valeur) => {
    setValeurRecherche(valeur);
  };
  return (
    <>
    <section className="flex-grow min-h-screen mx-auto flex flex-row flex-wrap justify-center bg-bgDarkgray">
      <SearchContext.Provider value={valeurRecherche}>
        <CatContext.Provider value={{ selectedCategory, setSelectedCategory }}>
          <NavBar 
            retourRecherche={retourRecherche} 
            catData={catData} 
          />
          <Outlet />
          <FooterBar />
        </CatContext.Provider>
      </SearchContext.Provider>
    </section>
    </>
  );
}
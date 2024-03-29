import { Link, useLoaderData } from "react-router-dom";
import { fetchAllMovieData, fetchAllCatData } from "../lib/loaders";
import Card from "../ui/Card/Card";
import { SearchContext } from "../ui/searchContext/index";
import { CatContext } from "../ui/catContext/index";
import { useContext } from "react";

export async function loader() {
  const movieData = await fetchAllMovieData();
  const catData = await fetchAllCatData();
  return { movieData, catData };
}

export default function () {
  const { movieData, catData } = useLoaderData();
  const { selectedCategory } = useContext(CatContext);
  const valeurRecherche = useContext(SearchContext);

  let moviesToDisplay = movieData;

  if (selectedCategory) {
    const selectedCategoryData = catData.find(
      (category) => category.id === parseInt(selectedCategory),
    );
    moviesToDisplay =
      selectedCategoryData && Array.isArray(selectedCategoryData.movies)
        ? selectedCategoryData.movies.map((movie) => {
            const fullMovieData = movieData.find((m) => m.id === movie.id);
            return { ...movie, ...fullMovieData };
          })
        : movieData;
  }

  if (valeurRecherche) {
    moviesToDisplay = moviesToDisplay.filter((movie) =>
      movie.name.toLowerCase().includes(valeurRecherche.toLowerCase()),
    );
  }

  return (
    <section className="mx-10 mb-20 flex w-full flex-col items-start">
      <div className="mx-auto mt-10 flex flex-row flex-wrap justify-center gap-8 bg-bgDarkgray">
        {moviesToDisplay.map((movie) => (
          <Link to={`/movie/${movie.id}`}>
            <Card
              key={movie.id}
              name={movie.name}
              year={movie.year}
              realisateur={movie.realisateur}
              img={movie.img}
              duree={movie.duree}
            />
          </Link>
        ))}
      </div>
    </section>
  );
}

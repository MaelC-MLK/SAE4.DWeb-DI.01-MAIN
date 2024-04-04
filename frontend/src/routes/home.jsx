import { Link, useLoaderData } from "react-router-dom";
import { fetchAllMovieData, fetchAllCatData } from "../lib/loaders";
import Card from "../ui/Card/Card";
import { SearchContext } from "../ui/searchContext/index";
import { CatContext } from "../ui/catContext/index";
import { useContext } from "react";
import { fetchMovieFront } from "../lib/loaders";
import { Carousel } from "react-responsive-carousel";
import { CalendarDaysIcon } from "../ui/Components/icons/Iconscalendar";
import { ClockIcon } from "../ui/Components/icons/Iconstime";
import "react-responsive-carousel/lib/styles/carousel.min.css";
import { useState } from "react";
import { useEffect } from "react";
import Cookies from 'js-cookie';


export async function loader() {
  const movieData = await fetchAllMovieData();
  const catData = await fetchAllCatData();
  const MovieFront = await fetchMovieFront();
  return { movieData, catData, MovieFront };
}

export default function () {
  const { movieData, catData, MovieFront } = useLoaderData();
  const { selectedCategory } = useContext(CatContext);
  const valeurRecherche = useContext(SearchContext);
  const [currentPage, setCurrentPage] = useState(1);
  const moviesPerPage = 30;

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

  const indexOfLastMovie = currentPage * moviesPerPage;
  const indexOfFirstMovie = indexOfLastMovie - moviesPerPage;
  const currentMovies = moviesToDisplay.slice(
    indexOfFirstMovie,
    indexOfLastMovie,
  );

  useEffect(() => {
    if (!localStorage.getItem("alreadyReloaded")) {
      window.location.reload();
      localStorage.setItem("alreadyReloaded", true);
    }
  }, []);

  const totalPages = Math.ceil(moviesToDisplay.length / moviesPerPage);

  const handleNextPage = () => {
    if (currentPage < totalPages) {
      setCurrentPage(currentPage + 1);
    }
  };

  const handlePreviousPage = () => {
    if (currentPage > 1) {
      setCurrentPage(currentPage - 1);
    }
  };

  useEffect(() => {
    setCurrentPage(1);
  }, [valeurRecherche, selectedCategory]);

  return (
    <section className="mx-10 mb-20 flex w-full flex-col items-start">
      {!valeurRecherche && !selectedCategory && (
        <div>
          <h2 className="ml-24 mt-10 text-4xl font-bold text-white">
            Films à l'affiche
          </h2>
          <div className="mb-10 mt-10 flex flex-row flex-wrap justify-center gap-8 bg-bgDarkgray md:mx-28 lg:mx-40">
            <Carousel showArrows={true} autoPlay={true} infiniteLoop={true}>
              {MovieFront.map((movie, index) => (
                <div key={index}>
                  <Link to={`/movie/${movie.id}`}>
                    <img
                      className="object h-[40rem] object-cover"
                      src={`/${movie.img}`}
                      alt={`${movie.name}`}
                    />
                    <div className="absolute inset-0 bg-gradient-to-b from-transparent to-black"></div>
                  </Link>
                  <div className="absolute bottom-24 left-20 flex flex-col items-center gap-4 text-white md:items-start">
                    <h2 className="text-2xl font-bold lg:text-5xl">
                      {movie.name}
                    </h2>
                    <p className="text-base font-semibold lg:text-xl">
                      de {movie.realisateur}
                    </p>
                    <div className="flex flex-row items-center gap-6">
                      <div className="flex flex-row items-center gap-2">
                        <CalendarDaysIcon className="h-5 w-5" />
                        <p className="text-base font-semibold md:text-lg">
                          {" "}
                          {movie.year}
                        </p>
                      </div>
                      <div className="flex flex-row items-center gap-2">
                        <ClockIcon className="h-5 w-5" />
                        <p className="text-base font-semibold md:text-lg">
                          {" "}
                          {movie.duree}
                        </p>
                      </div>
                    </div>
                    <p className="mr-20 text-sm font-medium md:text-base">
                      {movie.description}
                    </p>
                  </div>
                </div>
              ))}
            </Carousel>
          </div>
        </div>
      )}

      {moviesToDisplay.length > 0 && (
        <h2 className="mb-10 ml-24 mt-10 text-4xl font-bold text-white">
          Nos Films
        </h2>
      )}

      {valeurRecherche && moviesToDisplay.length === 0 && (
        <div className="mx-auto flex h-screen items-center justify-center">
          <h2 className="ml-24 mt-10 text-2xl font-bold text-white">
            Aucun film ne correspond à votre recherche
          </h2>
        </div>
      )}
      <div className="flex flex-col">
        <div className="mx-auto mt-10 flex flex-row flex-wrap justify-center gap-8 bg-bgDarkgray">
          {currentMovies.map((movie) => {
            const user = Cookies.get("user");
            const linkPath = user ? `/movie/${movie.id}` : "/login";

            return (
              <Link to={linkPath}>
                <Card {...movie} />
              </Link>
            );
          })}
        </div>
        <div className="mt-4 flex justify-center gap-3">
          <button
            onClick={handlePreviousPage}
            disabled={currentPage === 1}
            className="rounded bg-red-500 px-3 py-1 text-white duration-300 hover:bg-red-600 hover:duration-300 disabled:opacity-50"
          >
            Précédent
          </button>
          <span className="flex items-center justify-center rounded bg-red-500 px-2 py-1 text-lg font-semibold text-white">
            {currentPage}
          </span>
          <button
            onClick={handleNextPage}
            disabled={currentPage === totalPages}
            className="rounded bg-red-500 px-3 py-1 text-white duration-300 hover:bg-red-600 hover:duration-300 disabled:opacity-50"
          >
            Suivant
          </button>
        </div>
      </div>
    </section>
  );
}

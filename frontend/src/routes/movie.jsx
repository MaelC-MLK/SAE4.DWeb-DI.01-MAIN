import { useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import { fetchByMovieData } from "../lib/loaders";
import { CalendarDaysIcon } from "../ui/Components/icons/Iconscalendar";
import { ClockIcon } from "../ui/Components/icons/Iconstime";
import Cookies from 'js-cookie';


export default function Movie() {
  const { id } = useParams();
  const [movie, setMovie] = useState(null);


  const handleAddToWatchlist = async () => {
    const user = JSON.parse(Cookies.get('user'));
    const response = await fetch(`http://localhost:8080/api/watchlist/user/${user.id}/movie/${id}/add`, {
      method: 'POST',
    });
  
    if (response.ok) {
      alert('Movie added to watchlist successfully');
    } else {
      alert('Failed to add movie to watchlist');
    }
  };

  useEffect(() => {
    const loadMovie = async () => {
      const data = await fetchByMovieData(id);
      setMovie(data);
    };

    loadMovie();
  }, [id]);

  if (!movie) {
    return <div>Chargement...</div>;
  }

  return (
    <div className="flex flex-col gap-32 mb-20 items-center justify-center text-white">
      <div className="flex flex-col gap-10 relative">
        <div className="relative mx-auto h-[35rem] w-[80rem]">
          <img
            className="absolute inset-0 h-full w-full object-cover"
            src={`/${movie.img}`}
            alt={movie.name}
          />
          <div className="absolute inset-0 bg-gradient-to-b from-transparent to-black"></div>
        </div>
        <div className="absolute left-20 bottom-24 flex flex-col gap-4">
          <h2 className="font-bold text-5xl">{movie.name}</h2>
          <p className="font-semibold text-xl">de {movie.realisateur}</p>
          <div className="flex flex-row items-center gap-6">
            <div className="flex flex-row items-center gap-2">
              <CalendarDaysIcon className="h-5 w-5" />
              <p className="text-lg font-semibold"> {movie.year}</p>
            </div>
            <div className="flex flex-row items-center gap-2">
              <ClockIcon className="h-5 w-5" />
              <p className="text-lg font-semibold"> {movie.duree}</p>
            </div>
          </div>
          <p className="font-medium mr-20">{movie.description}</p>
        </div>
        <button className="w-full rounded bg-red-500 px-4 py-2 text-white duration-300 hover:bg-red-700 hover:duration-300" onClick={handleAddToWatchlist}>Mettre dans votre Watchlist</button>
      </div>
      <iframe
        className="w-[80rem] h-[45rem]"
        src={movie.lien}
      ></iframe>
    </div>
  );
}

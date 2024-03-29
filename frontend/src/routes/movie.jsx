import { useParams } from 'react-router-dom';
import { useEffect, useState } from 'react';
import { fetchByMovieData } from '../lib/loaders';
import { CalendarDaysIcon } from '../ui/Components/icons/Iconscalendar';
import { ClockIcon } from '../ui/Components/icons/Iconstime';

export default function Movie() {
  const { id } = useParams();
  const [movie, setMovie] = useState(null);

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
    <div className='flex flex-col items-center justify-center'>
      <div>
      <img className='mx-auto w-[80rem] h-[35rem] object-cover' src={`/${movie.img}`} alt={movie.name} />
      <div className=' text-white'>
      <h2>{movie.name}</h2>
      <p>{movie.realisateur}</p>
      <div className='flex flex-row gap-6 items-center'>
      <div className='flex flex-row gap-2 items-center'>
      <CalendarDaysIcon className="h-5 w-5" />
      <p className="text-xl font-semibold"> {movie.year}</p>
      </div>
      <div className='flex flex-row gap-2 items-center'>
      <ClockIcon className="h-5 w-5" />
      <p className="text-xl font-semibold"> {movie.duree}</p>
      </div>
      </div>
      </div>
      </div>
      <iframe src={movie.lien} title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
    </div>
  );
}
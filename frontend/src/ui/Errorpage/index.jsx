import React from 'react';
import { Link, useRouteError } from 'react-router-dom';

export default function ErrorPage() {
    const error = useRouteError();
    console.error(error);


  return (
    <div className="flex flex-col items-center gap-10 justify-center min-h-screen text-center bg-bgGray">
      <h1 className="animate-bounce text-6xl font-bold text-white">Oups, Il y a un soucis !</h1>
      <h2 className="animate-pulse mt-2 text-4xl text-white">Erreur {error.statusText}</h2>
      <p className="animate-fadeInUp max-w-md mt-4 text-lg text-white">
        {error.message}
      </p>
      <Link to="/" className="animate-fadeInUp mt-6 px-4 py-2 text-lg font-bold text-white bg-redBTN rounded-full hover:bg-red-800 transition duration-500 ease-in-out transform hover:-translate-y-1 hover:scale-110">
  Retournez à la page d'accueil
</Link>
    </div>
  );
}
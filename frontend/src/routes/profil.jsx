import React from "react";
import Cookies from "js-cookie";
import { fetchWatchlishByUser } from "../lib/loaders";
import { useEffect, useState } from "react";
import Card from "../ui/Card/Card";
import { Link } from "react-router-dom";


export async function loader() {
  const watchlistData = await fetchWatchlishByUser(
    JSON.parse(Cookies.get("user")).id,
  );
  return { watchlistData };
}

export default function ProfilDetail() {
  const [watchlistData, setWatchlistData] = useState([]);
  const [isWatchlistDeleted, setIsWatchlistDeleted] = useState(false);
  const userCookie = Cookies.get("user");
  const tokenCookie = Cookies.get("token");
  const user = userCookie ? JSON.parse(userCookie) : null;

  useEffect(() => {
    if (user && !isWatchlistDeleted) {
      fetchWatchlishByUser(user.id)
        .then((data) => setWatchlistData(data))
        .catch((error) => console.error(error));
    }
  }, [user, isWatchlistDeleted]);

  const deleteWatchlist = async () => {
    const user = JSON.parse(Cookies.get('user'));

    const response = await fetch(`http://localhost:8080/api/watchlist/user/${user.id}/delete`, {
      method: 'DELETE',
    });

    if (response.ok) {
      setIsWatchlistDeleted(true);
    } else {
      console.error('Failed to delete watchlist');
    }
  };

  const handleLogout = () => {
    Cookies.remove("user");
    Cookies.remove("token");
    window.location.href = "/";
  };

  return (
    <>
      <section className="my-20 flex text-white">
        <div className="flex w-screen flex-col lg:flex-row items-center lg:items-start justify-center gap-40">
          <div className="flex flex-col items-center justify-center gap-12 rounded-2xl border-2 border-gray-500 p-10 px-20">
            <img className="w-32 rounded-full" src="/profil.png" alt="" />
            <div className="flex flex-col items-center justify-center gap-5">
              <h3 className=" text-2xl font-semibold">
                Bienvenue, {JSON.parse(userCookie).pseudo}
              </h3>
              <p>{user ? user.email : "Pas d'email"}</p>
            </div>
            <button
              onClick={handleLogout}
              className="rounded bg-red-500 px-4 py-2 font-bold text-white duration-300 hover:bg-red-700 hover:duration-300"
            >
              Se déconnecter
            </button>
            <button
              onClick={deleteWatchlist}
              className="rounded bg-red-500 px-4 py-2 font-bold text-white duration-300 hover:bg-red-700 hover:duration-300"
            >
              Supprimer la watchlist
            </button>
          </div>
          <div>
            <div className="flex flex-col items-center justify-center gap-12 rounded-2xl border-2 border-gray-500 p-10">
              <h2 className="rounded bg-red-500 px-4 py-2 text-lg font-semibold text-white duration-300 hover:bg-red-700 hover:duration-300">
                Votre Watchlist 
              </h2>

              {Array.isArray(watchlistData.movies) &&
                watchlistData.movies.map((item) => (
                  <Link to={`/movie/${item.id}`}>
                    <Card {...item} />
                  </Link>
                ))}
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
